QuestQuitter = {}

function QuestQuitter:QuestMapShow()
	QuestQuitter:CreateButton();
end

function QuestQuitter:ClickAbandon()
	PlaySound(SOUNDKIT.UI_GARRISON_COMMAND_TABLE_FOLLOWER_LEVEL_UP);
	for i = 1, C_QuestLog.GetNumQuestLogEntries() do
		local j = C_QuestLog.GetQuestIDForLogIndex(i)
		C_QuestLog.SetSelectedQuest(j)
		C_QuestLog.SetAbandonQuest()
		C_QuestLog.AbandonQuest();
	end
end

function QuestQuitter:CreateButton()
	local button = CreateFrame("Button", nil, QuestMapFrame.QuestsFrame)
	button:ClearAllPoints()
	button:SetPoint("TOPLEFT", -30, -5)
	button:SetWidth(35)
	button:SetHeight(35)
	button:SetNormalFontObject("GameFontNormal")
	button:RegisterForClicks("AnyUp")
	button:SetScript("OnClick", self.ClickAbandon)
	
	local ntex = button:CreateTexture()
	ntex:SetTexture("Interface/Buttons/CancelButton-Up")
	ntex:SetTexCoord(0, 1, 0, 1)
	ntex:SetAllPoints()	
	button:SetNormalTexture(ntex)
	
	local htex = button:CreateTexture()
	htex:SetTexture("Interface/Buttons/CancelButton-Highlight")
	htex:SetTexCoord(0, 1, 0, 1)
	htex:SetAllPoints()
	button:SetHighlightTexture(htex)
	
	local ptex = button:CreateTexture()
	ptex:SetTexture("Interface/Buttons/CancelButton-Down")
	ptex:SetTexCoord(0, 1, 0, 1)
	ptex:SetAllPoints()
	button:SetPushedTexture(ptex)
	return button
end

QuestMapFrame:HookScript("OnShow", QuestQuitter.QuestMapShow)