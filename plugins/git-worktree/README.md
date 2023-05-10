# Git Worktree plugin

A plugin for working with git worktrees.

## Environment

### `GIT_WORKTREE_DIR`

If defined, new worktrees will be added in this folder.
If not defined, new trees will be added one level up from the git root, aka next to your original clone folder.

## Commands

### wtcd

Change dir to worktree folder based on branch name. Supports TAB completion of branches.

```shell
wtcd main
```

### wtl

Alias for worktree list.

### wtn

Add worktree for new branch.
Optionally specify original branch.

```shell
wtn my-new-branch-name
wtn my-new-branch-from-main origin/main
```

### wta

Add worktree for existing branch.

```shell
wta some-branch-name
```

### wtd

Delete worktree by branch name.
Note, this does not delete the branch itself.

```shell
wtd my-obsolete-branch
```
