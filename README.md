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

* a brand new .vimrc in your home directory (which points at a .vimruntime directory also in your home dir)
* a .vimruntime directory where all the plugins and the real config live (what you checked out from github)

Once of the included plugins (*Command-T*) has a native extension which needs to be compiled if you want it to work. Here is what you need to do.

* Jump into the *Command-T* directory (`.vimruntime/plugins/Command-T`)
* Switch to your system Ruby, or whichever Ruby your Vim wsa compiled agains. If you're using RVM it's a simple matter:

  rvm use system

* Build the extension using the rake task provided:

  rake make

## Included Plugins

The following plugins are included:

* [ack.vim](https://github.com/mileszs/ack.vim.git) - 
* [bufexplorer](https://github.com/markabe/bufexplorer.git) - 
* [bufkill.vim](https://github.com/vim-scripts/bufkill.vim.git) - 
* [Command-T](https://github.com/wincent/Command-T.git) - 
* [csapprox](https://github.com/godlygeek/csapprox.git) - 
* [delimitmate](https://github.com/Raimondi/delimitmate.git) - 
* [html5.vim](https://github.com/othree/html5.vim.git) - 
* [vim-matchit](https://github.com/mhz/vim-matchit.git) - 
* [nerdcommenter](https://github.com/scrooloose/nerdcommenter.git) - 
* [nerdtree](https://github.com/scrooloose/nerdtree.git) - 
* [snipmate.vim](https://github.com/msanders/snipmate.vim.git) - 
* [Specky](https://github.com/vim-scripts/Specky.git) - 
* [syntastic](https://github.com/scrooloose/syntastic.git) - 
* [taglist.vim](https://github.com/vim-scripts/taglist.vim.git) - 
* [TailMinusF](https://github.com/vim-scripts/TailMinusF.git) - 
* [vim-bundler](https://github.com/tpope/vim-bundler.git) - 
* [vim-coffee-script](https://github.com/kchmck/vim-coffee-script.git) - 
* [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized.git) - 
* [vim-cucumber](https://github.com/tpope/vim-cucumber.git) - 
* [vim-easygrep](https://github.com/gaving/vim-easygrep.git) - 
* [vim-endwise](https://github.com/tpope/vim-endwise.git) - 
* [vim-fugitive](https://github.com/tpope/vim-fugitive.git) - 
* [vim-git](https://github.com/tpope/vim-git.git) - 
* [vim-haml](https://github.com/tpope/vim-haml.git) - 
* [vim-javascript](https://github.com/pangloss/vim-javascript.git) - 
* [vim-jquery](https://github.com/itspriddle/vim-jquery.git) - 
* [vim-json](https://github.com/leshill/vim-json.git) - 
* [vim-markdown](https://github.com/tpope/vim-markdown.git) - 
* [vim-ragtag](https://github.com/tpope/vim-ragtag.git) - 
* [vim-rails](https://github.com/tpope/vim-rails.git) - 
* [vim-rake](https://github.com/tpope/vim-rake.git) - 
* [vim-repeat](https://github.com/tpope/vim-repeat.git) - 
* [vim-ruby-sinatra](https://github.com/hallison/vim-ruby-sinatra.git) - 
* [vim-ruby](https://github.com/vim-ruby/vim-ruby.git) - 
* [vim-supertab](https://github.com/tsaleh/vim-supertab.git) - 
* [vim-surround](https://github.com/tpope/vim-surround.git) - 
* [vim-unimpaired](https://github.com/tpope/vim-unimpaired.git) - 
* [vim-yankring](https://github.com/chrismetcalf/vim-yankring.git) - 
* [zencoding-vim](https://github.com/mattn/zencoding-vim.git) - 

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
