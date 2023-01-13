local M = {}

---@class Groups
---@field background string
---@field panel string
---@field border string
---@field comment string
---@field link string
---@field punctuation string
---@field error string
---@field hint string
---@field info string
---@field warn string
---@field git_add string
---@field git_change string
---@field git_delete string
---@field git_dirty string
---@field git_ignore string
---@field git_merge string
---@field git_rename string
---@field git_stage string
---@field git_text string
---@field headings Headings|string

---@class Headings
---@field h1 string
---@field h2 string
---@field h3 string
---@field h4 string
---@field h5 string
---@field h6 string

---@class Config
---@field dark_variant 'main'|'moon'
---@field disable_background boolean
---@field disable_float_background boolean
---@field disable_italics boolean
---@field groups Groups
---@field highlight_groups table<string, any>
local defaults = {
	dark_variant = 'main',
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,
	highlight_groups = {},

	---@deprecated Use `highlight_groups = { VertSplit = { fg = 'highlight_med', bg = 'highlight_med' } }` instead.
	bold_vert_split = false,
	---@deprecated Use `highlight_groups = { NormalNC = { fg = 'text', bg = 'surface' } }` instead.
	dim_nc_background = false,

	groups = {
		background = 'base',
		panel = 'surface',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'muted',
		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',
		git_add = 'foam',
		git_change = 'rose',
		git_delete = 'love',
		git_dirty = 'rose',
		git_ignore = 'muted',
		git_merge = 'iris',
		git_rename = 'pine',
		git_stage = 'iris',
		git_text = 'rose',
		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		},
	},
}

---@type Config
M.options = {}

---@param options Config|nil
function M.setup(options)
	M.options = vim.tbl_deep_extend('force', {}, defaults, options or {})
end

---@param options Config|nil
function M.extend(options)
	M.options =
		vim.tbl_deep_extend('force', {}, M.options or defaults, options or {})
end

M.setup()

return M