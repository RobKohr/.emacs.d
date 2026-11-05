# How to use Magit

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
