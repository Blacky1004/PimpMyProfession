--
-- Created by IntelliJ IDEA.
-- User: Jens
-- Date: 25.03.14
-- Time: 18:38
-- To change this template use File | Settings | File Templates.
--
local L = LibStub("AceLocale-3.0"):GetLocale("PimpMyProfession")

function PimpMyProfession:GetRecipeList(beruf, myrank)

end

function PimpMyProfession:GetNeedList(beruf, myrank)
    local needList

    if beruf == 171 then
       needList = PimpMyProfession.PmpDBAlchNeeds.shoplist
    end

    for k, v in pairs(needList) do

        if(v.plevel[2] <= myrank and v.plevel[3] > myrank) then
           -- laden der Itemdaten aus der Liste
            print("Lade Einkaufsliste für deinen Skillbereich...")
            for index, i in pairs(v.needs) do
               local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount,
               itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(i[1])
               local n = {
                    iName = itemName,
                    count = i[2],
                    texture = itemTexture,
                    iType = itemType,
                    itemid= i[1]
               }
               table.insert(PimpMyProfession.actualGuide.needlist, n)
            end
        end
    end
end

function PimpMyProfession:CreateNeedListFrame(beruf, myrank)
    --for index, key in pairs(PimpMyProfession.professions) do
       --print(index,key.skillline)
    --end
    local f = CreateFrame("Frame",nil, UIParent)
    f:SetClampedToScreen(true)
    f:SetMovable(true)
    f:EnableMouse(true)
    f:SetScript("OnMouseDown", function(self,button)
        if button == "LeftButton" and not self.isMoving then
            self:StartMoving();
            self.isMoving = true;
        end
    end)
    f:SetScript("OnMouseUp", function(self, button)
        if button == "LeftButton" and self.isMoving then
            self:StopMovingOrSizing()
            self.isMoving = false
        end
    end)
    f:SetScript("OnHide", function(self)
        if(self.isMoving) then
            self:StopMovingOrSizing()
            self.isMoving=false
        end
    end)
    f:SetWidth(460)
    f:SetHeight(300)
    f:SetBackdrop{
        bgFile = [[Interface\ToolTips\ChatBubble-Background.blp]],
        edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]],
        edgeSize = 16,
        tile = true, tileSize = 16,
        insets = {left = 4, right = 4, top = 4, bottom = 4}
    }
    f:SetPoint("CENTER",0,0)
    f.title = f:CreateFontString("NeedList_Title", "OVERLAY", "GameFontNormal")
    f.title:SetPoint("TOP",0,-8)
    f.title:SetText(L["NeedList Frame Title"])
    f.close = CreateFrame("Button", "nList_close", f, "UIPanelCloseButton")
    f.close:SetPoint("TOPRIGHT", 0,-2)

    --laden der Needliste

    for index, key in pairs(PimpMyProfession.actualGuide.needlist) do
        local item = CreateFrame("Button", "Nlist_item" ..key.itemid, f, "SecureActionButtonTemplate")
        item:SetSize(37,37)
        item:SetNormalTexture("Interface\\Buttons\\UI-Quickslot2")
        item:SetPushedTexture("Interface\\Buttons\\UI-Quickslot-Depress")
        item:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
        do local tex = item:GetNormalTexture()
            tex:ClearAllpoints()
            text:SetPoint("CENTER",0,-1)
            text:SetSize(64,64)
        end

        item.icon = item:CreateTexture("$parentIconTexture", "BORDER")
    end

    f:Show()

    return f
end