# Dotfiles

## Setting up on a new machine

Add the following line to `.bashrc`:

```
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Run the following:

```
$ cfg config --local status.showUntrackedFiles no     # don't show untracked files
$ echo ".cfg" >> ~/.gitignore                         # prevent problems with recursive git repos
$ git clone --bare https://github.com/ttttcrngyblflpp/dotfiles.git ~/.cfg # make the clone
$ cfg checkout                                        # checkout the files

```
