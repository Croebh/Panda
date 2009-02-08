﻿
local L = Panda.locale
local panel = Panda.panel.panels[3]


local name = GetSpellInfo(45357)
local twoinks = [[42906 42462 43418 41537 42410 42962 42400 41092 42458 41532 43417 41532 43417 42737 42908 40923 42964 42402 41108 42465 41536 43427 40909 42897 42746 41104 42415 41547 42970 42960
43424 42473 41547 42970 43424 43473 41098 42904 42744 41535 42973 42470 42749 42471 43551 41542 42736 41094 42955 43827 43554 42453 40896 42906 42406 43549 42453 40896 42906 42406]]
local function glyphcolorer(id, frame)
	local _, _, _, _, _, _, subtype = GetItemInfo(id)
	local c = subtype and RAID_CLASS_COLORS[subtype:gsub(" ", ""):upper()]
	frame.border:SetVertexColor(c and c.r or 0, c and c.g or 0, c and c.b or 0)
	frame.border:SetAlpha(1)
	frame.border:Show()

	if twoinks:match(id) then
		local fs = frame:CreateFontString(nil, "ARTWORK", "NumberFontNormalSmall")
		fs:SetPoint("TOPLEFT", frame.icon, "TOPLEFT", 0, -2)
		fs:SetText("*")
	end
end

local check = CreateFrame("CheckButton", "PandaGlyphProfit", panel, "OptionsCheckButtonTemplate")
check:SetWidth(22)
check:SetHeight(22)
check:SetPoint("TOPLEFT", Panda.panel, "BOTTOMLEFT", 185, 35)
check:SetScript("OnClick", function() Panda.showprofit = not Panda.showprofit; panel:Hide(); panel:Show() end)

local checklabel = check:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
checklabel:SetPoint("LEFT", check, "RIGHT", 5, 0)
checklabel:SetText("Show profit")

CreateFrame("Frame", nil, panel):SetScript("OnShow", function() if GetReagentCost then check:Show() else check:Hide() end end)


panel:RegisterFrame(GLYPHS, Panda.PanelFactory(45357,
[[39334 39774 43413 41096 42741 42956 41531 42408 42455 42907 40913 40922
    0     0   43418 41095 42743 42960 41537 42410 42462 42912 40897
  39338 43116 43423 41106 42734 42961 41530 42398 42461 42898 40924
    0     0   43417 41092 42735 42962 41532 42400 42458 42900 40914
    0     0   43427 41108 42737 42964 41536 42402 42465 42908 40923
  39339 43118 43422 41100 42738 42966 41540 42411 42467 42910 40919
    0     0   43424 41104 42746 42970 41547 42415 42473 42897 40909
  39340 43120 43420 41099 42747 42972 41533 42416 42466 42903 40902
    0     0   43414 41098 42744 42973 41535 42397 42470 42904 40916
  39341 43122 43416 41103 42750 42974 41541 42399 42468 42905 40901 43536 43543 43546 43541
  39342 43124 43428 41105 42749 42963 41527 42401 42471 42911 40903 43548 43553 43825 43826
    0     0   43432 41094 42736 42955 41542 42406 42453 42906 40896 43551 43827 43554 43549
    0     0     0     0   44955
]], glyphcolorer))


panel:RegisterFrame(L["Glyphs (Wrath)"], Panda.PanelFactory(45357,
[[39343 43126 43419 41102 42745 42958 41539 42412 42460 42909 40920 43552 43533   0     0   44680
    0     0   43431 41110 42752 42957 41517 42405 42454 42902 40908 43534
    0     0   43425 41109 42748 42965 41538 42409 42463 42915 40900 43537
    0     0   43429 41097 42751 42969 41518 42407 42469 42916 40906 43538
    0     0   43421 41101 42740 42954 41524 42396 42456 42901 40899 43542
    0     0   43426 41107 42739 42959 41526 42403 42457 42899 40915 43545
    0     0   43415 43867 42742 42967 41529 42404 42459 42913 40912 43547
    0     0   43412 43868 42754 42968 41534 42414 42464 42914 40921 43550
    0     0   43430 43869 42753 42971 41552 42417 42472 42917 44928
    0     0     0     0   44684
]], glyphcolorer, function(frame)
	frame:SetAttribute("type", "macro")
	if frame.id == 44680 then
		frame:SetAttribute("macrotext", "/run CloseTradeSkill()\n/cast "..name.."\n"..
			"/run for i=1,GetNumTradeSkills() do if GetTradeSkillInfo(i) == '"..L["Northrend Inscription Research"].."' then DoTradeSkill(i) end end CloseTradeSkill()")
	else
		frame:SetAttribute("macrotext", Panda.CraftMacro(name, frame.id))
	end
end))


panel:RegisterFrame(L["Minor Glyphs (by ink)"], Panda.PanelFactory(45357,
[[39334 39774 43395 43396 43366 43390 43339 43364 43379 43342 43354 43338 43335   0     0     0   44680
    0     0   43399 43397 43367 43340 43359 43361 43343 43371 43350 43356 43332
  39338 43116 43398 43377 43365 43357 43725 43373 43389 43316   0     0     0   44920 44922 44923
    0     0   43376 43380 43368 43360 43344 43386 43391 43331   0     0     0   43374 43394 43126 39343
  39339 43118 43369 43388 43385 43381 43372 43370 43392 43393 43351 43334 43674
  39340 43120 43378 43355   0     0     0     0   43400 43671 43539 43672 43673 43535 43544 43124 39342
]], glyphcolorer, function(frame)
	frame:SetAttribute("type", "macro")
	if frame.id == 44680 then
		frame:SetAttribute("macrotext", "/run CloseTradeSkill()\n/cast "..name.."\n"..
			"/run for i=1,GetNumTradeSkills() do if GetTradeSkillInfo(i) == '"..L["Minor Inscription Research"].."' then DoTradeSkill(i) end end CloseTradeSkill()")
	else
		frame:SetAttribute("macrotext", Panda.CraftMacro(name, frame.id))
	end
end))


panel:RegisterFrame(L["Minor Glyphs (by class)"], Panda.PanelFactory(45357,
[[43395 43366 43339 44920 43379 43725 44923 43342 43390 43354 43335 44922 43671
  43399 43367 43359   0   43343 43344   0   43371 43389 43350 43332   0   43539
  43396 43340 43364   0   43377 43386   0   43373 43391 43338 43316   0   43672
  43397 43365 43361   0   43380 43381   0   43370 43393 43356 43331   0   43673
  43398 43368 43357   0   43376 43385   0   43372 43392 43351 43334   0   43535
  43400 43369 43360   0   43378 43388   0   43374 43394 43355 43674   0   43544
]], glyphcolorer))


panel:RegisterFrame(L["Scrolls"], Panda.PanelFactory(45357,
[[39151 37101  3012   955  1180  1181   954
  39151 39469   0     0     0     0     0   37118 38682
  39334 39774  1477  2290  1711  1712  2289   0     0   39349
  39338 43116
  39339 43118  4425  4419  4422  4424  4426 44314
  39340 43120 10309 10308 10307 10306 10310 43850 37602 39350
  39341 43122 27498 27499 27502 27501 27503
  39342 43124 33457 33458 33461 33460 33462
  39343 43126 43463 37091 37093 37097 43465 44315 43145 43146
	  0     0   43464 37092 37094 37098 43466
]]))
