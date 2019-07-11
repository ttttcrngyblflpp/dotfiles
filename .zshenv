if ! echo :$PATH: | grep ~/.cargo/bin >/dev/null
then
        export PATH=~/.cargo/bin:$PATH
fi
