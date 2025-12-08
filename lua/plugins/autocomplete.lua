return {
  {
    "saghen/blink.cmp",
    dependencies = { 
      "rafamadriz/friendly-snippets",
      "giuxtaposition/blink-cmp-copilot",
    },
    version = "1.*",
    opts = {
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = "super-tab" }, -- other options: "default" (C-y), "super-tab" (tab), "enter", "none" (no mapping)

      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)

      appearance = {
        nerd_font_variant = "mono"
      },

      completion = { documentation = { auto_show = true } }, -- show documentation by default (true). set to false if not show documentation

      sources = {
        -- Default list of enabled providers
        default = { "lazydev", "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          path = {
            enabled = function()
              return vim.bo.filetype ~= "copilot-chat"
            end
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true
          }
        },
      },

      -- current best fuzzy finder
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  }
}
