return {
    -- Auto-close brackets, quotes, etc. with smart behavior in Insert mode
  {
    "echasnovski/mini.pairs",
    event = "InsertEnter", -- Chỉ tải khi bạn bắt đầu gõ chữ (chế độ Insert)
    opts = {
      -- Bạn có thể tùy chỉnh nếu muốn vô hiệu hóa một phím cụ thể
      modes = { insert = true, command = false, terminal = false },
    },
  },

  -- Improve file icons with a modern, consistent set of icons that integrate well with the rest of the UI
  {
    "echasnovski/mini.icons",
    lazy = true,
    opts = {
        preset = "nerd", -- Sử dụng bộ icon Nerd Font để có nhiều biểu tượng hơn
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
}