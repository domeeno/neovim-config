return {
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },

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

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      -- current best fuzzy finder
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  }
}
