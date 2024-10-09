local BeautyTable = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sigmanic/TableBeauty/master/repr.lua"))() --Supports More Features Made By: Ozzypig

local LoggerByBanbus=Instance.new("ScreenGui")
local Main=Instance.new("Frame")
local Glow=Instance.new("ImageLabel")
local Top_Container=Instance.new("Frame")
local Title=Instance.new("TextLabel")
local Scroll=Instance.new("ScrollingFrame")
local prevOutputPos=-0.0073
LoggerByBanbus.Name="AutoStratsLogger"
LoggerByBanbus.Parent=game:WaitForChild("Players").LocalPlayer.PlayerGui
LoggerByBanbus.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
Main.Name="Main"
Main.Parent=LoggerByBanbus
Main.BackgroundColor3=Color3.fromRGB(23,21,30)
Main.BorderSizePixel=0
Main.Position=UDim2.new(0.544935644,0,0.355803162,0)
Main.Size=UDim2.new(0,500,0,400)
Glow.Name="Glow"
Glow.Parent=Main 
Glow.BackgroundColor3=Color3.fromRGB(255,255,255)
Glow.BackgroundTransparency=1.000 
Glow.BorderSizePixel=0 Glow.Position=UDim2.new(0,-15,0,-15)
Glow.Size=UDim2.new(1,30,1,30)
Glow.ZIndex=0 
Glow.Image="rbxassetid://4996891970"
Glow.ImageColor3=Color3.fromRGB(15,15,15)
Glow.ScaleType=Enum.ScaleType.Slice
Glow.SliceCenter=Rect.new(20,20,280,280)
Top_Container.Name="Top_Container"
Top_Container.Parent=Main 
Top_Container.AnchorPoint=Vector2.new(0.5,0)
Top_Container.BackgroundColor3=Color3.fromRGB(255,255,255)
Top_Container.BackgroundTransparency=1.000
Top_Container.Position=UDim2.new(0.5,0,0,18)
Top_Container.Size=UDim2.new(1,-40,0,20)
Title.Name="Title"
Title.Parent=Top_Container Title.BackgroundColor3=Color3.fromRGB(255,255,255)
Title.BackgroundTransparency=1.000
Title.Position=UDim2.new(0.00764120743,0,-0.400000006,0)
Title.Size=UDim2.new(0.981785059,0,1.45000005,0)
Title.Font=Enum.Font.GothamBlack 
Title.Text="AUTOSTRATS LOGGER"
Title.TextColor3=Color3.fromRGB(255,255,255)
Title.TextSize=30.000 
Title.TextXAlignment=Enum.TextXAlignment.Left 
Scroll.Name="Scroll"
Scroll.Parent=Main 
Scroll.Active=true 
Scroll.AnchorPoint=Vector2.new(0.5,0)
Scroll.BackgroundColor3=Color3.fromRGB(255,255,255)
Scroll.BackgroundTransparency=1.000 
Scroll.BorderSizePixel=0 
Scroll.Position=UDim2.new(0.5,4,0,59)
Scroll.Size=UDim2.new(1,-20,1,-67)
Scroll.BottomImage="rbxassetid://5234388158"
Scroll.CanvasSize=UDim2.new(200,0,100,0)
Scroll.MidImage="rbxassetid://5234388158"
Scroll.ScrollBarThickness=8 
Scroll.TopImage="rbxassetid://5234388158"
Scroll.VerticalScrollBarInset=Enum.ScrollBarInset.Always 
local output=nil
local function drag()
	local script=Instance.new('LocalScript',Main)
	script.Name="Dragify"
	local UIS=game:GetService("UserInputService")
	function dragify(Frame)
		dragToggle=nil 
		dragInput=nil 
		dragStart=nil 
		local dragPos=nil 
		function updateInput(input)
			local Delta=input.Position-dragStart 
			local Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+Delta.X,startPos.Y.Scale,startPos.Y.Offset+Delta.Y)
			game:GetService("TweenService"):Create(Frame,TweenInfo.new(0.1),{Position=Position}):Play()
		end
		Frame.InputBegan:Connect(function(input)
			if(input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch)and UIS:GetFocusedTextBox()==nil then
				dragToggle=true 
				dragStart=input.Position 
				startPos=Frame.Position 
				input.Changed:Connect(function()
					if input.UserInputState==Enum.UserInputState.End then
						dragToggle=false 
					end 
				end)
			end 
		end)
		Frame.InputChanged:Connect(function(input)
			if input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch then
				dragInput=input
			end 
		end)
		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if input==dragInput and dragToggle then
				updateInput(input)
			end
		end)
	end
	dragify(script.Parent)
end

drag()

local function positioning()
	local script=Instance.new('LocalScript',Main)
	script.Name="Positioning"
	script.Parent:TweenPosition(UDim2.new(0.5,0,0.5,0),"Out","Quad",1)
	script.Parent.Draggable=true
end
function output(msg, col)
	if col == nil then
		col=Color3.fromRGB(255,255,255)
	end
	local hours=os.date("*t")["hour"]
	local mins=os.date("*t")["min"]
	local sec=os.date("*t")["sec"]
	local colour=Color3.fromRGB(col)
	local o=Instance.new("TextLabel",Scroll)
	o.Text="["..hours..":"..mins..":"..sec.."] "..msg 
	o.Size=UDim2.new(0.005,0,0.001,0)
	o.Position=UDim2.new(0,0,.007+prevOutputPos,0)
	o.Font=Enum.Font.SourceSansSemibold 
	o.TextColor3=colour 
	o.TextStrokeTransparency=0 
	o.BackgroundTransparency=1 
	o.BackgroundColor3=Color3.new(0,0,0)
	o.BorderSizePixel=0 
	o.BorderColor3=Color3.new(0,0,0)
	o.FontSize="Size14"
	o.TextXAlignment=Enum.TextXAlignment.Left
	o.ClipsDescendants=true prevOutputPos=prevOutputPos+0.0005 
end 

output("Fork with Old UI made by Skrem <3", Color3.fromRGB(255,0,0))

positioning()

local DefaultSize = 0.9
if not LoggerByBanbus:FindFirstChildOfClass("UIScale") then
	Instance.new("UIScale", LoggerByBanbus)
end
local UiScale = LoggerByBanbus:FindFirstChildOfClass("UIScale")
local ScaleY = 720
local Ratio = workspace:WaitForChild("Camera").ViewportSize.Y / ScaleY
local RatioMultiplied = Ratio * DefaultSize
UiScale.Scale = RatioMultiplied

workspace:WaitForChild("Camera"):GetPropertyChangedSignal("ViewportSize"):Connect(function()
	local DefaultSize = 0.925
	if not LoggerByBanbus:FindFirstChildOfClass("UIScale") then
		Instance.new("UIScale", LoggerByBanbus)
	end
	local UiScale = LoggerByBanbus:FindFirstChildOfClass("UIScale")
	local ScaleY = 720
	local Ratio = workspace:WaitForChild("Camera").ViewportSize.Y / ScaleY
	local RatioMultiplied = Ratio * DefaultSize
	UiScale.Scale = RatioMultiplied
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

getgenv().WriteFile = WriteFile or function(check,name,location,str)
	if not check then
		return
	end
	if type(name) == "string" then
		if not type(location) == "string" then
			location = ""
		end
		if not isfolder(location) then
			makefolder(location)
		end
		if type(str) ~= "string" then
			error("Argument 4 must be a string got " .. tostring(number))
		end
		writefile(location.."/"..name..".txt",str)
	else
		error("Argument 2 must be a string got " .. tostring(number))
	end
end
getgenv().AppendFile = AppendFile or function(check,name,location,str)
	if not check then
		return
	end
	if type(name) == "string" then
		if not type(location) == "string" then
			location = ""
		end
		if not isfolder(location) then
			WriteFile(check,name,location,str)
		end
		if type(str) ~= "string" then
			error("Argument 4 must be a string got " .. tostring(number))
		end
		if isfile(location.."/"..name..".txt") then
			appendfile(location.."/"..name..".txt",str)
		else
			WriteFile(check,name,location,str)
		end
	else
		error("Argument 2 must be a string got " .. tostring(number))
	end
end

local Typelist = {
	["Info"] = Color3.fromRGB(255, 255, 255),
	["Warn"] = Color3.fromRGB(255, 230, 30),
	["Error"] = Color3.fromRGB(255, 0, 0),
}

getgenv().ConsolePrint = function(Color,Type,...)
	local Color = typeof(Color) == "Color3" and Color or Color3.fromRGB(255, 255, 255)
	local Type = type(Type) == "string" and Type or "Info"
	local String = ""
	if Type == "Table" then
		local TotalIndex = 1
		for i,v in next, {...} do
			if type(v) ~= "table" then
				v = {v}
			end
			String = String..(TotalIndex > 1 and "\n" or "")..BeautyTable(v)
			TotalIndex += 1
		end
	else
		for i,v in next, {...} do
			if type(v) ~= "string" then
				v = tostring(v)
			end
		end
		String = table.concat({...}, ", ")
	end
	for i,v in next, string.split(String, "\n") do
		local text = (i == 1 and "["..os.date("%X").."]["..Type.."] " or "")..v
		local color = Typelist[Type]
		output(text, color)
	end
	if Type == "Info" then
		print("["..os.date("%X").."]["..Type.."] "..String)
	elseif Type == "Warn" then
		pcall(function()
			warn("["..os.date("%X").."]["..Type.."] "..String)
		end)
	elseif Type == "Error" then
		pcall(function()
			error("["..os.date("%X").."]["..Type.."] "..String)
		end)
	end
	getgenv().AppendFile(true,LocalPlayer.Name.."'s log","StrategiesX/UserLogs","["..os.date("%X").."]["..Type.."] "..String.."\n")
end
getgenv().ConsoleInfo = function(...)
	local TableText = {...}
	for i,v in next, TableText do
		if type(v) ~= "string" then
			TableText[i] = tostring(v)
		end
	end
	local Text = table.concat(TableText, " ")
	ConsolePrint(Typelist["Info"],"Info",Text)
end
getgenv().ConsoleWarn = function(...)
	local TableText = {...}
	for i,v in next, TableText do
		if type(v) ~= "string" then
			TableText[i] = tostring(v)
		end
	end
	local Text = table.concat(TableText, " ")
	ConsolePrint(Typelist["Warn"],"Warn",Text)
end
getgenv().ConsoleError = function(...)
	local TableText = {...}
	for i,v in next, TableText do
		if type(v) ~= "string" then
			TableText[i] = tostring(v)
		end
	end
	local Text = table.concat(TableText, " ")
	ConsolePrint(Typelist["Error"],"Error",Text)
end
getgenv().ConsoleTable = function(...)
	ConsolePrint(Typelist["Info"],"Table",...)
end
