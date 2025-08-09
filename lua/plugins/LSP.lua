return {
  {
    'williamboman/mason.nvim',
    lazy = false,
    opts = {},
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } }
  },
  { "williamboman/mason-lspconfig.nvim" },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "VonHeikemen/lsp-zero.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      local lsp_zero = require("lsp-zero")
      local lspconfig = require("lspconfig")

      lsp_zero.extend_lspconfig()

      -- Auto-attach keymaps when LSP connects
      lsp_zero.on_attach(function(_, bufnr)
        local opts = { buffer = bufnr }

        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<F3>", function() vim.lsp.buf.format { async = true } end,
          { desc = "Format", buffer = bufnr })
        vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, { desc = "Code Action", buffer = bufnr })
        vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename", buffer = bufnr })

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", builtin.lsp_references, opts)
        vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)
        vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gS", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      end)

      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "jdtls" },
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            lspconfig.lua_ls.setup(lua_opts)
          end,
        }
      })

      require("mason-nvim-dap").setup({
        ensure_installed = { "cppdbg", "java-debug-adapter", "java-test" }
      })

      vim.diagnostic.config({
        virtual_text = {
          prefix = "●", -- Could be '●', '▎', 'x'
          spacing = 4,
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = false,
      })
    end
  },

  {
    -- LuaSnip + VSCode-style snippet support
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- stable release
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" }) -- optional local snippets
    end
  },

  -- Autocompletion & snippets
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },

        formatting = {
          format = function(entry, vim_item)
            local lspkind = require("lspkind")

            -- Check if the source is Copilot
            if entry.source.name == "copilot" then
              -- Custom formatting for Copilot suggestions
              vim_item.kind = " " .. vim_item.kind -- You can use a Copilot icon (like "") or any other text
              vim_item.menu = "[Copilot]" -- Optional: add a menu label for Copilot
            else
              -- Default formatting for LSP
              vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
            end

            return vim_item
          end,
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        matching = {
          disallow_fuzzy_matching = false,
          disallow_partial_matching = false,
          disallow_exact_matching = false,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<S-CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        sources = cmp.config.sources({
          { name = "copilot",                group_index = 1 },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
          { name = "nvim_lsp_signature_help" },
        }),
      })
    end
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({})
    end
  },

  -- Telescope (search UI)
  { "nvim-telescope/telescope.nvim",    dependencies = { "nvim-lua/plenary.nvim" } },

  -- Autopairs & autotag
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function() require("nvim-autopairs").setup() end
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function() require("nvim-ts-autotag").setup() end
  },

  -- DAP
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "mfussenegger/nvim-dap-python",
      "nvim-neotest/nvim-nio",
      "nvim-telescope/telescope-dap.nvim",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" },
      }

      dap.configurations.c = {
        {
          name = "Launch",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", "./", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtEntry = false,
        },
      }

      dapui.setup()
      require("nvim-dap-virtual-text").setup()

      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

      vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/Continue Debugging" })
      vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
      vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
      vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })
      vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "Open Debug Console" })
      vim.keymap.set("n", "<Leader>du", dapui.toggle, { desc = "Toggle Debug UI" })
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    dependencies = { "mfussenegger/nvim-dap" },
  },
}
