-- TREESITTER CONFIG

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    config = function()
      local languages = {
        -- general
        "c",
        "cpp",
        "python",
        "java",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
      }
      require("nvim-treesitter").install(languages)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter.setup", {}),
        callback = function(args)
          local buf = args.buf
          local filetype = args.match

          -- you need some mechanism to avoid running on buffers that do not
          -- correspond to a language (like oil.nvim buffers), this implementation
          -- checks if a parser exists for the current language
          local language = vim.treesitter.language.get_lang(filetype) or filetype
          if not vim.treesitter.language.add(language) then
            return
          end

          -- replicate `fold = { enable = true }`
          -- (foldlevel 99 = files open fully unfolded)
          vim.wo[0][0].foldmethod = "expr"
          vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.wo[0][0].foldlevel = 99

          -- replicate `highlight = { enable = true }`
          vim.treesitter.start(buf, language)

          -- replicate `indent = { enable = true }`
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      -- Toggle the fold of the function/method enclosing the cursor.
      -- Matches node types like function_definition (c/cpp/python/lua),
      -- function_declaration (lua), method_declaration and
      -- constructor_declaration (java), while skipping calls.
      local function is_function_node(t)
        return (t:find("function") or t:find("method") or t:find("constructor"))
          and (t:find("_definition$") or t:find("_declaration$"))
      end

      _G.TSFoldFunction = function()
        local node = vim.treesitter.get_node()
        while node do
          local start_row, _, end_row = node:range()
          if is_function_node(node:type()) and end_row > start_row then
            vim.api.nvim_win_set_cursor(0, { start_row + 1, 0 })
            vim.cmd("normal! za")
            return
          end
          node = node:parent()
        end
        vim.notify("No enclosing function", vim.log.levels.INFO)
      end
    end,
  },
}
