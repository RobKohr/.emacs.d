# .emacs.d

Emacs configuration based on [emacs-bedrock](https://codeberg.org/ashton314/emacs-bedrock).

## Magit (Git)

Open it with `C-x g` (Ctrl+x then g) in any git repo. You'll see a status buffer showing staged/unstaged changes. From there:

- **s** — stage a file or hunk (cursor on it)
- **u** — unstage
- **c c** — commit (type message, then `C-c C-c` to confirm)
- **P p** — push
- **F p** — pull
- **b b** — switch branch
- **l l** — view log
- **d d** — diff
- **Tab** — expand/collapse sections and hunks
- **q** — quit the magit buffer

The killer feature: you can stage *individual hunks* or even *individual lines* within a diff, making precise commits easy.

## Treemacs (File Browser)

A sidebar file explorer like VS Code's.

- **C-x t t** — toggle the treemacs sidebar
- **C-x t 1** — switch focus to the treemacs window

Inside the treemacs buffer:

- **RET** — open file / expand directory
- **Tab** — expand/collapse directory
- **cf** — create file
- **cd** — create directory
- **R** — rename
- **d** — delete
- **q** — quit treemacs
- **P** — peek at file without opening
- **?** — show all keybindings

Treemacs auto-refreshes when you do git operations through Magit.
