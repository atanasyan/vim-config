set path+=~/work/lld/git/include
set path+=~/work/lld/git/tools/lld/include
set makeprg=lld-bld.sh

" associate *.test with YAML filetype
au BufRead,BufNewFile *.test setfiletype yaml
