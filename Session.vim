let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Genel/rails/chizelge
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd app/models/entry.rb
set stal=2
tabnew
tabnew
tabnew
tabnew
tabrewind
edit app/controllers/entries_controller.rb
argglobal
balt app/models/entry.rb
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 51 - ((2 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 51
normal! 0
tabnext
edit app/models/entry.rb
argglobal
balt app/controllers/entries_controller.rb
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 8 - ((7 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 8
normal! 021|
tabnext
edit app/views/entries/index.html.haml
argglobal
balt app/models/entry.rb
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 19 - ((18 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 19
normal! 073|
tabnext
edit app/javascript/src/application.sass
argglobal
balt app/views/entries/index.html.haml
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 16 - ((15 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 16
normal! 032|
tabnext
edit bin/rails
argglobal
balt app/javascript/src/application.sass
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
tabnext 5
set stal=1
badd +82 app/controllers/entries_controller.rb
badd +8 app/models/entry.rb
badd +31 app/views/entries/index.html.haml
badd +0 yapılacak.txt
badd +13 app/views/entries/_form.html.haml
badd +53 db/schema.rb
badd +1 app/controllers/admin_pages_controller.rb
badd +2 app/views/devise/sessions/new.html.haml
badd +18 app/views/devise/shared/_links.html.haml
badd +13 config/routes.rb
badd +4 app/views/home/index.html.haml
badd +2 app/views/devise/registrations/new.html.haml
badd +12 app/javascript/src/application.sass
badd +1 Gemfile
badd +13 app/models/user.rb
badd +1 app/javascript/packs/application.js
badd +1 app/views/entries/_entry.json.jbuilder
badd +39 .gitignore
badd +10 app/views/entries/show.html.haml
badd +5 app/models/admin.rb
badd +0 bin/rails
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOF
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
