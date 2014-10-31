﻿
local L = Panda.locale
local panel = Panda.panel.panels[3]


local name = GetSpellInfo(45357)

local check = CreateFrame("CheckButton", "PandaGlyphProfit", panel, "OptionsCheckButtonTemplate")
check:SetWidth(22)
check:SetHeight(22)
check:SetPoint("TOPLEFT", Panda.panel, "BOTTOMLEFT", 185, 35)
check:SetScript("OnClick", function() Panda.showprofit = not Panda.showprofit; panel:Hide(); panel:Show() end)

local checklabel = check:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
checklabel:SetPoint("LEFT", check, "RIGHT", 5, 0)
checklabel:SetText("Show profit")

CreateFrame("Frame", nil, panel):SetScript("OnShow", function() if GetReagentCost then check:Show() else check:Hide() end end)


panel:RegisterFrame(MAJOR_GLYPHS, Panda.PanelFactory(45357,
[[79251 79254   0    83107   0     0      0   79514   0   42901   0   85691 84652   0     0   79731
    0     0     0    81956
  61979 61978   0      0     0     0      0     0   43390
  39343 43126 43425  41110   0   42971    0   42409   0   42915 40920 87897 43552
    0     0   43421  66918 42753 42968  41524 42407 45783 42901   0   85696 43537
    0     0   43430  43869 44920 42957  41529 42403 42472 42902 40912 85696 43547
    0     0   43419  41102 42739   0    41526   0     0     0   45604   0   43533
    0     0     0    41101 63539   0    41517 42412   0     0     0   85695
    0     0     0      0     0     0    41538 42405   0     0     0   87901
    0     0     0      0     0     0    41518 42396   0     0     0   85695
    0     0     0      0     0     0      0   42404   0     0     0   85700 85699
  39342 43124 43432  45741 44955 45769  41542 45758   0     0     0     0   45800 43553
    0     0     0      0     0   63420  45772 45755   0   45731 40903 87895 45799 43546
    0     0   43428    0   42736   0    45771   0     0  104270   0     0   43554
    0     0   45790    0     0     0    41527   0     0     0     0     0   43826
  39341 43122   0      0     0   42974  45776 45760   0   42905 45622 87893 43536
    0     0     0      0     0     0      0     0     0  104276   0     0     0
    0     0     0      0     0     0      0   87902
  39340 43120 43414  41099 45740 42973    0   42397 42470 42904 40916
    0     0     0      0   42744   0      0     0   42466 42903 45623
  39339 43118   0      0   42746 42970 104052 42415   0     0     0     0   104046
    0     0   43422    0     0   64493    0     0     0   42910
    0     0     0      0     0   42966
  39338 43116 43417  41108   0     0      0     0   42465 42898 43331 104048
    0     0     0      0     0   42964  41530   0     0   42908
    0     0     0      0     0     0    43725
    0     0   43399  41095   0   42960  45778 42410 45785 45735
    0     0     0    41096   0     0      0   42408 43390
    0     0     0    41094
  39334 39774 45792 104050 42745 45761  41532 79513 42454 42917 40921 45804 87900
    0     0   67483    0   50045 42963  41552 42417 45782   0   45601   0   87894
    0     0     0      0     0     0    41533 45757
  39151 39469 45795 104051 42748 42961  41541 79515 50077 42906 45602 43548 87899
    0     0   45793    0   42754   0      0   42399   0   45733   0   43549 87880
]], nil, function(frame)
	frame:SetAttribute("type", "macro")
	if frame.id == 44680 then
		frame:SetAttribute("macrotext", "/run CloseTradeSkill()\n/cast "..name.."\n"..
			"/run for i=1,GetNumTradeSkills() do if GetTradeSkillInfo(i) == '"..L["Northrend Inscription Research"].."' then DoTradeSkill(i) end end CloseTradeSkill()")
	else
		frame:SetAttribute("macrotext", Panda.CraftMacro(name, frame.id))
	end
end))


panel:RegisterFrame(MINOR_GLYPHS, Panda.PanelFactory(45357,
[[79251 79254  80588  80586    0      0   104130  86541 79538   0    87883  87884 87887   0     0   44680
    0     0    80587  80581 104108    0      0      0   87277   0      0    87885 87889
    0     0    85221    0      0      0      0    87392   0     0      0      0   87890
  61979 61978    0      0      0      0   104131
  39343 43126  45794    0      0    42965  44923  43374 43394 45732    0    87881 43550
    0     0    49084    0    42751  42967 104133 104109   0   85683  40900  87888
    0     0    43412    0      0      0      0      0   42459   0      0    87882
    0     0   104135    0      0      0      0      0   42463 42456
  39342 43124  43400    0      0      0   104134 104120   0     0      0    43671 43672 43673 45806
    0     0   104136    0      0      0      0      0   42453   0      0    43535 43544 43827
  39341 43122 104137    0      0    45768  45775 104129
  39340 43120 104138 104107    0    43378    0      0     0
  39339 43118    0    43369  63416 104123  43388    0   43393 43351  43334 104102 43550
    0     0      0    41100 104104    0    43381    0     0   42897  68039  89868
    0     0      0      0      0    41540  43385    0     0     0    40919  67486
  39338 43116  43398  43365 104105  43376    0    43373 43389 87393  43316
    0     0      0    43368    0    43377 104126    0   43391   0   104103
    0     0      0      0      0    43380    0      0   42461
    0     0      0      0      0   104124    0      0   93202 45789
    0     0    43395    0    43364  43379  41537  43342   0   43338  43335
    0     0    43396    0    43359  42956    0    43371   0   43350  43332
    0     0      0      0    42743    0      0      0     0
  39334 39774    0    43366 104106  43343 104127    0   42467 42912    0   104099
    0     0      0    80584    0      0      0      0     0   43355    0    43539
  39151 39469    0    80585  45738  45762 104128 104122 42457 43356  44922  43551
    0     0      0    43340    0      0    43386  87276 42473
]], nil, function(frame)
	frame:SetAttribute("type", "macro")
	if frame.id == 44680 then
		frame:SetAttribute("macrotext", "/run CloseTradeSkill()\n/cast "..name.."\n"..
			"/run for i=1,GetNumTradeSkills() do if GetTradeSkillInfo(i) == '"..L["Minor Inscription Research"].."' then DoTradeSkill(i) end end CloseTradeSkill()")
	else
		frame:SetAttribute("macrotext", Panda.CraftMacro(name, frame.id))
	end
end))


panel:RegisterFrame(L["Inscriptions"], Panda.PanelFactory(45357,
[[79251 79254 87577 87578 87579 87580 0 87581 87582 87584 87585
]]))


panel:RegisterFrame(L["Scrolls"], Panda.PanelFactory(45357,
[[61979 61978 63303 63305 63306 63307 63304 63308 63388 62237 60838
  39343 43126 43463 37091 37093 37097 43465 44315
	  0     0   43464 37092 37094 37098 43466
  39342 43124 33457 33458 33461 33460 33462
  39341 43122 27498 27499 27502 27501 27503
  39340 43120 10309 10308 10307 10306 10310 43850
  39339 43118  4425  4419  4422  4424  4426 44314
  39338 43116
  39334 39774  1477  2290  1711  1712  2289 64670
  39151 39469   0     0     0     0     0   37118 38682
  39151 37101  3012   955  1180  1181   954
]]))

panel:RegisterFrame(L["Cards"], Panda.PanelFactory(45357,
[[79253 79255 79731 0 79283 79284 79285 79286 79287 79288 79289 79290   0   79323 79327 79328
    0     0   79318 0 79291 79292 79293 79294 79295 79296 79297 79298   0   79324 79329
    0     0     0   0 79299 79300 79301 79302 79303 79304 79305 79306   0   79325 79330
    0     0     0   0 79307 79308 79309 79310 79311 79312 79313 79314   0   79326 79331
  61980 61981 52329 0 61988 61989 61990 61991 61992 61993 61994 61995   0   62021 62047
    0     0   61987 0 61996 61997 61998 61999 62000 62001 62002 62003   0   62046 62048
    0     0     0   0 62004 62005 62006 62007 62008 62009 62010 62011   0   62045 62051 62049
    0     0     0   0 62012 62013 62014 62015 62016 62017 62018 62019   0   62044 62050
  43109 43127 35625 0 44260 44261 44262 44263 44264 44265 44266 44267   0   44259 42988
    0     0   44318 0 44277 44278 44279 44280 44281 44282 44284 44285   0   44276 42989
    0     0     0   0 44286 44287 44288 44289 44290 44291 44292 44293   0   44294 42990
    0     0     0   0 44268 44269 44270 44271 44272 44273 44274 44275   0   44326 42987 44254
    0     0     0   0   0     0     0     0     0     0     0     0     0     0   44253 44255
  43108 43125 21886 0 31901 31909 31908 31904 31903 31906 31905 31902   0   31907 31858
    0     0   44317 0 31910 31918 31917 31913 31912 31916 31915 31911   0   31914 31859
    0     0     0   0 31882 31889 31888 31885 31884 31887 31886 31883   0   31890 31856
    0     0     0   0 31892 31900 31899 31895 31894 31898 31896 31893   0   31891 31857
  43107 43123   0   0 19227 19230 19231 19232 19233 19234 19235 19236   0   19228 19288
    0   44316   0   0 19258 19259 19260 19261 19262 19263 19264 19265   0   19257 19287
    0     0     0   0 19268 19269 19270 19271 19272 19273 19274 19275   0   19267 19289
    0     0     0   0 19276 19278 19279 19280 19281 19282 19283 19284   0   19277 19290
  43106 43121 44163 0 44143 44154 44155 44156 44157   0     0     0   44158 44217 44218 44219
  43105 43119 44161 0 44165 44144 44145 44146 44147   0     0     0   44148 44213 44215
  43104 43117 44142 0 37145 37147 37159 37160   0     0     0     0   37164 39897 39895 39894
  43103 43115 37168 0 37140 37143 37156   0     0     0     0     0   37163 38318 39509 39507
]]))

panel:RegisterFrame(L["Off-hand"], Panda.PanelFactory(45357,
[[79253 79255 0 79334 79731 79333 0 79335 79731 79333 0 79333 76061
  61980 61981 0 62234 52329 52326 0 62235 52329 52328 0 62236 52329 52325
    0     0   0 62231 52329
  52329   0   0 62233
  43109 43127 0 44210 43102   0   0 38322 43102
  39343 43126 0 45849
  43108 43125 0 43666   0     0   0 43667
  43107 43123 0 43663   0     0   0 43664
  43106 43121 0 43660   0     0   0 43661
  43105 43119 0 43656   0     0   0 43657
  43104 43117 0 43654   0     0   0 43655
  43103 43115 0 43515
]]))
