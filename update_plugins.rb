#!/usr/bin/env ruby

require "uri"

def clone_plugin_repo(repo_path)
  repo_name = URI.parse(repo_path).path.gsub(/\/.*\//, "").gsub(/\.git/, "")
  p "Cloning #{repo_name}"
  %x[git clone #{repo_path}]
  %x[rm -rf #{repo_name}/.git]
end

PLUGINS_DIR = "plugins" 
if Dir.exists? PLUGINS_DIR
  File.rename(PLUGINS_DIR, "#{PLUGINS_DIR}-old")
  Dir.mkdir(PLUGINS_DIR)
  Dir.chdir("./#{PLUGINS_DIR}")
  [
    "https://github.com/mileszs/ack.vim.git",
    "https://github.com/markabe/bufexplorer.git",
    "https://github.com/vim-scripts/bufkill.vim.git",
    "https://github.com/wincent/Command-T.git",
    "https://github.com/godlygeek/csapprox.git",
    "https://github.com/Raimondi/delimitMate.git",
    "https://github.com/othree/html5.vim.git",
    "https://github.com/mhz/vim-matchit.git",
    "https://github.com/scrooloose/nerdcommenter.git",
    "https://github.com/scrooloose/nerdtree.git",
    "https://github.com/msanders/snipmate.vim.git",
    "https://github.com/vim-scripts/Specky.git",
    "https://github.com/scrooloose/syntastic.git",
    "https://github.com/vim-scripts/taglist.vim.git",
    "https://github.com/vim-scripts/TailMinusF.git",
    "https://github.com/tpope/vim-bundler.git",
    "https://github.com/kchmck/vim-coffee-script.git",
    "https://github.com/altercation/vim-colors-solarized.git",
    "https://github.com/tpope/vim-cucumber.git",
    "https://github.com/gaving/vim-easygrep.git",
    "https://github.com/tpope/vim-endwise.git",
    "https://github.com/tpope/vim-fugitive.git",
    "https://github.com/tpope/vim-git.git",
    "https://github.com/tpope/vim-haml.git",
    "https://github.com/pangloss/vim-javascript.git",
    "https://github.com/itspriddle/vim-jquery.git",
    "https://github.com/leshill/vim-json.git",
    "https://github.com/tpope/vim-markdown.git",
    "https://github.com/tpope/vim-ragtag.git",
    "https://github.com/tpope/vim-rails.git",
    "https://github.com/tpope/vim-rake.git",
    "https://github.com/tpope/vim-repeat.git",
    "https://github.com/hallison/vim-ruby-sinatra.git",
    "https://github.com/vim-ruby/vim-ruby.git",
    "https://github.com/tsaleh/vim-supertab.git",
    "https://github.com/tpope/vim-surround.git",
    "https://github.com/tpope/vim-unimpaired.git",
    "https://github.com/chrismetcalf/vim-yankring.git",
    "https://github.com/mattn/zencoding-vim.git",
    "https://github.com/wlangstroth/vim-racket.git"
  ].each do |plugin_repo|
    clone_plugin_repo(plugin_repo)
  end
  puts "Things you need to do now:"
  puts "1. Command-T needs to have it's native extension built"
  puts "2. vim-coffee-script needs to have a couple of files renamed, after/syntax/html.vim and after/syntax/haml.vim, rename these so you have html-coffee.vim and haml-coffee.vim, otherwise they interfer with html syntax highlighting"
  puts "3. Delete the plugins-old directory if everything seems to be working well"
else
  puts "Can't find plugins directory"
end
