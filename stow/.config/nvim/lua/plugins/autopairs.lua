return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- плагин активируется при входе в режим вставки
    config = function()
      require("nvim-autopairs").setup({
        map_bs = true, -- удалять пару символов при нажатии Backspace
        map_cr = true  -- обрабатывать перенос строки в парах
      })
    end
  }
}
