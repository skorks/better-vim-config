This is the latest iteration of my Vim config. It has an extensive vimrc (vim config file) full of customizations and convenience mappings as well as that it includes a whole bunch of plugins to make your editing life much easier. The first iteration of the config file was heavily based on [the one from amix](http://amix.dk/vim/vimrc.html) (and to be totally honest the current iteration is still hevaily based on it - long live open source :)). Many of the plugins are Ruby/Rails related but the majority are not language specific so this config make Vim a pretty decent programming editor.

## Using/Installing It

You should be able to use the config on Mac, Linux or Windows.

If you want to use it, you need to do the following:

    git clone https://github.com/skorks/better-vim-config.git

You will then need to jump into the directory that was created and run the installer (`install.bat` if you're on Windows or `install.sh` if you're on Mac/Linux). Let's assume we have a Linux system:

    cd better-vim-config
    ./install.sh

This will do the following:

* create a new .vimrc file in your home directory, (this will wipe out any existing .vimrc if you already have one, so make sure to backup if you don't want it wiped out)
* rename the `better-vim-config` directory to be called `.vimruntime` to make sure all paths work correctly

After the install script completes, you will have:

* a brand new `.vimrc` in your home directory (which points at a `.vimruntime` directory also in your home dir)
* a `.vimruntime` directory where all the plugins and the real config live (what you checked out from Github)

Once of the included plugins (*Command-T*) has a native extension which needs to be compiled if you want it to work. Here is what you need to do.

* Jump into the *Command-T* directory (`.vimruntime/plugins/Command-T`)
* Switch to your system Ruby, or whichever Ruby your Vim was compiled agains. If you're using RVM it's a simple matter:

    `rvm use system`

* Build the extension using the rake task provided:

    `rake make`

## Included Plugins

The following plugins are included:

* [ack.vim](https://github.com/mileszs/ack.vim) - This plugin is a front for the Perl module App::Ack. Ack can be used as a replacement for 99% of the uses of grep. This plugin will allow you to run ack from vim, and shows the results in a split window.
* [bufexplorer](https://github.com/markabe/bufexplorer) - With bufexplorer, you can quickly and easily switch between buffers by using the one of the default public interfaces.
* [bufkill.vim](https://github.com/vim-scripts/bufkill.vim) - Unload buffers but leave the window intact (possibly not needed).
* [Command-T](https://github.com/wincent/Command-T) - The Command-T plug-in provides an extremely fast, intuitive mechanism for opening files and buffers with a minimal number of keystrokes.
* [csapprox](https://github.com/godlygeek/csapprox) - This plugin makes GVim-only colorschemes Just Work in terminal Vim.
* [delimitmate](https://github.com/Raimondi/delimitmate) - This plug-in provides automatic closing of quotes, parenthesis, brackets, etc.
* [html5.vim](https://github.com/othree/html5.vim) - HTML5 omnicomplete funtion and syntax for Vim.
* [vim-matchit](https://github.com/mhz/vim-matchit) - Allows you to use the % key to go to the matching bracket, brace etc.
* [nerdcommenter](https://github.com/scrooloose/nerdcommenter) - Easier commenting/uncommenting for Vim.
* [nerdtree](https://github.com/scrooloose/nerdtree) - Gives you a tree explorer in Vim.
* [snipmate.vim](https://github.com/msanders/snipmate.vim) - Implements some of TextMate's snippets features in Vim.
* [Specky](https://github.com/vim-scripts/Specky) - Functions to help make behavioral testing easy with ruby and rspec.
* [syntastic](https://github.com/scrooloose/syntastic) - Syntax checking hacks for vim.
* [taglist.vim](https://github.com/vim-scripts/taglist.vim) - The "Tag List" plugin is a source code browser plugin for Vim and provides an overview of the structure of source code files.
* [TailMinusF](https://github.com/vim-scripts/TailMinusF) - TailMinusF allows you to view the contents of a file in real time.
* [vim-bundler](https://github.com/tpope/vim-bundler) - This is a lightweight bag of Vim goodies for Bundler, best accompanied by rake.vim and/or rails.vim.
* [vim-coffee-script](https://github.com/kchmck/vim-coffee-script) - CoffeeScript support for vim.
* [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized) - Precision colorscheme for the vim text editor.
* [vim-cucumber](https://github.com/tpope/vim-cucumber) - Vim Cucumber runtime files.
* [vim-easygrep](https://github.com/gaving/vim-easygrep) - EasyGrep makes using vimgrep easier.
* [vim-endwise](https://github.com/tpope/vim-endwise) - This is a simple plugin that helps to end certain structures automatically. In Ruby, this means adding end after if, do, def and several other keywords. 
* [vim-fugitive](https://github.com/tpope/vim-fugitive) - A Git wrapper so awesome, it should be illegal.
* [vim-git](https://github.com/tpope/vim-git) - Vim Git runtime files.
* [vim-haml](https://github.com/tpope/vim-haml) - Vim runtime files for Haml, Sass, and SCSS.
* [vim-javascript](https://github.com/pangloss/vim-javascript) - Vastly improved vim's javascript indentation.
* [vim-jquery](https://github.com/itspriddle/vim-jquery) - Vim syntax file to add some colorations for jQuery keywords and css selectors.
* [vim-json](https://github.com/leshill/vim-json) - A simple highlighting file for JSON constructs.
* [vim-markdown](https://github.com/tpope/vim-markdown) - Vim Markdown runtime files.
* [vim-ragtag](https://github.com/tpope/vim-ragtag) - Ghetto HTML/XML mappings.
* [vim-rails](https://github.com/tpope/vim-rails) - Ruby on Rails power tools.
* [vim-rake](https://github.com/tpope/vim-rake) - It's like rails.vim without the rails.
* [vim-repeat](https://github.com/tpope/vim-repeat) - Enable repeating supported plugin maps with ".".
* [vim-ruby-sinatra](https://github.com/hallison/vim-ruby-sinatra) - Vim syntax highlight and snippets that helper coding applications based in Sinatra micro-framework.
* [vim-ruby](https://github.com/vim-ruby/vim-ruby) - Vim/Ruby Configuration Files.
* [vim-supertab](https://github.com/tsaleh/vim-supertab) - Supertab aims to provide tab completion to satisfy all your insert completion needs.
* [vim-surround](https://github.com/tpope/vim-surround) - Quoting/parenthesizing made simple.
* [vim-unimpaired](https://github.com/tpope/vim-unimpaired) - Pairs of handy bracket mappings.
* [vim-yankring](https://github.com/chrismetcalf/vim-yankring) - Vim does not provide any mechanism to reference previous yanked, deleted or changed text.  In Emacs this feature is called the "kill ring". 
* [zencoding-vim](https://github.com/mattn/zencoding-vim) - Vim script support for expanding abbreviation like zen-coding.

## Updating The Plugins

Some people choose to include plugins in their config using git modules. I am not a big fan of that method. I simply grab the plugins from their git repos then wipe out their `.git` directory and include them in my repository directly.

Some plugins are actively developed however, so you may want to update to the latest version once in a while. If you want to update just one plugin then simply delete its directory, clone it again from its git repo and wipe out the `.git` directory. 

If you want to update all the plugins, there is a dirty little Ruby script called `update_plugins.rb` this will do the above action for all the plugins.

There are only a couple of plugins that require some extra steps. One is *Command-T* which I mentioned before, the other is *vim-coffee-script*. For the CoffeeScript one you have to jump into its directory and then go into `after/syntax`. You will find two files there `html.vim` and `haml.vim` if you leave them as is they seem to interfere with regular HTML sytax highlighting, so I tend to rename them to `html-coffee.vim` and `haml-coffee.vim`.

## Cheatsheet

As I've been using Vim I've compiled a cheatsheet of various handy commands some basic some advanced both for regular Vim and for the plugins that I use. This cheatsheet is also in this repo. It is only there to jog your memory and remind you that certain commands exist. Basically you will not be able to Vim and the various plugins just from the cheatsheet, but if you have some idea of how the various Vim commands and plugin commands work, it becomes a handy reference. 

There is also a handy mapping which will instantly bring the cheatsheet up no matter what you're editing:

    <Leader>c

Since the leader key for this config is the comma we have `,c`.

## TODO

List all the things that need to be installed for all the plugins to function properly e.g. exuberant ctags for taglist, various stuff for syntastic, ack for ack.vim etc.
