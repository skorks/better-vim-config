#!/usr/bin/env ruby

require "uri"

CURRENT_FILE_DIR = File.expand_path(File.dirname(__FILE__))
LOCAL_PLUGIN_DIR = "#{CURRENT_FILE_DIR}/.vim/plugins"
PLUGINS = {
  "vim-pathogen"                    => "https://github.com/tpope/vim-pathogen.git",
  "vim-airline"                     => "https://github.com/bling/vim-airline.git",
  "vim-airline-cwd"                 => "https://github.com/ompugao/vim-airline-cwd.git",
  "vim-buffergator"                 => "https://github.com/jeetsukumaran/vim-buffergator.git",
  "vim-commentary"                  => "https://github.com/tpope/vim-commentary.git",
  "ag.vim"                          => "https://github.com/rking/ag.vim.git",
  "nerdtree"                        => "https://github.com/scrooloose/nerdtree.git",
  "nerdtree-git-plugin"             => "https://github.com/Xuyuanp/nerdtree-git-plugin.git",
  "peaksea"                         => "https://github.com/vim-scripts/peaksea.git",
  "ctrlp.vim"                       => "https://github.com/kien/ctrlp.vim.git",
  "vim-fugitive"                    => "https://github.com/tpope/vim-fugitive.git",
  "vim-gitgutter"                   => "https://github.com/airblade/vim-gitgutter.git",
  "vim-repeat"                      => "https://github.com/tpope/vim-repeat.git",
  "vim-easymotion"                  => "https://github.com/easymotion/vim-easymotion.git",
  "syntastic"                       => "https://github.com/scrooloose/syntastic.git",
  "vim-rails"                       => "https://github.com/tpope/vim-rails.git",
  "vim-bundler"                     => "https://github.com/tpope/vim-bundler.git",
  "vim-endwise"                     => "https://github.com/tpope/vim-endwise.git",
  "vim-surround"                    => "https://github.com/tpope/vim-surround.git",
  "matchit"                         => "https://github.com/tmhedberg/matchit.git",
  "vim-unimpaired"                  => "https://github.com/tpope/vim-unimpaired.git",
  "vim-rake"                        => "https://github.com/tpope/vim-rake.git",
  "vim-markdown"                    => "https://github.com/plasticboy/vim-markdown.git",
  "vim-multiple-cursors"            => "https://github.com/terryma/vim-multiple-cursors.git",
  "vim-coffee-script"               => "https://github.com/kchmck/vim-coffee-script.git",
  "delimitMate"                     => "https://github.com/Raimondi/delimitMate.git",
  "nginx.vim"                       => "https://github.com/vim-scripts/nginx.vim.git",
  "vim-ruby"                        => "https://github.com/vim-ruby/vim-ruby.git",
  "vim-slim"                        => "https://github.com/slim-template/vim-slim.git",
  "vim-haml"                        => "https://github.com/tpope/vim-haml.git",
  "css.vim"                         => "https://github.com/JulesWang/css.vim.git",
  "vim-css3-syntax"                 => "https://github.com/hail2u/vim-css3-syntax.git",
  "vim-less"                        => "https://github.com/groenewege/vim-less.git",
  "html5.vim"                       => "https://github.com/othree/html5.vim.git",
  "vim-cucumber"                    => "https://github.com/tpope/vim-cucumber.git",
  "vim-node"                        => "https://github.com/moll/vim-node.git",
  "vim-json"                        => "https://github.com/elzr/vim-json.git",
  "vim-indent-guides"               => "https://github.com/nathanaelkane/vim-indent-guides.git",
  "vim-textobj-user"                => "https://github.com/kana/vim-textobj-user.git",
  "vim-textobj-rubyblock"           => "https://github.com/nelstrom/vim-textobj-rubyblock.git",
  "supertab"                        => "https://github.com/ervandew/supertab.git",
  "vim-easy-align"                  => "https://github.com/junegunn/vim-easy-align.git",
  "vim-mustache-handlebars"         => "https://github.com/mustache/vim-mustache-handlebars.git",
  "YankRing.vim"                    => "https://github.com/vim-scripts/YankRing.vim.git",
  "undotree"                        => "https://github.com/mbbill/undotree.git",
  "Dockerfile.vim"                  => "https://github.com/ekalinin/Dockerfile.vim.git",
  "yajs.vim"                        => "https://github.com/othree/yajs.vim.git",
  "vim-js-indent"                   => "https://github.com/gavocanov/vim-js-indent.git",
  "javascript-libraries-syntax.vim" => "https://github.com/othree/javascript-libraries-syntax.vim.git",
  "vim-jsx"                         => "https://github.com/mxw/vim-jsx.git",
}


def clone_plugin_repo(repo_name, repo_path)
  p "Cloning #{repo_name}"
  %x[git clone #{repo_path} "#{LOCAL_PLUGIN_DIR}/#{repo_name}"]
  ungit("#{LOCAL_PLUGIN_DIR}/#{repo_name}")
end

def ungit(filesystem_path)
  p "Removing git repo for #{filesystem_path}"
  %x[rm -rf #{filesystem_path}/.git]
end

def ungit_all
  Dir.glob("#{LOCAL_PLUGIN_DIR}/*").each do |plugin_folder|
    ungit(plugin_folder)
  end
end

def update_one(repo_name)
  repo_path = PLUGINS[repo_name]
  local_plugin_path = "#{LOCAL_PLUGIN_DIR}/#{repo_name}"

  p "Removing existing plugin folder for #{repo_name}"
  %x[rm -rf #{local_plugin_path}]

  clone_plugin_repo(repo_name, repo_path)
end

def update_all
  PLUGINS.keys.each do |repo_name|
    update_one(repo_name)
  end
end

command = ARGV[0]

if command == 'ungit'
  ungit_all
elsif command == 'update_all'
  update_all
elsif command == 'update_one'
  update_one(ARGV[1])
elsif command == nil
  p "You must provide a command, one of 'ungit', 'update_all', 'update_one'"
else
  p "Unknown command"
end
