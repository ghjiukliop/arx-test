-- ✅ ARX TEST (Minimize UI Fix Only)

-- (Giữ nguyên Fluent, Window, Tabs ... từ script gốc của bạn)

local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/huanduy2495/Fluent-UILibrary/main/Library.lua"))()

local Window = Fluent:CreateWindow({
    Title = "HT Hub | Arx Test",
    SubTitle = "",
    TabWidth = 140,
    Size = UDim2.fromOffset(500, 400),
    Acrylic = false,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- 🎯 Sửa đúng lỗi Minimize không hiện UI

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

local MainUI = Fluent._screenGui
local LogoUI = Instance.new("ScreenGui")
LogoUI.Name = "HTHubLogo"
LogoUI.Parent = CoreGui
LogoUI.Enabled = false

local LogoButton = Instance.new("ImageButton")
LogoButton.Parent = LogoUI
LogoButton.Size = UDim2.new(0, 50, 0, 50)
LogoButton.Position = UDim2.new(0, 10, 0, 200)
LogoButton.Image = "rbxassetid://7734056747"
LogoButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
LogoButton.BackgroundTransparency = 0
LogoButton.Draggable = true
LogoButton.Active = true

local UICorner = Instance.new("UICorner", LogoButton)
UICorner.CornerRadius = UDim.new(1, 0)

local isMinimized = false

Window.Minimize = function()
    isMinimized = not isMinimized

    if isMinimized then
        MainUI.Enabled = false
        LogoUI.Enabled = true
    else
        MainUI.Enabled = true
        LogoUI.Enabled = false
    end
end

LogoButton.MouseButton1Click:Connect(function()
    isMinimized = false
    MainUI.Enabled = true
    LogoUI.Enabled = false
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.LeftControl then
        Window.Minimize()
    end
end)

-- 🎯 Tiếp theo bạn vẫn giữ Tabs, Sections, AutoBuy, AutoFarm của bạn bình thường
