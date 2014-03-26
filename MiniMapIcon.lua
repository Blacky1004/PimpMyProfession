--
-- Created by IntelliJ IDEA.
-- User: Jens
-- Date: 25.03.14
-- Time: 11:52
-- To change this template use File | Settings | File Templates.
--

local miniMapIcon = CreateFrame("Button", "PMPMiniMapicon", Minimap)
local L = LibStub("AceLocale-3.0"):GetLocale("PimpMyProfession")
PimpMyProfession.MiniIcon = miniMapIcon

local function click(object, button)
    if(button == "RightButton") then
        print("Rechter Button nicht belegt")
    else
        if IsShiftKeyDown() then
           local nlistgui = PimpMyProfession.NlistFrame
            if(nlistgui:IsVisible()) then
                nlistgui:Hide()
            else
                nlistgui:Show()
            end
        else
            local gui = PimpMyProfession.MainFrame
            if(gui:IsVisible()) then
                gui:Hide()
            else
                gui:Show()
            end
        end
    end
end

function miniMapIcon.Reposition(angle)

    miniMapIcon:Show()
    local width, height = Minimap:GetWidth()/2, Minimap:GetHeight()/2
    local iconX, iconY
    iconX = width * cos(0.5)
    iconY = height * cos(0.5)

    miniMapIcon:ClearAllPoints()
    miniMapIcon:SetPoint("CENTER", Minimap, "CENTER", iconX, iconY)
end
miniMapIcon:SetToplevel(true)
miniMapIcon:SetMovable(true)
miniMapIcon:SetFrameStrata("LOW")
miniMapIcon:SetWidth(20)
miniMapIcon:SetHeight(20)
miniMapIcon:SetPoint("RIGHT", Minimap, "LEFT", 0,0)
miniMapIcon:Hide()
miniMapIcon.icon = miniMapIcon:CreateTexture("", "BACKGROUND")
miniMapIcon.icon:SetTexture("Interface\\AddOns\\PimpMyProfession\\icon")
miniMapIcon.icon:SetTexCoord(0.075, 0.925, 0.075, 0.925)
miniMapIcon.icon:SetWidth(20)
miniMapIcon.icon:SetHeight(20)
miniMapIcon.icon:SetPoint("TOPLEFT", miniMapIcon, "TOPLEFT", 0,0)
miniMapIcon.mask = miniMapIcon:CreateTexture("", "OVERLAY")
miniMapIcon.mask:SetTexCoord(0.0,0.6,0.0,0.6)
miniMapIcon.mask:SetTexture("Interface\\Minimap\\Minimap-TrackingBorder")
miniMapIcon.mask:SetWidth(36)
miniMapIcon.mask:SetHeight(36)
miniMapIcon.mask:SetPoint("TOPLEFT", miniMapIcon, "TOPLEFT", -8,8)

miniMapIcon:RegisterForClicks("LeftButtonUp","RightButtonUp")
miniMapIcon:SetScript("OnClick", click)

local sideIcon
local SlideBar

if LibStub then
    SlideBar = LibStub:GetLibrary("SlideBar", true)
    local LibDataBroker = LibStub:GetLibrary("LibDataBroker-1.1", true)
    if LibDataBroker then
        sideIcon = LibDataBroker:NewDataObject("PimpMyProfession", {
            type = "launcher",
            icon =  "Interface\\AddOns\\PimpMyProfession\\icon",
            OnClick = function(self, button) click(self, button) end
        })
        function sideIcon:OnTooltipShow()
            self:AddLine("PimpMyProfession", 1,1, 0.5,1)
            self:AddLine(L["PmpMMTIP"], 1,1,0.5,1)
            self:AddLine("|cff1fb3ff"..L["Click"].."|r "..L["TipOpenClick"], 1,1,0.5,1)
        end
        function sideIcon:OnEnter()
            GameTooltip:SetOwner(self, "ANCHOR_NONE")
            GameTooltip:SetPoint("TOPLEFT", self, "BOTTOMLEFT")
            GameTooltip:ClearLines()
            sideIcon.OnTooltipShow(GameTooltip)
            GameTooltip:Show()
        end
        function sideIcon:OnLeave()
            GameTooltip:Hide()
        end
    end
end