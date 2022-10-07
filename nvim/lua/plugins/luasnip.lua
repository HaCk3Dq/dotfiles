local ls = require('luasnip')

ls.config.set_config {
  history = true,
  update_events = 'TextChanged,TextChangedI',
}

vim.keymap.set({ 'i', 's' }, '<C-K>', function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-J>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set('i', '<C-L>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)
