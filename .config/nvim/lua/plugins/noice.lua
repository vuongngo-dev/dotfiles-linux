return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- Noice relies on nui.nvim for rendering its UI components
      "MunifTanjim/nui.nvim",
    },
    opts = {
      lsp = {
        -- Override markdown rendering so that **cmp** and other plugins use **Treesitter** for rendering markdown
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      -- Set up presets for a more polished UI experience with Noice
      presets = {
        bottom_search = false, -- Không hiện tìm kiếm ở dưới cùng
        command_palette = true, -- Biến thanh gõ lệnh ':' thành dạng command palette (như VSCode)
        long_message_to_split = true, -- Nếu log/thông báo quá dài, tự mở sang một cửa sổ split
        inc_rename = false, 
        lsp_doc_border = true, -- Thêm viền cho hộp thoại tài liệu code
      },
    },
  }
}