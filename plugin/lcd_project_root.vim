" Sets working directory to Git project root or to file's dir.
" Author: Landon Bouma <https://tallybark.com/>
" Online: https://github.com/landonb/vim-lcd-project-root
" License: https://creativecommons.org/publicdomain/zero/1.0/
" vim:tw=0:ts=2:sw=2:et:norl:ft=vim

" YOU: Uncomment the 'unlet', then <F9> to reload this file.
"       https://github.com/landonb/vim-source-reloader
"  silent! unlet g:loaded_lcd_project_root

if exists("g:loaded_lcd_project_root") || &cp || v:version < 700
  finish
endif
let g:loaded_lcd_project_root = 1

" Set the local working directory to the repo root, or
" to directory of the current file if there's no repo.
" - Useful for builtin find and grep commands, as well as search plugins
"   like CtrlP, Command-T, and fzf.
" - Inspired by: *Sane Vim Working Directories*
"   http://inlehmansterms.net/2014/09/04/sane-vim-working-directories/
" - (lb): Added vim-fugitive support; and check git response non empty.

function! SetProjectRoot()
  " Check for special paths, e.g., vim-fugitive paths look like:
  "   fugitive:///repo/path/.git//SHA1XXXX/some/file
  if (expand('%:p') == '') || !empty(matchstr(expand('%:p'), '^fugitive://.*'))
    " E.g., this happens on opening Glog entry from quickfix.
    return
  endif
  " Default to the current file's directory.
  lcd %:p:h
  let l:git_dir = system("git rev-parse --show-toplevel")
  " If command output starts with 'fatal', not a git repo.
  if (l:git_dir != '') && empty(matchstr(l:git_dir, '^fatal:.*'))
    " Change local directory to Git project root.
    lcd `=l:git_dir`
  endif
endfunction

autocmd BufRead * call SetProjectRoot()

