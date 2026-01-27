local Players = game:GetService("Players")

local create = require("@shared/vendored/create")
local colours = require("@shared/colours")
local assets = require("@shared/assets")

local localPlayer = Players.LocalPlayer

local toastHolder = create("ScreenGui")({
	DisplayOrder = math.pow(2, 31) - 1,
	Parent = localPlayer:FindFirstChildWhichIsA("PlayerGui"),
})

local toastStack = create("ScrollingFrame")({
	Size = UDim2.new(0.5, 0, 1, 0),
	Position = UDim2.new(0.5, 0, 0, 0),
	AnchorPoint = Vector2.new(0.5, 0),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	AutomaticCanvasSize = Enum.AutomaticSize.Y,
	ScrollBarThickness = 4,
	CanvasSize = UDim2.new(),
	ScrollingDirection = Enum.ScrollingDirection.Y,
	ScrollBarImageColor3 = colours.ACCENT_COLOUR,
	VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,

	Children = {
		create("UIListLayout")({
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 4),
		}),
	},

	Parent = toastHolder,
})

local API = {}

function API.createToast(title: string, description: string, imageId: string?)
	imageId = imageId or assets.ICON

	local icon = create("ImageLabel")({
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0, 56, 0, 56),
		BackgroundTransparency = 1,
		Image = imageId,
	})

	local iconWidthOffset = icon.Size.X.Offset + 8

	local titleLabel = create("TextLabel")({
		Text = `<b>{title}</b>`,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center,
		TextSize = 24,
		TextColor3 = colours.ACCENT_COLOUR,
		RichText = true,
		Font = Enum.Font.Roboto,

		Position = UDim2.new(0, iconWidthOffset, 0, 0),
		AnchorPoint = Vector2.new(0, 0),
		Size = UDim2.new(1, -iconWidthOffset, 0.5, 0),
		BackgroundTransparency = 1,
	})

	local descriptionLabel = create("TextLabel")({
		Text = `{description}`,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextSize = 16,
		TextColor3 = colours.TEXT_COLOUR,
		Font = Enum.Font.Roboto,
		RichText = true,
		TextWrapped = true,

		Position = UDim2.new(0, iconWidthOffset, 1, 0),
		AnchorPoint = Vector2.new(0, 1),
		Size = UDim2.new(1, -iconWidthOffset, 0.5, 0),
		BackgroundTransparency = 1,
	})

	local toastFrame = create("Frame")({
		Size = UDim2.new(1, 0, 0.075, 0),
		Position = UDim2.new(0.5, 0, 0, 0),
		AnchorPoint = Vector2.new(0.5, 0),
		BackgroundColor3 = colours.BACKGROUND_COLOUR,
		BackgroundTransparency = 0.3,

		Children = {
			create("UICorner")({}),
		},
	})

	icon.Parent = toastFrame
	titleLabel.Parent = toastFrame
	descriptionLabel.Parent = toastFrame
	toastFrame.Parent = toastStack
end

return API
