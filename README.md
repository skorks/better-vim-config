This is the latest iteration of my Vim config. It has an extensive vimrc (vim config file) full of customizations and convenience mappings as well as that it includes a whole bunch of plugins to make your editing life much easier. The first iteration of the config file was heavily based on [the one from amix](http://amix.dk/vim/vimrc.html) (and to be totally honest the current iteration is still hevaily based on it - long live open source :)). Many of the plugins are Ruby/Rails related but the majority are not language specific so this config make Vim a pretty decent programming editor.

## Using/Installing It

You should be able to use the config on Mac, Linux (it's probably possible to use it on window with some tweaks, but I haven't tried it).

If you want to use it, you need to do the following:

git clone https://github.com/skorks/better-vim-config.git

You will then need to jump into the directory that was created and run the installer (`install.sh`). Let's assume we have a Linux system:

cd better-vim-config
./install.sh

This will do the following:

* symlink the `vimrc` file as `~/.vimrc`, (this will wipe out any existing .vimrc if you already have one, so make sure to backup if you don't want it wiped out)
* symlink the `.vim`  folder as `~/.vim`, (as per above regarding wiping things out)

## Included Plugins

The following plugins are included:

```
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
  "yajs.vim"                        => "https://github.com/othree/yajs.vim.git",
  "vim-json"                        => "https://github.com/elzr/vim-json.git",
  "vim-indent-guides"               => "https://github.com/nathanaelkane/vim-indent-guides.git",
  "javascript-libraries-syntax.vim" => "https://github.com/othree/javascript-libraries-syntax.vim.git",
  "vim-textobj-user"                => "https://github.com/kana/vim-textobj-user.git",
  "vim-textobj-rubyblock"           => "https://github.com/nelstrom/vim-textobj-rubyblock.git",
  "supertab"                        => "https://github.com/ervandew/supertab.git",
  "vim-easy-align"                  => "https://github.com/junegunn/vim-easy-align.git",
  "vim-mustache-handlebars"         => "https://github.com/mustache/vim-mustache-handlebars.git",
  "YankRing.vim"                    => "https://github.com/vim-scripts/YankRing.vim.git",
  "undotree"                        => "https://github.com/mbbill/undotree.git",
  "Dockerfile.vim"                  => "https://github.com/ekalinin/Dockerfile.vim.git"
}
```

We're using `vim-pathogen` to install all the plugins.


## Updating The Plugins

Pathogen has no automated way to update the plugins. Therefor we've got the `plugins.rb` script. This script is ruby and can do a few things:

* `./plugins.rb ungit` - remove all the `.git` folders in all the plugins that live under `.vim/plugins`
* `./plugins.rb update_one Dockerfile.vim` - remove the `Dockerfile.vim` plugin if it exists and clone it again from the github repo
* `./plugins.rb update_all` - same as above but for all the plugins (complete update)

This way you can keep all the plugins updated, have complete control over everything and store everything in your own git repo. The best of all the worlds.


## Linting

To use ES6 linting via eslint:

```
npm install -g eslint
npm install -g babel-eslint
npm install -g eslint-plugin-react
```

Then configure syntastic:

```
let g:syntastic_javascript_checkers = ['eslint']
```

Create a config like this in your project's .eslintrc, or do so globally by placing it in ~/.eslintrc

```
{
    "parser": "babel-eslint",
    "env": {
        "browser": true,
        "node": true
    },
    "settings": {
        "ecmascript": 6,
        "jsx": true
    },
    "plugins": [
        "react"
    ],
    "rules": {
        "strict": 0,
        "quotes": 0,
        "no-unused-vars": 0,
        "camelcase": 0,
        "no-underscore-dangle": 0
    }
}
```

## Cheatsheet

This is not quite ready yet, but it's coming!
