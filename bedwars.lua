---@diagnostic disable: undefined-global, undefined-field
---@diagnostic disable-next-line: deprecated
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()



local Window = Rayfield:CreateWindow({
    Name = "KeySystemNyrohub",
    LoadingTitle = "wait...",
    LoadingSubtitle = "by idiot",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Nyrohub"
    },
    Discord = {
       Enabled = false,
       Invite = "https://discord.gg/MsQTZrAv", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Nyro hub",
       Subtitle = "Key System",
       Note = "join our discord (https://discord.gg/MsQTZrAv)",
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"098723217"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })



 local Section = Tab:CreateSection("Combat")



 local Button = Tab:CreateButton({
    Name = "killaura",
    Callback = function(killaura)
        local Player = "TheNoob_butbad"
local EnableMessage = "/e killaura on" 
local DisableMessage = "/e killaura off"
local Radius = 50

local Exploiter = nil
local Enabled = false

for _, Player in pairs(PlayerService.getPlayers()) do
    if Player.name == User then
        Exploiter = Player
    end
end

task.spawn(function()
    while task.wait() do
        if (Enabled) then
            for _, Player in pairs(PlayerService.getPlayers()) do
                if Player.name ~= User then
                    local Entity = Player:getEntity()
        
                    if (Entity) and (Entity:isAlive()) then
                        local PlayerPosition = Entity:getPosition()
                        local ExploiterPosition = Exploiter:getEntity():getPosition()
        
                        if (not ExploiterPosition) then
                            continue
                        end
        
                        if (PlayerPosition - ExploiterPosition).magnitude < Radius then
                            local ExploiterTeam = TeamService.getTeam(Exploiter)
                            local PlayerTeam = TeamService.getTeam(Player)
    
                            if (ExploiterTeam ~= PlayerTeam) then
                                CombatService.damage(Entity, 15)
                            end
                        end
                    end
                end
            end
        end
    end
end)

Events.PlayerChatted(function(event)
    local Player = event.player
    local Message = event.message

    if (Player.name == Exploiter.name) then
        if (string.lower(Message) == string.lower(EnableMessage)) then
            Enabled = true
        elseif (string.lower(Message) == string.lower(DisableMessage)) then
            Enabled = false
        end
    end
end)



    -- The function that takes place when the button is pressed
    end,
 })



 local Button = Tab:CreateButton({
    Name = "esp",
    Callback = function(esp)
        while wait(0.5) do
            for i, LocalPlayer in ipairs(workspace:GetDescendants()) do
                if LocalPlayer:FindFirstChild("Humanoid") then
                    if not childrik:FindFirstChild("EspBox") then
                        if LocalPlayer ~= game.Players.LocalPlayer.Character then
                            local esp = Instance.new("BoxHandleAdornment",LocalPlayer)
                            esp.Adornee = LocalPlayer
                            esp.ZIndex = 0
                            esp.Size = Vector3.new(4, 5, 1)
                            esp.Transparency = 0.65
                            esp.Color3 = Color3.fromRGB(255,48,48)
                            esp.AlwaysOnTop = true
                            esp.Name = "EspBox"
                        end
                    end
                end
            end
         end
    -- The function that takes place when the button is pressed
    end,
 })



 local Slider = Tab:CreateSlider({
    Name = "Walkspeed",
    Range = {20, 300},
    Increment = 10,
    Suffix = "Walkspeed",
    CurrentValue = 10,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(r)
        game.Player.LocalPlayer.Character.Humanoid.Walkspeed = r
    -- The function that takes place when the slider changes
    -- The variable (Value) is a number which correlates to the value the slider is currently at
    end,
 })



 local Slider = Tab:CreateSlider({
    Name = "JumpPower",
    Range = {15, 100},
    Increment = 10,
    Suffix = "JumpPower",
    CurrentValue = 10,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(r)
        game.Player.LocalPlayer.Character.Humanoid.JumpPower = r
    -- The function that takes place when the slider changes
    -- The variable (Value) is a number which correlates to the value the slider is currently at
    end,
 })
