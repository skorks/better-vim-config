
require 'rspec/core/formatters/base_text_formatter'

### SpeckyFormatter: A basic RSpec 2.x text formatter, to be used
### with the 'Specky' vim plugin (or from the command line, if you
### dig it over the default 'documentation' format!)
###
### rspec -r /path/to/this/specky_formatter.rb -f SpeckyFormatter specs
###
class SpeckyFormatter < RSpec::Core::Formatters::BaseTextFormatter

	def initialize( *args )
		super
		@indent_level  = 0
		@failure_index = 0
		@failures      = []
		@txt           = ''
		@summary       = ''
	end


	########################################################################
	### R S P E C  H O O K S
	########################################################################

	### Example group hook -- increase indentation, emit description
	###
	def example_group_started( example_group )
		self.out '+', '-' * (example_group.description.length + 2), '+'
		self.out '| ', example_group.description, ' |'
		self.out '+', '-' * (example_group.description.length + 2), '+'
		@indent_level += 1
	end


	### Example group hook -- decrease indentation
	###
	def example_group_finished( example_group )
		@indent_level -= 1
	end


	### Called on example success
	###
	def example_passed( example )
		msg = self.format_example( example )
		msg << ')'
		self.out msg
	end


	### Called on a pending example
	###
	def example_pending( example )
		msg = self.format_example( example )
		pending_msg = example.metadata[ :execution_result ][ :pending_message ]
		msg << ", PENDING%s)" % [ ": #{pending_msg}" || '' ]
		self.out msg
	end


	### Called on example failure
	###
	def example_failed( example )
		@failure_index += 1
		msg = self.format_example( example )
		msg << ", FAILED - #%d)" % [ @failure_index ]
		self.out msg

		@failures << example
	end


	### Called after all examples are run.  Emit details for each failed example,
	### for Vim to fold.
	###
	def dump_failures
		self.out "\n" unless @failures.empty?

		@failures.each_with_index do |example, index|
			desc      = example.metadata[ :full_description ]
			exception = example.execution_result[ :exception ]
			file = line = nil

			if exception.backtrace.first =~ /(.*):(\d+)/
				file, line = $1, $2.to_i
			end
			self.out "FAILURE - #%d)" % [ index + 1 ]
			self.out "%s:%d" % [ file, line ]

			if RSpec::Core::PendingExampleFixedError === exception
				self.out "%s FIXED" % [ desc ]
				self.out "Expected pending '%s' to fail.  No error was raised." % [
					example.metadata[ :execution_result ][ :pending_message ]
				]
			else
				self.out desc
				self.out "Failure/Error: %s" %  [ read_failed_line( exception, example).strip ]
				exception.message.split("\n").each {|l| self.out l}

				# logic taken from the base class
				example.example_group.ancestors.push(example.example_group).each do |group|
					if group.metadata[:shared_group_name]
						self.out "Shared Example Group: \"#{group.metadata[:shared_group_name]}\" called from " +
							"#{backtrace_line(group.metadata[:example_group][:location])}"
						break
					end
				end
			end

			self.out exception_source( file, line ) if file && line
		end
	end


	### Emit the source of the exception, with context lines.
	###
	def exception_source( file, line )
		context = ''
		low, high = line - 3, line + 3

		File.open( file ).each_with_index do |cline, i|
			cline.chomp!.rstrip!
			next unless i >= low && i <= high
			context << "  %s%4d: %s\n" % [ ( i == line ? '>>' : ' |' ), i, cline ]
		end

		return context

	rescue
		'Unable to parse exception context lines.'
	end


	### Emit summary data for all examples.
	###
	def dump_summary( duration, example_count, failure_count, pending_count )
		succeeded = example_count - failure_count - pending_count
		@summary << "+%s+\n" % [ '-' * 49 ]
		@summary << "|%s-- Summary --%s|\n" % [ ' ' * 18, ' ' * 18 ]
		@summary << "+----------+-----------+--------+---------+-------+\n"
		@summary << "| Duration | Succeeded | Failed | Pending | Total |\n"
		@summary << "+----------+-----------+--------+---------+-------+\n"

		@summary << "| %7ss | %9s | %6s | %7s | %5s |\n" % [
			"%0.3f" % duration, succeeded, failure_count,
			pending_count, example_count
		]

		@summary << "+----------+-----------+--------+---------+-------+\n\n"
	end


	### End of run.  Dump it all out!
	###
	def close
		output.puts @summary
		output.puts @txt
	end


	#########
	protected
	#########

	### Send a string to the output IO object, after indentation.
	###
	def out( *msg )
		msg = msg.join
		@txt << "%s%s\n" % [ '  ' * @indent_level, msg ]
	end

	### Format the basic example information, along with the run duration.
	###
	def format_example( example )
		metadata    = example.metadata
		duration    = metadata[ :execution_result ][ :run_time ]
		description = metadata[ :description ]
		return "| %s (%0.3fs" % [ description, duration ]
	end
end # SpeckyFormatter

