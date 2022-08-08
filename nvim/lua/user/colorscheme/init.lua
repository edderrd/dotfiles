-- local colorscheme = "onenord"
local colorscheme = "onedark"

-- import lua module for setup
local status_ok_scheme, scheme = pcall(require, colorscheme)
if not status_ok_scheme then
	vim.notify("theme " .. colorscheme .. " not loaded")
	return
end

local status_ok_theme_setup, setup = pcall(require, "user.colorscheme." .. colorscheme)
if not status_ok_theme_setup then
	vim.notify("theme setup " .. colorscheme .. " not loaded")
	return
end

-- module setup config
scheme.setup(setup)

-- load module in vim
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
