# How to use Tim Pope’s Pathogen

I’ll assume you are on Linux or Mac OSX. For Windows, replace `~/.vim/` with `$HOME\vimfiles\` and forward slashes with backward slashes.

## The idea

Vim plugins can be single scripts or collections of specialized scripts that you are supposed to put in “standard” locations under your `~/.vim/` directory. Syntax scripts go into `~/.vim/syntax/`, plugin scripts go into `~/.vim/plugin`, documentation goes into `~/.vim/doc/` and so on. That design can lead to a messy config where it quickly becomes hard to manage your plugins.

This is not the place to explain the technicalities behind Pathogen but the basic concept is quite straightforward: each plugin lives in its own directory under `~/.vim/bundle/`, where each directory simulates the standard structure of your `~/.vim/` directory.

Let us take two simple, imaginary, plugins called `foo` and `bar` as an example. With the standard installation method we should have this mess:

    ~/.vim/doc/bar.txt
    ~/.vim/doc/foo.txt
    ~/.vim/plugin/bar.vim
    ~/.vim/plugin/foo.vim
    ~/.vim/syntax/bar.vim

With the help of Pathogen, we maintain the standard structure but we move it under `~/.vim/bundle/<pluginname>/`:

    ~/.vim/bundle/bar/plugin/bar.vim
    ~/.vim/bundle/bar/syntax/bar.vim

    ~/.vim/bundle/foo/doc/foo.txt
    ~/.vim/bundle/foo/plugin/foo.vim

Now, our plugins are easy to delete, update or modify because they are carefully segregated from each other.

That mechanism also applies to single-file scripts but they require a bit more work.

1. Identify the nature of that script. Is it a generic plugin? A filetype plugin? A syntax script? Let us assume it is a syntax script.

2. Come up with a descriptive name for that single-file plugin, say `baz`.

3. Place your script in `~/.vim/bundle/baz/syntax/baz.vim`.

## Prepare your environment

If they don’t exist already, create these two directories:

    ~/.vim/autoload/
    ~/.vim/bundle/

## Get Pathogen

Save `https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim` to

    ~/.vim/autoload/pathogen.vim

## Configure Pathogen

Put these lines at the top of your `vimrc`:

    execute pathogen#infect()

    filetype plugin indent on
    syntax on

The two last lines have nothing to do with pathogen but, if you have them in your `~/.vimrc`, be sure to put them *after* the pathogen line. If you don’t have those lines, well… add them! What good is Vim without syntax highlighting and filetype detection?

## Install a plugin

We are going to install [delimitMate](https://github.com/Raimondi/delimitMate). Once it is installed in `~/.vim/bundle/`, you should get:

    ~/.vim/bundle/delimitMate-master/autoload/...
    ~/.vim/bundle/delimitMate-master/doc/...
    ~/.vim/bundle/delimitMate-master/plugin/...
    ~/.vim/bundle/delimitMate-master/...

### Manually:

Unzip `delimitMate-master.zip` in `~/.vim/bundle/delimitMate-master/`.

### With Git, no submodules:

    $ cd ~/.vim/bundle
    $ git clone https://github.com/Raimondi/delimitMate.git

### With Git, using submodules:

Assuming your `.vim` directory is already a Git repository…

    $ cd ~/.vim
    $ git submodule init
    $ git submodule add https://github.com/Raimondi/delimitMate.git bundle/delimitMate

### All methods:

Once you are back in Vim, it is recommended to execute the `:Helptags` command, provided by Pathogen, to make the plugin’s documentation available globally:

    :Helptags

## Update a plugin

### Manually:
 
Same as installation process.
  
### With Git, with or without submodules:
 
    $ cd ~/.vim/bundle/delimitMate-master
    $ git pull

### Both methods:

Use `:Helptags` to update the index of the plugin’s documentation.

## Remove a plugin

### Manually and with Git, no submodules:

Simply remove its directory from `~/.vim/bundle`.

### With Git, using submodules:

Assuming your `.vim` directory is already a Git repository…

    $ cd ~/.vim
    $ git submodule deinit -f bundle/delimitMate
    $ git rm -rf bundle/delimitMate
    $ rm -rf .git/modules/bundle/delimitMate
