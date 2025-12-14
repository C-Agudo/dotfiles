return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "moyiz/blink-emoji.nvim"
  },
  opts = {
    -- 🌈 Fuentes personalizadas
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "dadbod" },
      providers = {
        emoji = {
          module = "blink-emoji",
          name = "Emoji",
          score_offset = 15,
          opts = { insert = true },
          should_show_items = function()
            return vim.tbl_contains({ "gitcommit", "markdown" }, vim.o.filetype)
          end,
        },
        dadbod = {
          name = "Dadbod",
          module = "vim_dadbod_completion.blink",
          min_keyword_length = 2,
          score_offset = 85, -- the higher the number, the higher the priority
        },
      },
    },

    -- 🖌️ Menu / iconos + nombres
    --
    --
    menu = {
      draw = {
        components = {
          kind_icon = {
            text = function(ctx)
              local kind_icons = {
                Text = "󰉿",
                Method = "",
                Function = "󰊕",
                Constructor = "",
                Field = "󰽐",
                Variable = "󰀫",
                Class = "",
                Interface = "",
                Module = "󰏗",
                Property = "󰜢",
                Unit = "",
                Value = "󰀬",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈙",
                Reference = "󰈇",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "󰙅",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "󰊄",
              }

              local icon = kind_icons[ctx.kind] or "?"

              -- Iconos de archivos vía nvim-web-devicons
              if vim.tbl_contains({ "Path" }, ctx.source_name) then
                local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                if dev_icon then
                  icon = dev_icon
                end
              end

              -- Icono + nombre del tipo
              return icon .. " " .. ctx.kind .. ctx.icon_gap
            end,

            highlight = function(ctx)
              local hl = ctx.kind_hl
              if vim.tbl_contains({ "Path" }, ctx.source_name) then
                local _, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                if dev_hl then
                  hl = dev_hl
                end
              end
              return hl
            end,
          },
        },
      },

      -- -- 🌟 Preview con colores del tema
      -- preview = {
      --   winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual",
      -- },
    },
  },
}
