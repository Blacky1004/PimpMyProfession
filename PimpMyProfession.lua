--
-- Created by IntelliJ IDEA.
-- User: Jens
-- Date: 24.03.14
-- Time: 10:51
-- To change this template use File | Settings | File Templates.
--
PimpMyProfession = LibStub("AceAddon-3.0"):NewAddon("PimpMyProfession", "AceConsole-3.0", "AceEvent-3.0" );
--local SM = LibStub("LibSharedMedia-3.0")
local PimpMyProfession = _G.PimpMyProfession
local AceLocale = LibStub("AceLocale-3.0")
local L = AceLocale:GetLocale("PimpMyProfession")
local _
local AceGui = LibStub("AceGUI-3.0")
local MainFrame
local Default_Profile = {
    profile = {
        Colors = {
            ["Window"] = {
                ["Title"] = {r=1, g=0, b=0, a=1},
                ["Background"] = {r=24/255, g=24/255, b=24/255, a=1},
                ["Title Text"] = {r=1, g=1,b=1,a=1},
            },
        },
        Professions={},
        Font="Arial Narrow",
        ClampToScreen=false,
    },
}
PimpMyProfession.professions = {}
local fullInit = false
local have_prof_skill = {}

PimpMyProfession.consoleOptions = {
    name=L["PimpMyProfession"],
    type = 'group',
    args = {
        [L["show"]] = {
            order = 1,
            name=L["Show"],
            desc=L["Show the MainWindow"],
            type = 'execute',
            func = function() PimpMyProfession.MainWindow:Show(); PimpMyProfession:RefreshMainWindow() end,
            dialogHidden = true,
        },
        hide = {
            order = 2,
            name = L["Hide"],
            desc = L["Hide the MainWindow"],
        },
    },
}
PimpMyProfession.actualGuide = {
    recipes = {},
    needlist = {}
}
PimpMyProfession.Default_Profile = {
    profile = {
        ShowMainOnStart = false,
        ShowNListOnStart = true,
        LastProfGuide = {}
    }
}

function PimpMyProfession:OnInitialize()
    local AceDb = LibStub:GetLibrary("AceDB-3.0")
    PimpMyProfession.db = AceDb:New("PimpMyProfessionDB", Default_Profile)

    print("PimpMyProfession wurde geladen")
end

function PimpMyProfession:OnEnable()
    self:RegisterEvent('SKILL_LINES_CHANGED')
    print("PimpMyProfession wurde aktiviert")
    PimpMyProfession:CreateMainFrame()
    PimpMyProfession.MainFrame = MainFrame
    if not PimpMyProfession.db.profile.ShowMainOnStart then
        PimpMyProfession.MainFrame:Hide()
    end
    PimpMyProfession.MiniIcon.Reposition()
    PimpMyProfession:SKILL_LINES_CHANGED()
    PimpMyProfession.NlistFrame = PimpMyProfession:CreateNeedListFrame(171,244)
    if not PimpMyProfession.db.profile.ShowNListOnStart then
        PimpMyProfession.NlistFrame:Hide()
    end
 end

function PimpMyProfession:CreateMainFrame()
    MainFrame = AceGui:Create("Frame")
    MainFrame:SetTitle("PimpMyProfession")
    MainFrame:SetStatusText("PimpMyProfession Guide Übersicht")
    MainFrame:SetLayout("Flow")
end

function PimpMyProfession:SKILL_LINES_CHANGED()

    for index, key in pairs({GetProfessions()}) do
        local name, icon, rank, maxrank, numspells, spelloffset, skillline = GetProfessionInfo(key)
        PimpMyProfession.professions[name]={
            icon = icon,
            rank = rank,
            maxrank = maxrank,
            numspells = numspells,
            spelloffset = spelloffset,
            skillline = skillline
        }
    end
    --PimpMyProfession:GetNeedList(100,100)

end

function PimpMyProfession:SetSkillProfession(skill, profession)
    professions[profession] = skill
    if fullInit then self:SKILL_LINES_CHANGED() end
end