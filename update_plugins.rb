#!/usr/bin/env ruby

require "uri"

def clone_plugin_repo(repo_path)
  repo_name = URI.parse(repo_path).path.gsub(/\/.*\//, "").gsub(/\.git/, "")
  p "Cloning #{repo_name}"
  %x[git clone #{repo_path}]
  %x[rm -rf #{repo_name}/.git]
  if repo_name == "vim-coffee-script"
    #rename some files otherwise they interfere with html highlighting for some reason
    %x[mv #{repo_name}/after/syntax/html.vim #{repo_name}/after/syntax/html-coffee.vim]
    %x[mv #{repo_name}/after/syntax/haml.vim #{repo_name}/after/syntax/haml-coffee.vim]
  end
end

PLUGINS_DIR = "plugins"
if Dir.exists? PLUGINS_DIR
  File.rename(PLUGINS_DIR, "#{PLUGINS_DIR}-old")
  Dir.mkdir(PLUGINS_DIR)
  Dir.chdir("./#{PLUGINS_DIR}")
  [
    "https://github.com/altercation/vim-colors-solarized.git",
    "https://github.com/tpope/vim-fugitive.git",
    "https://github.com/scrooloose/nerdcommenter.git",
    "https://github.com/scrooloose/nerdtree.git",
    "https://github.com/tpope/vim-rails.git",
    "https://github.com/tpope/vim-rake.git",
    "https://github.com/tpope/vim-surround.git",
    "https://github.com/tpope/vim-unimpaired.git",
    "https://github.com/vim-ruby/vim-ruby.git",
    "https://github.com/hallison/vim-ruby-sinatra.git",
    "https://github.com/tpope/vim-bundler.git",
    "https://github.com/tpope/vim-repeat.git",
    "https://github.com/kien/ctrlp.vim.git",
    "https://github.com/Shougo/neocomplcache.git",
    "https://github.com/scrooloose/syntastic.git",
    "https://github.com/Lokaltog/vim-easymotion.git",
    "https://github.com/vim-scripts/YankRing.vim.git",
    "https://github.com/mileszs/ack.vim.git",
    "https://github.com/markabe/bufexplorer.git",
    "https://github.com/vim-scripts/bufkill.vim.git",
    "https://github.com/othree/html5.vim.git",
    "https://github.com/Raimondi/delimitMate.git",
    "https://github.com/godlygeek/csapprox.git",
    "https://github.com/vim-scripts/TailMinusF.git",
    "https://github.com/tpope/vim-endwise.git",
    "https://github.com/tpope/vim-cucumber.git",
    "https://github.com/tpope/vim-haml.git",
    "https://github.com/pangloss/vim-javascript.git",
    "https://github.com/itspriddle/vim-jquery.git",
    "https://github.com/leshill/vim-json.git",
    "https://github.com/tpope/vim-markdown.git",
    "https://github.com/wlangstroth/vim-racket.git",
    "https://github.com/mattn/zencoding-vim.git",
    "https://github.com/kchmck/vim-coffee-script.git",
    "https://github.com/tsaleh/vim-supertab.git",
    "https://github.com/vim-scripts/EasyGrep.git",
    "https://github.com/skorks/vim-matchit.git",
    "https://github.com/mutewinter/nginx.vim.git",
    "https://github.com/ChrisYip/Better-CSS-Syntax-for-Vim.git",
    "https://github.com/groenewege/vim-less.git",
    "https://github.com/mutewinter/vim-indent-guides.git",
    "https://github.com/tpope/vim-speeddating.git",
    "https://github.com/spiiph/vim-space.git",
    "https://github.com/majutsushi/tagbar.git",
    "https://github.com/sjl/splice.vim.git",
    "https://github.com/kana/vim-textobj-user.git",
    "https://github.com/nelstrom/vim-textobj-rubyblock.git",
    "https://github.com/bronson/vim-ruby-block-conv.git",
    "https://github.com/bronson/vim-ruby-block-conv.git",
    "https://github.com/rking/ag.vim",
    "https://github.com/terryma/vim-multiple-cursors.git",
    "https://github.com/slim-template/vim-slim.git",
    "https://github.com/vim-scripts/Align.git",
    "https://github.com/Shougo/neosnippet.vim.git",
    "https://github.com/honza/vim-snippets.git"
  ].each do |plugin_repo|
    clone_plugin_repo(plugin_repo)
  end
  puts "Things you need to do now:"
  puts "1. Delete the plugins-old directory if everything seems to be working well"
  puts "2. Move the snipmate snippets from the old snipmate plugin into the new one"
else
  puts "Can't find plugins directory"
end
