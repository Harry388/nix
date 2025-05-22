-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function()
-- 		vim.cmd("colorscheme rose-pine")
-- 	end
-- }

return {
  "sainnhe/everforest",
  config = function()
      -- " Available values: 'hard', 'medium'(default), 'soft'
      vim.g.everforest_background = "hard"
      -- For better performance
      vim.g.everforest_better_performance = 1
      vim.cmd("colorscheme everforest")
  end
}
