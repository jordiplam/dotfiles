-- Load "standard" vis modules.
require('vis')
require('plugins/complete-word')
-- Load git Plugins.
--require('plugins/vis-surround/init')
require('plugins/vis-golang/init')
require('plugins/vis-filetype-settings/vis-filetype-settings')

-- Per file settings
settings = {
	go = {"map! normal <F6> :goimports<Enter>"},
	markdown = {"set tw 4", "set syntax latex"},
	python = {"set tw 4", "set et on"},
	haskell = {"set tw 2", "set et on"},
}

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
	vis:command('set theme pla')
	vis:command('set autoindent on')
	vis:command("set shell /bin/sh")
	vis:command("set expandtab off")
	vis:command("set tabwidth 8")
	-- Custom commands
	vis:map(vis.modes.NORMAL, "<F5>", ":w<Enter>:!make;read pause<Enter>")
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options e.g.
	vis:command('set relativenumbers')
	vis:command('set colorcolumn 80')
	vis:command('set show-tabs')
	vis:command('set cursorline')
end)