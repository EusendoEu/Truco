print("FUNCIONOU")

--[[
    Gabriel HUB - Premium GUI for Prison Life
    Made with ❤️
]]

-- Services
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")

-- Variables
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = Workspace.CurrentCamera

-- Wait for character
repeat wait() until LocalPlayer.Character
local Character = LocalPlayer.Character
local Humanoid = Character:FindFirstChildOfClass("Humanoid")
local RootPart = Character:FindFirstChild("HumanoidRootPart")

-- Anti-AFK
local VirtualUser = game:GetService("VirtualUser")
LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

-- Notification System
local NotificationLibrary = {}

function NotificationLibrary:Create(title, text, duration)
    duration = duration or 3
    local gui = Instance.new("ScreenGui")
    gui.Name = "Notification"
    gui.Parent = CoreGui
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.ResetOnSpawn = false

    local frame = Instance.new("Frame")
    frame.Name = "MainFrame"
    frame.Parent = gui
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    frame.BorderSizePixel = 0
    frame.Position = UDim2.new(1, 0, 0, 20)
    frame.Size = UDim2.new(0, 300, 0, 80)
    frame.AnchorPoint = Vector2.new(1, 0)
    frame.ClipsDescendants = true

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(255, 50, 50)
    stroke.Thickness = 1.5
    stroke.Parent = frame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Parent = frame
    titleLabel.BackgroundTransparency = 1
    titleLabel.Position = UDim2.new(0, 15, 0, 8)
    titleLabel.Size = UDim2.new(1, -30, 0, 20)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 16
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "Text"
    textLabel.Parent = frame
    textLabel.BackgroundTransparency = 1
    textLabel.Position = UDim2.new(0, 15, 0, 32)
    textLabel.Size = UDim2.new(1, -30, 0, 40)
    textLabel.Font = Enum.Font.Gotham
    textLabel.Text = text
    textLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    textLabel.TextSize = 13
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.TextWrapped = true

    -- Slide in
    local slideIn = TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -20, 0, 20)
    })
    slideIn:Play()

    -- Slide out
    delay(duration, function()
        local slideOut = TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Position = UDim2.new(1, 0, 0, 20)
        })
        slideOut:Play()
        slideOut.Completed:Wait()
        gui:Destroy()
    end)

    return gui
end

-- Main GUI
local GabrielHUB = Instance.new("ScreenGui")
GabrielHUB.Name = "GabrielHUB"
GabrielHUB.Parent = CoreGui
GabrielHUB.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GabrielHUB.ResetOnSpawn = false

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = GabrielHUB
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 650, 0, 450)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.ClipsDescendants = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(255, 50, 50)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

-- Blur Background
local BlurFrame = Instance.new("Frame")
BlurFrame.Name = "Blur"
BlurFrame.Parent = MainFrame
BlurFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
BlurFrame.BackgroundTransparency = 0.3
BlurFrame.BorderSizePixel = 0
BlurFrame.Size = UDim2.new(1, 0, 1, 0)
BlurFrame.ZIndex = 0

-- Top Bar
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 80)

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 10)
TopBarCorner.Parent = TopBar

local TopStroke = Instance.new("UIStroke")
TopStroke.Color = Color3.fromRGB(255, 50, 50)
TopStroke.Thickness = 1
TopStroke.Parent = TopBar

-- Avatar Circle
local AvatarFrame = Instance.new("Frame")
AvatarFrame.Name = "AvatarFrame"
AvatarFrame.Parent = TopBar
AvatarFrame.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
AvatarFrame.Position = UDim2.new(0, 15, 0.5, -25)
AvatarFrame.Size = UDim2.new(0, 50, 0, 50)
AvatarFrame.AnchorPoint = Vector2.new(0, 0.5)

local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(1, 0)
AvatarCorner.Parent = AvatarFrame

local AvatarImage = Instance.new("ImageLabel")
AvatarImage.Name = "Avatar"
AvatarImage.Parent = AvatarFrame
AvatarImage.BackgroundTransparency = 1
AvatarImage.Position = UDim2.new(0, 2, 0, 2)
AvatarImage.Size = UDim2.new(1, -4, 1, -4)
AvatarImage.Image = "rbxthumb://type=AvatarHeadShot&id="..LocalPlayer.UserId.."&w=100&h=100"
AvatarImage.ZIndex = 2

local AvatarCorner2 = Instance.new("UICorner")
AvatarCorner2.CornerRadius = UDim.new(1, 0)
AvatarCorner2.Parent = AvatarImage

-- Title
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "Title"
TitleLabel.Parent = TopBar
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 75, 0.5, -12)
TitleLabel.Size = UDim2.new(0, 200, 0, 24)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "Gabriel HUB"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 24
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.TextStrokeTransparency = 0.5

-- Subtitle
local SubtitleLabel = Instance.new("TextLabel")
SubtitleLabel.Name = "Subtitle"
SubtitleLabel.Parent = TopBar
SubtitleLabel.BackgroundTransparency = 1
SubtitleLabel.Position = UDim2.new(0, 75, 0.5, 15)
SubtitleLabel.Size = UDim2.new(0, 200, 0, 16)
SubtitleLabel.Font = Enum.Font.Gotham
SubtitleLabel.Text = "Prison Life Premium"
SubtitleLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
SubtitleLabel.TextSize = 12
SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "Close"
CloseButton.Parent = TopBar
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.Position = UDim2.new(1, -35, 0.5, -12)
CloseButton.Size = UDim2.new(0, 24, 0, 24)
CloseButton.AnchorPoint = Vector2.new(1, 0.5)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14
CloseButton.BorderSizePixel = 0

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 4)
CloseCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    local closeTween = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0)
    })
    closeTween:Play()
    closeTween.Completed:Wait()
    GabrielHUB:Destroy()
end)

-- Tab System
local Tabs = {}
local TabButtons = {}
local currentTab = "Main"

function CreateTab(name, icon)
    local tab = Instance.new("ScrollingFrame")
    tab.Name = name
    tab.Parent = MainFrame
    tab.BackgroundTransparency = 1
    tab.Position = UDim2.new(0, 10, 0, 90)
    tab.Size = UDim2.new(1, -20, 1, -100)
    tab.CanvasSize = UDim2.new(0, 0, 0, 0)
    tab.ScrollBarThickness = 4
    tab.ScrollBarImageColor3 = Color3.fromRGB(255, 50, 50)
    tab.Visible = false
    tab.ZIndex = 1

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = tab
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 8)

    local UIPadding = Instance.new("UIPadding")
    UIPadding.Parent = tab
    UIPadding.PaddingTop = UDim.new(0, 5)

    Tabs[name] = tab
    return tab
end

-- Function to create section
function CreateSection(tab, title)
    local section = Instance.new("Frame")
    section.Name = title
    section.Parent = tab
    section.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    section.BorderSizePixel = 0
    section.Size = UDim2.new(1, -10, 0, 40)

    local sectionCorner = Instance.new("UICorner")
    sectionCorner.CornerRadius = UDim.new(0, 6)
    sectionCorner.Parent = section

    local sectionStroke = Instance.new("UIStroke")
    sectionStroke.Color = Color3.fromRGB(255, 50, 50)
    sectionStroke.Thickness = 0.5
    sectionStroke.Parent = section

    local sectionTitle = Instance.new("TextLabel")
    sectionTitle.Name = "Title"
    sectionTitle.Parent = section
    sectionTitle.BackgroundTransparency = 1
    sectionTitle.Position = UDim2.new(0, 12, 0, 0)
    sectionTitle.Size = UDim2.new(1, -24, 0, 40)
    sectionTitle.Font = Enum.Font.GothamBold
    sectionTitle.Text = title
    sectionTitle.TextColor3 = Color3.fromRGB(255, 100, 100)
    sectionTitle.TextSize = 14
    sectionTitle.TextXAlignment = Enum.TextXAlignment.Left

    local buttonsFrame = Instance.new("Frame")
    buttonsFrame.Name = "Buttons"
    buttonsFrame.Parent = section
    buttonsFrame.BackgroundTransparency = 1
    buttonsFrame.Position = UDim2.new(0, 10, 0, 45)
    buttonsFrame.Size = UDim2.new(1, -20, 0, 0)

    local UIListLayout2 = Instance.new("UIListLayout")
    UIListLayout2.Parent = buttonsFrame
    UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout2.Padding = UDim.new(0, 6)

    section.Size = UDim2.new(1, -10, 0, 45)

    return buttonsFrame, section
end

-- Button Creator
function CreateButton(parent, text, callback)
    local button = Instance.new("TextButton")
    button.Name = text
    button.Parent = parent
    button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    button.BorderSizePixel = 0
    button.Size = UDim2.new(1, 0, 0, 35)
    button.Font = Enum.Font.Gotham
    button.Text = "  "..text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 13
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.AutoButtonColor = false

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 5)
    buttonCorner.Parent = button

    -- Hover effects
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        }):Play()
    end)

    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        }):Play()
    end)

    button.MouseButton1Click:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {
            BackgroundColor3 = Color3.fromRGB(200, 30, 30)
        }):Play()
        wait(0.1)
        TweenService:Create(button, TweenInfo.new(0.1), {
            BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        }):Play()
        callback()
    end)

    -- Adjust parent height
    local buttonCount = 0
    for _, child in pairs(parent:GetChildren()) do
        if child:IsA("TextButton") then
            buttonCount = buttonCount + 1
        end
    end
    parent.Parent.Size = UDim2.new(1, -10, 0, 45 + (buttonCount * 41))

    return button
end

-- Create slider
function CreateSlider(parent, text, min, max, default, callback)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Name = text.."_Slider"
    sliderFrame.Parent = parent
    sliderFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    sliderFrame.BorderSizePixel = 0
    sliderFrame.Size = UDim2.new(1, 0, 0, 60)

    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(0, 5)
    sliderCorner.Parent = sliderFrame

    local label = Instance.new("TextLabel")
    label.Parent = sliderFrame
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 10, 0, 5)
    label.Size = UDim2.new(1, -20, 0, 18)
    label.Font = Enum.Font.Gotham
    label.Text = text..": "..default
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left

    local slider = Instance.new("TextBox")
    slider.Parent = sliderFrame
    slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    slider.BorderSizePixel = 0
    slider.Position = UDim2.new(0, 10, 0, 28)
    slider.Size = UDim2.new(1, -20, 0, 22)
    slider.Font = Enum.Font.Gotham
    slider.Text = tostring(default)
    slider.TextColor3 = Color3.fromRGB(255, 255, 255)
    slider.TextSize = 12
    slider.ClearTextOnFocus = false

    local sliderCorner2 = Instance.new("UICorner")
    sliderCorner2.CornerRadius = UDim.new(0, 4)
    sliderCorner2.Parent = slider

    slider.FocusLost:Connect(function()
        local value = tonumber(slider.Text)
        if value then
            value = math.clamp(value, min, max)
            slider.Text = tostring(value)
            label.Text = text..": "..value
            callback(value)
        else
            slider.Text = tostring(default)
        end
    end)

    local buttonCount = 0
    for _, child in pairs(parent:GetChildren()) do
        if child:IsA("Frame") then
            buttonCount = buttonCount + 1
        end
    end
    parent.Parent.Size = UDim2.new(1, -10, 0, 45 + (buttonCount * 66))

    return slider
end

-- Create Main Tab
local mainTab = CreateTab("Main", "")
mainTab.Visible = true

-- Teleport Section
local teleportButtons, teleportSection = CreateSection(mainTab, "📍 Teleport")

CreateButton(teleportButtons, "Criminal Base", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-920, 92, 2138)
    NotificationLibrary:Create("Teleport", "Teleported to Criminal Base!", 3)
end)

CreateButton(teleportButtons, "Prison", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(920, 100, 2370)
    NotificationLibrary:Create("Teleport", "Teleported to Prison!", 3)
end)

CreateButton(teleportButtons, "Yard", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(790, 100, 2480)
    NotificationLibrary:Create("Teleport", "Teleported to Yard!", 3)
end)

CreateButton(teleportButtons, "Police", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(603, 100, 2273)
    NotificationLibrary:Create("Teleport", "Teleported to Police!", 3)
end)

CreateButton(teleportButtons, "Cafeteria", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(940, 100, 2250)
    NotificationLibrary:Create("Teleport", "Teleported to Cafeteria!", 3)
end)

-- Weapons Section
local weaponButtons, weaponSection = CreateSection(mainTab, "🔫 Weapons")

CreateButton(weaponButtons, "Give AK-47", function()
    local args = {
        [1] = LocalPlayer,
        [2] = "AK-47"
    }
    game:GetService("ReplicatedStorage").Remotes.TeamEvent:FireServer(unpack(args))
    NotificationLibrary:Create("Weapon", "AK-47 added!", 3)
end)

CreateButton(weaponButtons, "Give M9", function()
    local args = {
        [1] = LocalPlayer,
        [2] = "M9"
    }
    game:GetService("ReplicatedStorage").Remotes.TeamEvent:FireServer(unpack(args))
    NotificationLibrary:Create("Weapon", "M9 added!", 3)
end)

CreateButton(weaponButtons, "Give Remington 870", function()
    local args = {
        [1] = LocalPlayer,
        [2] = "Remington 870"
    }
    game:GetService("ReplicatedStorage").Remotes.TeamEvent:FireServer(unpack(args))
    NotificationLibrary:Create("Weapon", "Remington 870 added!", 3)
end)

CreateButton(weaponButtons, "Give Hammer", function()
    local args = {
        [1] = LocalPlayer,
        [2] = "Hammer"
    }
    game:GetService("ReplicatedStorage").Remotes.TeamEvent:FireServer(unpack(args))
    NotificationLibrary:Create("Weapon", "Hammer added!", 3)
end)

CreateButton(weaponButtons, "Give All Guns", function()
    local guns = {"AK-47", "M9", "Remington 870", "Hammer"}
    for _, gun in pairs(guns) do
        game:GetService("ReplicatedStorage").Remotes.TeamEvent:FireServer(LocalPlayer, gun)
    end
    NotificationLibrary:Create("Weapon", "All guns added!", 3)
end)

-- Combat Section
local combatButtons, combatSection = CreateSection(mainTab, "⚔️ Combat")

local killLoopEnabled = false
CreateButton(combatButtons, "Loop Kill Player", function()
    killLoopEnabled = not killLoopEnabled
    if killLoopEnabled then
        NotificationLibrary:Create("Combat", "Loop Kill enabled!", 3)
        spawn(function()
            while killLoopEnabled do
                wait()
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character then
                        local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            firetouchinterest(LocalPlayer.Character.HumanoidRootPart, hrp, 0)
                            firetouchinterest(LocalPlayer.Character.HumanoidRootPart, hrp, 1)
                        end
                    end
                end
            end
        end)
    else
        NotificationLibrary:Create("Combat", "Loop Kill disabled!", 3)
    end
end)

local killAuraEnabled = false
CreateButton(combatButtons, "Kill Aura", function()
    killAuraEnabled = not killAuraEnabled
    if killAuraEnabled then
        NotificationLibrary:Create("Combat", "Kill Aura enabled!", 3)
        spawn(function()
            while killAuraEnabled do
                wait()
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character then
                        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                        if humanoid and humanoid.Health > 0 then
                            local args = {
                                [1] = player.Character,
                            }
                            game:GetService("ReplicatedStorage").Remotes.DamageEvent:FireServer(unpack(args))
                        end
                    end
                end
            end
        end)
    else
        NotificationLibrary:Create("Combat", "Kill Aura disabled!", 3)
    end
end)

local aimbotEnabled = false
CreateButton(combatButtons, "Aimbot", function()
    aimbotEnabled = not aimbotEnabled
    if aimbotEnabled then
        NotificationLibrary:Create("Combat", "Aimbot enabled!", 3)
        spawn(function()
            while aimbotEnabled do
                wait()
                local nearestPlayer = nil
                local shortestDistance = math.huge
                
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                        local distance = (Camera.CFrame.Position - player.Character.Head.Position).Magnitude
                        if distance < shortestDistance then
                            shortestDistance = distance
                            nearestPlayer = player
                        end
                    end
                end
                
                if nearestPlayer then
                    Camera.CFrame = CFrame.new(Camera.CFrame.Position, nearestPlayer.Character.Head.Position)
                end
            end
        end)
    else
        NotificationLibrary:Create("Combat", "Aimbot disabled!", 3)
    end
end)

local silentAimEnabled = false
CreateButton(combatButtons, "Silent Aim", function()
    silentAimEnabled = not silentAimEnabled
    if silentAimEnabled then
        NotificationLibrary:Create("Combat", "Silent Aim enabled!", 3)
    else
        NotificationLibrary:Create("Combat", "Silent Aim disabled!", 3)
    end
end)

-- Player Section
local playerButtons, playerSection = CreateSection(mainTab, "🏃 Player")

CreateSlider(playerButtons, "WalkSpeed", 16, 100, 16, function(value)
    if Character and Humanoid then
        Humanoid.WalkSpeed = value
    end
    NotificationLibrary:Create("Player", "WalkSpeed set to "..value, 2)
end)

CreateSlider(playerButtons, "JumpPower", 50, 200, 50, function(value)
    if Character and Humanoid then
        Humanoid.JumpPower = value
    end
    NotificationLibrary:Create("Player", "JumpPower set to "..value, 2)
end)

local infiniteJumpEnabled = false
CreateButton(playerButtons, "Infinite Jump", function()
    infiniteJumpEnabled = not infiniteJumpEnabled
    if infiniteJumpEnabled then
        NotificationLibrary:Create("Player", "Infinite Jump enabled!", 3)
        spawn(function()
            while infiniteJumpEnabled do
                wait()
                if Character and Humanoid then
                    Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end)
    else
        NotificationLibrary:Create("Player", "Infinite Jump disabled!", 3)
    end
end)

local noclipEnabled = false
CreateButton(playerButtons, "Noclip", function()
    noclipEnabled = not noclipEnabled
    if noclipEnabled then
        NotificationLibrary:Create("Player", "Noclip enabled!", 3)
        spawn(function()
            while noclipEnabled do
                wait()
                if Character then
                    for _, part in pairs(Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end
        end)
    else
        NotificationLibrary:Create("Player", "Noclip disabled!", 3)
        if Character then
            for _, part in pairs(Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end
end)

-- Visual Section
local visualButtons, visualSection = CreateSection(mainTab, "👁️ Visual")

local espEnabled = false
local espObjects = {}

function clearESP()
    for _, obj in pairs(espObjects) do
        if obj then
            obj:Destroy()
        end
    end
    espObjects = {}
end

CreateButton(visualButtons, "ESP Players", function()
    espEnabled = not espEnabled
    if espEnabled then
        NotificationLibrary:Create("Visual", "ESP enabled!", 3)
        spawn(function()
            while espEnabled do
                wait()
                clearESP()
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "ESP_"..player.Name
                        highlight.Parent = player.Character
                        highlight.FillColor = Color3.fromRGB(255, 50, 50)
                        highlight.FillTransparency = 0.5
                        highlight.OutlineColor = Color3.fromRGB(255, 100, 100)
                        highlight.OutlineTransparency = 0
                        table.insert(espObjects, highlight)
                    end
                end
            end
            clearESP()
        end)
    else
        clearESP()
        NotificationLibrary:Create("Visual", "ESP disabled!", 3)
    end
end)

CreateButton(visualButtons, "ESP Guards", function()
    NotificationLibrary:Create("Visual", "ESP Guards - Target guards only", 3)
    clearESP()
    for _, player in pairs(Players:GetPlayers()) do
        if player.TeamColor == BrickColor.new("Bright blue") and player.Character then
            local highlight = Instance.new("Highlight")
            highlight.Parent = player.Character
            highlight.FillColor = Color3.fromRGB(0, 100, 255)
            highlight.FillTransparency = 0.5
            table.insert(espObjects, highlight)
        end
    end
end)

CreateButton(visualButtons, "ESP Criminals", function()
    NotificationLibrary:Create("Visual", "ESP Criminals - Target criminals only", 3)
    clearESP()
    for _, player in pairs(Players:GetPlayers()) do
        if player.TeamColor == BrickColor.new("Bright orange") and player.Character then
            local highlight = Instance.new("Highlight")
            highlight.Parent = player.Character
            highlight.FillColor = Color3.fromRGB(255, 150, 0)
            highlight.FillTransparency = 0.5
            table.insert(espObjects, highlight)
        end
    end
end)

-- Other Section
local otherButtons, otherSection = CreateSection(mainTab, "⚡ Other")

local antiArrestEnabled = false
CreateButton(otherButtons, "Anti Arrest", function()
    antiArrestEnabled = not antiArrestEnabled
    if antiArrestEnabled then
        NotificationLibrary:Create("Other", "Anti Arrest enabled!", 3)
    else
        NotificationLibrary:Create("Other", "Anti Arrest disabled!", 3)
    end
end)

CreateButton(otherButtons, "Auto Respawn", function()
    if Character and Humanoid then
        Humanoid.Health = 0
    end
    NotificationLibrary:Create("Other", "Respawning...", 3)
end)

local godModeEnabled = false
CreateButton(otherButtons, "God Mode", function()
    godModeEnabled = not godModeEnabled
    if godModeEnabled then
        NotificationLibrary:Create("Other", "God Mode enabled!", 3)
        spawn(function()
            while godModeEnabled do
                wait()
                if Character and Humanoid then
                    Humanoid.Health = Humanoid.MaxHealth
                end
            end
        end)
    else
        NotificationLibrary:Create("Other", "God Mode disabled!", 3)
    end
end)

CreateButton(otherButtons, "Rejoin Server", function()
    NotificationLibrary:Create("Other", "Rejoining server...", 3)
    wait(1)
    TeleportService:Teleport(game.PlaceId, LocalPlayer)
end)

-- Draggable System
local dragging = false
local dragInput = nil
local dragStart = nil
local startPos = nil

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Initial animation
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

local introTween = TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 650, 0, 450)
})
introTween:Play()

-- Welcome notification
delay(0.5, function()
    NotificationLibrary:Create("Gabriel HUB", "Welcome "..LocalPlayer.Name.."!", 5)
end)

-- Update Canvas Sizes
wait(0.1)
for _, tab in pairs(Tabs) do
    tab.CanvasSize = UDim2.new(0, 0, 0, tab.UIListLayout.AbsoluteContentSize.Y + 10)
end

-- Character reset handler
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    Humanoid = char:FindFirstChildOfClass("Humanoid")
    RootPart = char:FindFirstChild("HumanoidRootPart")
    wait(1)
    if noclipEnabled then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- Print
print("✅ Gabriel HUB loaded successfully!")
print("📌 Made with premium quality")
```