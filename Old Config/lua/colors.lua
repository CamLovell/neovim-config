-- Need to do some more config here, I like the scheme though and the italic comments!
function colorSetup(color)
	color = color or "gruvbox-material"
	vim.g.gruvbox_material_background = 'soft'
	vim.g.gruvbox_material_foreground = 'material'
	vim.cmd.colorscheme(color)
end

colorSetup()
