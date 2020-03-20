# vim-lcd-project-root

Sets the working directory when editing a new buffer to the file's
Git project root, or to the file's parent directory.

- Inspired by: [*"Sane Vim Working Directories"*](http://inlehmansterms.net/2014/09/04/sane-vim-working-directories/).

## Introduction

Useful for builtin `find` and `grep` commands, as well as for
search plugins like
[CtrlP](https://github.com/kien/ctrlp.vim),
[Command-T](https://github.com/wincent/command-t),
and [fzf](https://github.com/junegunn/fzf).
Also [vim-fugitive](https://github.com/tpope/vim-fugitive)-aware.

## Commands

None. Runs on `BufRead *`, i.e., when starting to edit a new buffer.

## Installation

Take advantage of Vim's packages feature (`:h packages`), e.g.,:

  ```shell
  mkdir -p ~/.vim/pack/landonb/start
  cd ~/.vim/pack/landonb/start
  git clone https://github.com/landonb/vim-lcd-project-root.git
  vim -u NONE -c "helptags vim-lcd-project-root/doc" -c q
  ```

To load the plugin manually, install to
`~/.vim/pack/landonb/opt` instead and call
`:packadd vim-lcd-project-root` when ready.

## License

Copyright (c) Landon Bouma. This work is distributed
wholly under CC0 and dedicated to the Public Domain.

https://creativecommons.org/publicdomain/zero/1.0/

