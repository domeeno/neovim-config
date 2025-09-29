return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_compiler_latexmk = {
      options = {
        '-xelatex',
        '-shell-escape',
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
        '-output-directory=build',
        '-pdf'
      },
      engine = 'xelatex'
    }
    vim.g.vimtex_quickfix_mode = 0 -- no auto open
  end
}
