local colorscheme = "onedark"

-- import lua module for setup
local status_ok_scheme, scheme = pcall(require, colorscheme)
if not status_ok_scheme then
	vim.notify("theme " .. colorscheme .. "not loaded")
	return
end

-- module setup config
scheme.setup({
	-- Main options --
	style = "warm", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	transparent = true, -- Show/hide background
})

-- load module in vim
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
