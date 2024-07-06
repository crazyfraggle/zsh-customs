#!/usr/bin/env zsh
# vim: ft=zsh
# Description: git worktree plugin
# Author: Frank Oppervoll-Larsen
# 
# Inspiration from
#   https://github.com/jspears/worktree

function main_git_folder() {
    local git_dir=$(git rev-parse --git-dir | sed 's,\.git.*$,.git,')
    echo $git_dir
}

function worktree_folder() {
    if [[ -v GIT_WORKTREE_DIR ]]; then
        echo $GIT_WORKTREE_DIR
    else
        echo $(main_git_folder)/../..
    fi
}

# Change to worktree directory based on branch name
function wtcd() {
    local branch=$1
    local worktree_path=$(git worktree list | grep '\['$branch'\]' | cut -d' ' -f1)

    if [[ ! -d $worktree_path ]]; then
        echo "No worktree found for branch $branch"
        return 1
    fi

    # Get the relative path of the current worktree.
    local relative_path=$(realpath --relative-to=$(git rev-parse --show-toplevel) $PWD)
    if [[ ! -d $worktree_path/$relative_path ]]; then
        echo "The current directory (${relative_path}) is not in the worktree, changing to worktree root."
        cd $worktree_path
    else
        cd $worktree_path/$relative_path
    fi
}

# List Worktrees
function wtl() {
    git worktree list
}

# Create a new worktree
function wtn() {
    local new_branch=$1
    local original_branch=$2
    local foldername=$(worktree_folder)/$(date -Idate)-$(basename $new_branch)

    git worktree add -b $new_branch $foldername $original_branch
    wtcd $new_branch
}

# Add worktree for existing branch
function wta() {
    local branch=$1
    local foldername=$(worktree_folder)/$(date -Idate)-$(basename $branch)

    git worktree add $foldername $branch
    wtcd $branch
}

function wtd() {
    local branch=$1
    local worktree_path=$(git worktree list | grep '\['$branch'\]' | cut -d' ' -f1)

    git worktree remove $worktree_path
}

function _wtbranches() {
    local branches=($(git worktree list --porcelain | grep '^branch' | cut -d' ' -f2 | sed 's,refs/heads/,,g'))
    _describe -t branches "Worktree branches" branches
}

function _nonwtbranches() {
    local branches=($(git branch -l | grep -v '^[\*\+]'))
    _describe -t branches "Branches not in a worktree" branches
}

compdef _wtbranches wtcd wtd
compdef _nonwtbranches wta
