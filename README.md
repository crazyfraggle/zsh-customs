# CrazyFraggle zsh customizations

A collection of Oh-My-Zsh plugins and customizations I like and write.

To use the plugins, either change the `ZSH_CUSTOM` environment setting to point to this repository,
or copy the contents of the `plugins` folder to `~/.oh-my-zsh/custom/plugins`.

Then add the plugin to the `plugins` setting in `~/.zshrc`.

## Alias for improved version of common utils

The `fix-aliases.zsh` script contains aliases to make sure we have `bat`, `lsd` powered `ls`, etc.

## Plugins

These are the plugins available here.

### Git Worktree

The [git worktree plugin](plugins/git-worktree) contains helpers for navigating and
maintaining [git worktrees](https://git-scm.com/docs/git-worktree).
