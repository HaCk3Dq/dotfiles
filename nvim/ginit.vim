set mouse=a

if exists(':GuiFont')
    GuiFont DroidSansMono Nerd Font Mono:h10
endif

if exists(':GuiTabline')
    GuiTabline 0
endif

if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

if exists(':GuiScrollBar')
    GuiScrollBar 0
endif

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

