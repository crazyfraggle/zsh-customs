# Bookmark function
export ZSH_BOOKMARKS=${HOME}/.zshrc.bookmarks
function bookmark() { 
    echo "export $1=$PWD" >> $ZSH_BOOKMARKS; 
    export $1=$PWD
}

[[ -e $ZSH_BOOKMARKS ]] || {
    touch $ZSH_BOOKMARKS
}
[[ -e $ZSH_BOOKMARKS ]] && {
    . $ZSH_BOOKMARKS
}
