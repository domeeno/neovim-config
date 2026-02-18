return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("lualine").setup({
        options = {
          theme = "tomorrow_night"
        },
        tabline = {
          lualine_a = {
            function()
              return ""
            end
          },
          lualine_b = {
            {
              "tabs",
              mode = 1,
              use_mode_colors = true,
              path = 0,
              symbols = { modified = "+", },
              fmt = function(name, context)
                local dev_icons = require("nvim-web-devicons")
                local icon, _ = dev_icons.get_icon(name, nil, { default = true })
                return icon .. " " .. name
              end,
              max_length = vim.o.columns - 1,
            },

          },
          lualine_z = {
            function()
              return " " .. os.date("%H:%M")
            end
          },
        }
      })
    end
  }
}
