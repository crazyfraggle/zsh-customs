# Add alias to substitute the ls command with the lsd dropin replacement if available
if command -v lsd >/dev/null 2>&1; then
    alias ls='lsd'
    alias ll='lsd -l'
    alias la='lsd -a'
    alias l='lsd -lA'
fi

# The ubuntu package for bat is called batcat, alias it back to bat
if command -v batcat >/dev/null 2>&1; then
    alias bat='batcat'
fi

# Use Neovim for vi/vim if available
if command -v nvim >/dev/null 2>&1; then
    alias vi='nvim'
    alias vim='nvim'
fi
