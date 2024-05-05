return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
  config = function()

    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    lualine.setup({
        -- options = {
        --   theme = "catppuccin",
        -- },
        sections = {
          lualine_x = {
            {
              "swenv",
              cond = function()
                return vim.bo.filetype == "python"
              end,
              icon = "xx",
              color = { fg = "#8fb55e" },
            },
            {
              lazy_status.updates,
              cond = lazy_status.has_updates,
              color = { fg = "#ff9e64" },
            },
            { "encoding" },
            { "fileformat" },
            { "filetype" },
          },
        },
    })
  end,
}
