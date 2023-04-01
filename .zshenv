prepend_path () {
    if ! grep $1 <<<"$PATH" >/dev/null
    then
    	export PATH=$1:$PATH
    fi
}

prepend_path ~/.cargo/bin
prepend_path ~/go/bin

prepend_path ~/.node_modules/bin
export npm_config_prefix=$HOME/.node_modules

prepend_path ~/.local/bin

export EDITOR=kak
export PAGER='less -FQ'
