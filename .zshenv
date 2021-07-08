if ! echo :$PATH: | grep ~/.cargo/bin >/dev/null
then
        export PATH=~/.cargo/bin:$PATH
fi
if ! echo :$PATH: | grep ~/.node_modules/bin >/dev/null

then
        export PATH=~/.node_modules/bin:$PATH
fi
if ! echo :$PATH: | grep ~/.local/bin >/dev/null
then
	export PATH=~/.local/bin:$PATH
fi
export npm_config_prefix=$HOME/.node_modules

export EDITOR=kak
export FUCHSIA_DIR=~/fuchsia
