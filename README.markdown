# Panya's vim Distribution

Now on Pathogen.

## Installation

`curl https://raw.github.com/Panya/janus/pathogen/bootstrap.sh -o - | sh`

## Updating to the latest version

To update to the latest version of the distribution, just run `git pull --rebase; git submodule update` inside your `~/.vim` directory.

# Intro to VIM

Here's some tips if you've never used VIM before:

## Tutorials

* Type `vimtutor` into a shell to go through a brief interactive
  tutorial inside VIM.
* Read the slides at [VIM: Walking Without Crutches](http://walking-without-crutches.heroku.com/#1).

## Modes

* VIM has two modes:
  * insert mode- stuff you type is added to the buffer
  * normal mode- keys you hit are interpretted as commands
* To enter insert mode, hit `i`
* To exit insert mode, hit `<ESC>`

## Useful commands

* Use `:q` to exit vim
* `,W` to remove trail whitespaces
* `,c` to comment/uncomment
* `,t` to CtrlP (like TextMate Command-T)
* `,g` to grep in git project
* Keyboard [cheat sheet](http://walking-without-crutches.heroku.com/image/images/vi-vim-cheat-sheet.png).

## Installed plugins

* [GitGrep.vim](https://github.com/tjennings/git-grep-vim)
* [CtrlP](https://github.com/kien/ctrlp.vim)
* [Color sampler pack](https://github.com/vim-scripts/Color-Sampler-Pack)
* [fugitive](https://github.com/tpope/vim-fugitive)
* [git](https://github.com/tpope/vim-git)
* [NerdTree](https://github.com/wycats/nerdtree)
* [NerdCommenter](https://github.com/ddollar/nerdcommenter)
* [surround](https://github.com/tpope/vim-surround)
* [repeat](https://github.com/tpope/vim-repeat)
* [MatchIt](https://github.com/mirell/vim-matchit)
* [supertab](https://github.com/ervandew/supertab)
* [ZoomWin](https://github.com/vim-scripts/ZoomWin)
* [SnipMate](https://github.com/msanders/snipmate.vim)
* [align](https://github.com/tsaleh/vim-align)
* [unimpaired](https://github.com/tpope/vim-unimpaired)
* [delimitMate](https://github.com/Raimondi/delimitMate)
* [searchfold](https://github.com/vim-scripts/searchfold.vim)
* [syntastic](https://github.com/scrooloose/syntastic)
* [gist](https://github.com/mattn/gist-vim)
* [zencoding](https://github.com/mattn/zencoding-vim)
* [xml](https://github.com/othree/xml.vim)

## Syntax files

* [javascript](https://github.com/pangloss/vim-javascript)
* [coffeescript](https://github.com/kchmck/vim-coffee-script)
* [HAML](https://github.com/tpope/vim-haml)
* [markdown](https://github.com/tpope/vim-markdown)
