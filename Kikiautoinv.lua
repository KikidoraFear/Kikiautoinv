local function print(msg)
  DEFAULT_CHAT_FRAME:AddMessage(msg)
end

local active = false

SLASH_KIKIAUTOINV1 = "/kikiautoinv"
SlashCmdList["KIKIAUTOINV"] = function(msg)
  active = not active
  if active then
    print("Kikiautoinv activated")
  else
    print("Kikiautoinv deactivated")
  end
end

local parser = CreateFrame("Frame")
parser:RegisterEvent("CHAT_MSG_GUILD")

parser_sounds:SetScript("OnEvent", function()
  if active and (arg1 == "+") then
    if GetNumPartyMembers() == 4 then
      print("Converting to Raid...")
      ConvertToRaid()
    end
    print("Inviting "..arg2)
    InviteByName(arg2)
  end
end)