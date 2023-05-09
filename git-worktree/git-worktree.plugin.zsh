#!/usr/bin/env zsh
# vim: ft=zsh
# Description: git worktree plugin
# Author: Frank Oppervoll-Larsen
# 
# Inspiration from
#   https://github.com/jspears/worktree

function git_folder() {
    local git_dir=$(git rev-parse --git-dir | sed 's,\.git.*$,.git,')
    return git_dir
}

# Change to worktree directory based on branch name
function chwt() {
    local branch=$1
    local worktree_path=$(git worktree list | grep '\['$branch'\]' | cut -d' ' -f1)

    if [[ ! -d $worktree_path ]]; then
        echo "No worktree found for branch $branch"
        return 1
    fi

    cd $worktree_path
}

function _wtbranches() {
    compadd $(git worktree list --porcelain | grep '^branch' | cut -d' ' -f2 | sed 's,refs/heads/,,g')
}

compdef _wtbranches chwt
