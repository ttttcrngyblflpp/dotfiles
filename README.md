# Dotfiles

## Setting up on a new machine

Run the following to set up an alias:

```
$ alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Run the following:

```
$ echo ".cfg" >> ~/.gitignore                         # prevent problems with recursive git repos
$ git clone --bare https://github.com/ttttcrngyblflpp/dotfiles.git ~/.cfg # make the clone
$ cfg config --local status.showUntrackedFiles no     # don't show untracked files
$ cfg checkout                                        # checkout the files

```

It's possible that the bare clone caused no tracking to be set up, if so run this:

```
$ cfg config --add remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
```

Install `kakoune`, `fzf`, `ripgrep`, `lf`.
