local errorPopupShown = false
local setidentity = syn and syn.set_thread_identity or set_thread_identity or setidentity or setthreadidentity or function() end
local getidentity = syn and syn.get_thread_identity or get_thread_identity or getidentity or getthreadidentity or function() return 8 end
local isfile = isfile or function(file)
	local suc, res = pcall(function() return readfile(file) end)
	return suc and res ~= nil
end
local delfile = delfile or function(file) writefile(file, "") end

local function displayErrorPopup(text, func)
	local oldidentity = getidentity()
	setidentity(8)
	local ErrorPrompt = getrenv().require(game:GetService("CoreGui").RobloxGui.Modules.ErrorPrompt)
	local prompt = ErrorPrompt.new("Default")
	prompt._hideErrorCode = true
	local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
	prompt:setErrorTitle("xape")
	prompt:updateButtons({{
		Text = "OK",
		Callback = function(local errorPopupShown = false
local setidentity = syn and syn.set_thread_identity or set_thread_identity or setidentity or setthreadidentity or function() end
local getidentity = syn and syn.get_thread_identity or get_thread_identity or getidentity or getthreadidentity or function() return 8 end
local isfile = isfile or function(file)
	local suc, res = pcall(function() return readfile(file) end)
	return suc and res ~= nil
end
local delfile = delfile or function(file) writefile(file, "") end

local function displayErrorPopup(text, func)
	local oldidentity = getidentity()
	setidentity(8)
	local ErrorPrompt = getrenv().require(game:GetService("CoreGui").RobloxGui.Modules.ErrorPrompt)
	local prompt = ErrorPrompt.new("Default")
	prompt._hideErrorCode = true
	local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
	prompt:setErrorTitle("xape")
	prompt:updateButtons({{
		Text = "OK",
		Callback = function() 
			prompt:_close() 
			if func then func() end
		end,
		Primary = true
	}}, 'Default')
	prompt:setParent(gui)
	prompt:_open(text)
	setidentity(oldidentity)
end

local function xapeGithubRequest(scripturl)
	if not isfile("xape/"..scripturl) then
		local suc, res
		task.delay(15, function()
			if not res and not errorPopupShown then 
				errorPopupShown = true
				displayErrorPopup("The connection to github is taking a while, Please be patient.")
			end
		end)
		suc, res = pcall(function() return game:HttpGet("https://raw.githubusercontent.com/ImNicknamez/xaperell/"..readfile("xape/commithash.txt").."/"..scripturl, true) end)
		if not suc or res == "404: Not Found" then
			displayErrorPopup("Failed to connect to github : xape/"..scripturl.." : "..res)
			error(res)
		end
		if scripturl:find(".lua") then res = "--This watermark is used to delete the file if its cached, remove it to make the file persist after commits.\n"..res end
		writefile("xape/"..scripturl, res)
	end
	return readfile("xape/"..scripturl)
end

if not shared.xapeDeveloper then 
	local commit = "main"
	for i,v in pairs(game:HttpGet("https://github.com/ImNicknamez/xaperell"):split("\n")) do 
		if v:find("commit") and v:find("fragment") then 
			local str = v:split("/")[5]
			commit = str:sub(0, str:find('"') - 1)
			break
		end
	end
	if commit then
		if isfolder("xape") then 
			if ((not isfile("xape/commithash.txt")) or (readfile("xape/commithash.txt") ~= commit or commit == "main")) then
				for i,v in pairs({"xape/Universal.lua", "xape/MainScript.lua", "xape/GuiLibrary.lua"}) do 
					if isfile(v) and ({readfile(v):find("--This watermark is used to delete the file if its cached, remove it to make the file persist after commits.")})[1] == 1 then
						delfile(v)
					end 
				end
				if isfolder("xape/CustomModules") then 
					for i,v in pairs(listfiles("xape/CustomModules")) do 
						if isfile(v) and ({readfile(v):find("--This watermark is used to delete the file if its cached, remove it to make the file persist after commits.")})[1] == 1 then
							delfile(v)
						end 
					end
				end
				if isfolder("xape/Libraries") then 
					for i,v in pairs(listfiles("xape/Libraries")) do 
						if isfile(v) and ({readfile(v):find("--This watermark is used to delete the file if its cached, remove it to make the file persist after commits.")})[1] == 1 then
							delfile(v)
						end 
					end
				end
				writefile("xape/commithash.txt", commit)
			end
		else
			makefolder("xape")
			writefile("xape/commithash.txt", commit)
		end
	else
		displayErrorPopup("Failed to connect to github, please try using a VPN.")
		error("Failed to connect to github, please try using a VPN.")
	end
end

return loadstring(xapeGithubRequest("MainScript.lua"))()) 
			prompt:_close() 
			if func then func() end
		end,
		Primary = true
	}}, 'Default')
	prompt:setParent(gui)
	prompt:_open(text)
	setidentity(oldidentity)
end

local function xapeGithubRequest(scripturl)
	if not isfile("xape/"..scripturl) then
		local suc, res
		task.delay(15, function()
			if not res and not errorPopupShown then 
				errorPopupShown = true
				displayErrorPopup("The connection to github is taking a while, Please be patient.")
			end
		end)
		suc, res = pcall(function() return game:HttpGet("https://raw.githubusercontent.com/ImNicknamez/xaperell/"..readfile("xape/commithash.txt").."/"..scripturl, true) end)
		if not suc or res == "404: Not Found" then
			displayErrorPopup("Failed to connect to github : xape/"..scripturl.." : "..res)
			error(res)
		end
		if scripturl:find(".lua") then res = "--This watermark is used to delete the file if its cached, remove it to make the file persist after commits.\n"..res end
		writefile("xape/"..scripturl, res)
	end
	return readfile("xape/"..scripturl)
end

if not shared.xapeDeveloper then 
	local commit = "main"
	for i,v in pairs(game:HttpGet("https://github.com/ImNicknamez/xaperell"):split("\n")) do 
		if v:find("commit") and v:find("fragment") then 
			local str = v:split("/")[5]
			commit = str:sub(0, str:find('"') - 1)
			break
		end
	end
	if commit then
		if isfolder("xape") then 
			if ((not isfile("xape/commithash.txt")) or (readfile("xape/commithash.txt") ~= commit or commit == "main")) then
				for i,v in pairs({"xape/Universal.lua", "xape/MainScript.lua", "xape/GuiLibrary.lua"}) do 
					if isfile(v) and ({readfile(v):find("--This watermark is used to delete the file if its cached, remove it to make the file persist after commits.")})[1] == 1 then
						delfile(v)
					end 
				end
				if isfolder("xape/CustomModules") then 
					for i,v in pairs(listfiles("xape/CustomModules")) do 
						if isfile(v) and ({readfile(v):find("--This watermark is used to delete the file if its cached, remove it to make the file persist after commits.")})[1] == 1 then
							delfile(v)
						end 
					end
				end
				if isfolder("xape/Libraries") then 
					for i,v in pairs(listfiles("xape/Libraries")) do 
						if isfile(v) and ({readfile(v):find("--This watermark is used to delete the file if its cached, remove it to make the file persist after commits.")})[1] == 1 then
							delfile(v)
						end 
					end
				end
				writefile("xape/commithash.txt", commit)
			end
		else
			makefolder("xape")
			writefile("xape/commithash.txt", commit)
		end
	else
		displayErrorPopup("Failed to connect to github, please try using a VPN.")
		error("Failed to connect to github, please try using a VPN.")
	end
end

return loadstring(xapeGithubRequest("MainScript.lua"))()
