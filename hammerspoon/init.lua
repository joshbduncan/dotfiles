-- stupid workaround to undefined global hs
_hs = hs
hs = _hs

hs.ipc.cliInstall()

hs.loadSpoon("EmmyLua")

hs.loadSpoon("Hammerflow")
spoon.Hammerflow.registerFormat({
	atScreenEdge = 2,
	fillColor = { alpha = 0.875, hex = "282b36" },
	padding = 18,
	radius = 12,
	strokeColor = { alpha = 0.875, hex = "f1fa8b" },
	textColor = { alpha = 1, hex = "bd93f9" },
	textStyle = {
		paragraphStyle = { lineSpacing = 6 },
		shadow = { offset = { h = -1, w = 1 }, blurRadius = 10, color = { alpha = 0.50, white = 0 } },
	},
	strokeWidth = 6,
	textFont = "JetBrainsMono NFM Bold",
	textSize = 18,
})
spoon.Hammerflow.loadFirstValidTomlFile({
	"home.toml",
	"work.toml",
	"Spoons/Hammerflow.spoon/sample.toml",
})
-- optionally respect auto_reload setting in the toml config.
if spoon.Hammerflow.auto_reload then
	hs.loadSpoon("ReloadConfiguration")
	-- set any paths for auto reload
	spoon.ReloadConfiguration.watch_paths = { hs.configDir, "~/path/to/my/configs/" }
	spoon.ReloadConfiguration:start()
end

-- optionally register custom functions.
-- registerFunctions takes 1 or more tables.
-- each table contains functions that can be
-- called from your toml config using the
-- function: prefix, e.g.
-- h = "function:hi"
spoon.Hammerflow.registerFunctions({
	["hi"] = function()
		hs.alert("hi")
	end,
})

spoon.Hammerflow.registerFunctions({
	["ho"] = function()
		hs.alert("ho")
	end,
})
hs.alert.defaultStyle.atScreenEdge = 2
hs.alert.defaultStyle.textSize = 21
hs.alert.defaultStyle.padding = 21
hs.alert.defaultStyle.radius = 12

-- local mb = hs.menubar.new()
-- mb:setTitle("Donkey Cheeks")
-- mb:setClickCallback(function()
-- 	hs.alert("howdy partner")
-- end)

-- Adobe Command Palette Keybindings
-- hs.hotkey.bind({ "cmd", "shift" }, "p", function()
-- 	local apps = {
-- 		{
-- 			name = "Adobe Illustrator 2025",
-- 			menu_path = { "File", "Scripts", "AiCommandPalette" }
-- 		},
-- 		{
-- 			name = "Adobe Photoshop 2025",
-- 			menu_path = { "Plugins", "Ps Command Palette", "Launch Ps Command Palette" }
-- 		}
-- 	}
--
-- 	for _, app in ipairs(apps) do
-- 		local application = hs.appfinder.appFromName(app.name)
-- 		if application and application:isFrontmost() then
-- 			if application:findMenuItem(app.menu_path) == nil then
-- 				hs.notify.show(app.name, table.concat(app.menu_path, " > "), "Menu item not found!")
-- 				return
-- 			end
-- 			application:selectMenuItem(app.menu_path)
-- 		end
-- 	end
-- end)

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, ",", function()
	hs.messages.iMessage(3366130496, "the cat and the rat...")
end)

-- Quick Messages
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "m", function()
	local choices = {
		{
			["text"] = "Hey booboo (Nana)",
			["subText"] = "How's my booboo doing today?",
			["number"] = "3366130496",
		},
		{
			["text"] = "Headed home (LTD)",
			["subText"] = "Headed home... Need anything?",
			["number"] = "3366130496",
		},
		{
			["text"] = "Packing up (LTD)",
			["subText"] = "Packing up and heading home... Need anything?",
			["number"] = "3366130496",
		},
	}

	local send_message = function(result)
		if result == nil then
			return
		end
		hs.messages.iMessage(result.number, result.subText)
	end

	local c = hs.chooser.new(send_message)
	c:choices(choices)
	c:show()
end)

-- hammerspoon://openlocalpath?path=/Users/jbd/Dropbox/clients/McLaurin%20Farms/2025-07-07%20McLaurin%20Pumpkin%20Patch%20Banners%202025
hs.urlevent.bind("openlocalpath", function(eventName, params)
	print("Received urlevent:", eventName)

	-- for key, value in pairs(params) do
	--     print(key, value)
	-- end

	-- Replace this with your folder path
	local folderPath = params["path"]

	-- Escape the folder path properly
	local command = string.format([[osascript -e 'tell application "Finder" to reveal POSIX file "%s"']], folderPath)
	hs.execute(command)

	-- Optionally bring Finder to front
	hs.application.launchOrFocus("Finder")
end)

hs.urlevent.bind("myevent", function(eventName, params)
	print("Received event:", eventName)
	for key, value in pairs(params) do
		print(key, value)
	end
end)

-- hammerspoon://things-x-success
-- hammerspoon://things-x-error
-- hammerspoon://things-x-cancel

hs.urlevent.bind("things", function(eventName, params)
	print("Received event:", eventName)
	local project_folder = params["project-folder"]
	local things_ids_json = params["x-things-ids"]

	-- Parse the JSON array to get the first ID
	local things_ids = hs.json.decode(things_ids_json)
	local first_id = things_ids[1]

	print("Project folder:", project_folder)
	print("First Things ID:", first_id)

	-- Call your CLI command
	-- /Users/jbd/.local/bin/uv run --project /Users/jbd/Dropbox/Dev/dnkd dnkd clients --alfred
	local command = string.format(
		'echo "%s" "%s"',
		project_folder,
		first_id
	)

	hs.execute(command)

	-- Or if you need the output:
	local output, status, type, rc = hs.execute(command)
	print("Command output:", output)
	print("Exit code:", rc)
end)

hs.urlevent.bind("things-x-error", function(eventName, params)
	print("Received event:", eventName)
	for key, value in pairs(params) do
		print(key, value)
	end
end)

hs.urlevent.bind("things-x-cancel", function(eventName, params)
	print("Received event:", eventName)
	for key, value in pairs(params) do
		print(key, value)
	end
end)

-- Launch/focus specific apps with one keystroke.
-- Note: to get {^1,^2,^3} to work, you might need to change some conflicting
-- Mission Control keyboard shortcuts in SysPrefs > Keyboard > Shortcuts
hs.hotkey.bind({ "cmd", "alt", "ctrl", "shift" }, "b", function()
	hs.application.launchOrFocus("Safari")
end)
hs.hotkey.bind({ "cmd", "alt", "ctrl", "shift" }, "f", function()
	hs.application.launchOrFocus("Finder")
end)
hs.hotkey.bind({ "cmd", "alt", "ctrl", "shift" }, "p", function()
	hs.application.launchOrFocus("Things3")
end)
hs.hotkey.bind({ "cmd", "alt", "ctrl", "shift" }, "m", function()
	hs.application.launchOrFocus("Mimestream")
end)
hs.hotkey.bind({ "cmd", "alt", "ctrl", "shift" }, "5", function()
	hs.application.launchOrFocus("Mail")
end)
hs.hotkey.bind({ "cmd", "alt", "ctrl", "shift" }, "t", function()
	hs.application.launchOrFocus("Ghostty")
end)
hs.hotkey.bind({ "cmd", "alt", "ctrl", "shift" }, "i", function()
	hs.application.launchOrFocus("Visual Studio Code")
end)
