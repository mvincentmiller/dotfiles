# My Dotfiles

*began some years ago, this file created 1.26.20 -M* 

---

## Why

Caring for my development environment helps keeps me in a flow. Any time I need a new environment I have this to refer to. It's also a living history.

## The Tools

- Bash https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html 

- Vim https://www.vim.org/

- Dhex https://www.dettus.net/dhex/

- Fzf https://github.com/junegunn/fzf

- Tmux https://github.com/tmux/tmux

- Picocom https://github.com/npat-efault/picocom

- Screen https://www.gnu.org/software/screen/

- Tig https://jonas.github.io/tig/

  

## Automatic Backup

Whenever I enter my shell, I check these things and commit.

```bash
# .bashrc

## Configuration Backup
FILE=~/Development/dotfiles/vim-plugin-list.txt
if test -f "$FILE"; then
    echo "saving vim-plugin-list.txt ..."
    rm $FILE
    ls -a ~/.vim/bundle > ~/Development/dotfiles/vim-plugin-list.txt
    cat ~/Development/dotfiles/vim-plugin-list.txt
fi

cp ~/.bashrc ~/Development/dotfiles/.bashrc
cp ~/.vimrc ~/Development/dotfiles/.vimrc

cd ~/Development/dotfiles 
git add --all
git commit -m 'automatic backup'
git push origin master
cd -

```

