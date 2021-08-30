do "C:\Users\dmwalla3\AppData\Local\Temp\STD1e14_000000.tmp"
do "C:\Users\dmwalla3\AppData\Local\Temp\STD1e14_000000.tmp"
order timepoint zone faceblock parcel
order timepoint zone faceblock parcel
browse if timepoint == 1 & zone == 1 & faceblock == 1.1
browse if timepoint == 1 & zone == 1 & faceblock == "1.1"
codebook timepoint zone faceblock
browse if timepoint == "1" & zone == "1" & faceblock == "1.1"
browse if timepoint == "1" & zone == "1" & faceblock == "1.2"
gen coding_id = 1 if  timepoint == "1" & zone == "1" & faceblock == "1.2"
gen coding_id = 2 if  timepoint == "1" & zone == "1" & faceblock == "1.3"
replace coding_id = 2 if  timepoint == "1" & zone == "1" & faceblock == "1.3"
browse if timepoint == "1" & zone == "1" & faceblock == "1.3"
preserve
keep if coding_id == 1
save "C:\Users\dmwalla3\Dropbox\UAS and SSO Study\Interrater Reliability Drone Imagery SSO\test1.dta", replace
restore
preserve
keep if coding_if ==2
keep if coding_id == 2
save "C:\Users\dmwalla3\Dropbox\UAS and SSO Study\Interrater Reliability Drone Imagery SSO\test2.dta", replace
restore
clear
use "C:\Users\dmwalla3\Dropbox\UAS and SSO Study\Interrater Reliability Drone Imagery SSO\test1.dta"
reshape wide litteryesno litteryesno littercount graffitiyesno graffiticount paintedovergraffitiyesno paintedovergraffiticount liquorbottlesyesno liquorbottlescount cigtobaccoyesno cigtobaccocount pillsyesno pillscount syringesyesno syringescount blunthashpipeyesno blunthashpipecount dimebagsyesno dimebagscount condomwrapperpornyesno condomwrapperporncount paintinpoorcondition newlypainted structuraladaptationsasattach shedinbackyard ifyesfortheshedisitdiy ifyesfortheshedisitpref signsofdamagedisrepair roofinpoorcondition securitysystemsign notresspasssign bewareofdog videocameras securitydoor barredwindow highhedgesforprivacy fence weedsotherovergrowth deadweedsorlandscaping houseabandoned ifyesabandonedbeingused beingrenovated vacantlot ifyesvacantlotbeingused dumpinginyard abandonedcarsinyard cantheresidentenjoytheirbac shoppingcarts pool ifyespoolisclear ifyespoolisgreen ifyesdoesnthavewater ifyesusedfordumping shade notes space front back problem problemnotes, i(timepoint faceblock parcel) j(coder)
encode coder, replace
encode coder, gen(coderid)
reshape wide litteryesno litteryesno littercount graffitiyesno graffiticount paintedovergraffitiyesno paintedovergraffiticount liquorbottlesyesno liquorbottlescount cigtobaccoyesno cigtobaccocount pillsyesno pillscount syringesyesno syringescount blunthashpipeyesno blunthashpipecount dimebagsyesno dimebagscount condomwrapperpornyesno condomwrapperporncount paintinpoorcondition newlypainted structuraladaptationsasattach shedinbackyard ifyesfortheshedisitdiy ifyesfortheshedisitpref signsofdamagedisrepair roofinpoorcondition securitysystemsign notresspasssign bewareofdog videocameras securitydoor barredwindow highhedgesforprivacy fence weedsotherovergrowth deadweedsorlandscaping houseabandoned ifyesabandonedbeingused beingrenovated vacantlot ifyesvacantlotbeingused dumpinginyard abandonedcarsinyard cantheresidentenjoytheirbac shoppingcarts pool ifyespoolisclear ifyespoolisgreen ifyesdoesnthavewater ifyesusedfordumping shade notes space front back problem problemnotes, i(timepoint faceblock parcel) j(coderid)
sort parcel
help duplicates
dup tag, gen(d)
duplicates tag, gen(d)
tab d
duplicates tag parcel, gen(d1)
tab d1
duplicates tag parcel coderid, gen(d2)
tab d2
drop if parcel == "9510"
drop if parcel == "9512"
reshape wide litteryesno litteryesno littercount graffitiyesno graffiticount paintedovergraffitiyesno paintedovergraffiticount liquorbottlesyesno liquorbottlescount cigtobaccoyesno cigtobaccocount pillsyesno pillscount syringesyesno syringescount blunthashpipeyesno blunthashpipecount dimebagsyesno dimebagscount condomwrapperpornyesno condomwrapperporncount paintinpoorcondition newlypainted structuraladaptationsasattach shedinbackyard ifyesfortheshedisitdiy ifyesfortheshedisitpref signsofdamagedisrepair roofinpoorcondition securitysystemsign notresspasssign bewareofdog videocameras securitydoor barredwindow highhedgesforprivacy fence weedsotherovergrowth deadweedsorlandscaping houseabandoned ifyesabandonedbeingused beingrenovated vacantlot ifyesvacantlotbeingused dumpinginyard abandonedcarsinyard cantheresidentenjoytheirbac shoppingcarts pool ifyespoolisclear ifyespoolisgreen ifyesdoesnthavewater ifyesusedfordumping shade notes space front back problem problemnotes, i(timepoint faceblock parcel) j(coderid)
reshape wide litteryesno litteryesno littercount graffitiyesno graffiticount paintedovergraffitiyesno paintedovergraffiticount liquorbottlesyesno liquorbottlescount cigtobaccoyesno cigtobaccocount pillsyesno pillscount syringesyesno syringescount blunthashpipeyesno blunthashpipecount dimebagsyesno dimebagscount condomwrapperpornyesno condomwrapperporncount paintinpoorcondition newlypainted structuraladaptationsasattach shedinbackyard ifyesfortheshedisitdiy ifyesfortheshedisitpref signsofdamagedisrepair roofinpoorcondition securitysystemsign notresspasssign bewareofdog videocameras securitydoor barredwindow highhedgesforprivacy fence weedsotherovergrowth deadweedsorlandscaping houseabandoned ifyesabandonedbeingused beingrenovated vacantlot ifyesvacantlotbeingused dumpinginyard abandonedcarsinyard cantheresidentenjoytheirbac shoppingcarts pool ifyespoolisclear ifyespoolisgreen ifyesdoesnthavewater ifyesusedfordumping shade notes space front back problem problemnotes, i(parcel) j(coderid)
clear
use "C:\Users\dmwalla3\Dropbox\UAS and SSO Study\Interrater Reliability Drone Imagery SSO\test2.dta"
replace parcel = "Side of 9515" if parcel == "9515"
keep timepoint zone faceblock parcel coder litteryesno littercount graffitiyesno graffiticount
drop timepoint zone faceblock
sort parcel
encode coder, gen(coder_id)
reshape wide litteryesno littercount graffitiyesno graffiticount, i( parcel) j( coder_id)
help reshape
drop coder
reshape wide litteryesno littercount graffitiyesno graffiticount, i( parcel) j( coder_id)
kappa litteryesno1 litteryesno2
encode litteryesno1, gen(lyn)
rename lyn lyn1
encode litteryesno2, gen(lyn2)
kappa lyn1 lyn2
tab lyn1 lyn2