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
        lsp = {
          name = "LSP",
          module = "blink.cmp.sources.lsp",
          score_offset = 100,
        },
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

    completion = {
      list = {
        selection = { preselect = true, auto_insert = true }
      },
      trigger = {
        show_on_insert_on_trigger_character = true, -- Esto ayuda a que el LSP esté listo antes
      },
      menu = {
        draw = {
          columns = { { "kind_icon", "kind", gap = 1 }, { "label", "label_description" }, },
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
                return icon .. " "
              end,
            },
            label = {
              text = function(ctx)
                return ctx.label or ctx.abbr or ctx.value or "?"
              end,
              source_label = true,
            },
            kind = {
              text = function(ctx)
                return " [" .. ctx.kind .. "]"
              end,
            },
          },
        },
      },
    },
  },
}
