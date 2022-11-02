set more off
clear

log close _all
log using "$d_out\irr_data_prep.log", replace

use "$d_out\cleaned drone sso data for missing and cant see values_test.dta", clear

*set trace on

*create variable for string front/back
gen frontback = ""
replace frontback = "front" if front == 1
replace frontback= "back" if front == 0

*encode variables for use in kappa command
local varlist litteryesno graffitiyesno paintedovergraffitiyesno liquorbottlesyesno cigtobaccoyesno pillsyesno syringesyesno blunthashpipeyesno dimebagsyesno condomwrapperpornyesno  paintinpoorcondition newlypainted shedinbackyard ifyesfortheshedisitdiy ifyesfortheshedisitpref signsofdamagedisrepair roofinpoorcondition securitysystemsign notresspasssign bewareofdog videocameras securitydoor barredwindow highhedgesforprivacy fence weedsotherovergrowth deadweedsorlandscaping houseabandoned ifyesabandonedbeingused beingrenovated vacantlot ifyesvacantlotbeingused dumpinginyard abandonedcarsinyard shoppingcarts pool ifyespoolisclear ifyespoolisgreen ifyesdoesnthavewater ifyesusedfordumping shade
foreach v in `varlist'{
	encode `v', gen(`v'_encode)
	drop `v'
	rename `v'_encode `v'
}
encode structuraladaptationsasattach, gen(structuraladaptattach)
drop structuraladaptationsasattach
encode cantheresidentenjoytheirbac, gen(enjoybackyard)
drop cantheresidentenjoytheirbac

**Create unique id for coder pairs using timepoint, faceblock, and zone
gen coding_id = .
gen id = 0
levelsof faceblock, local(fb)
forval t=1/4 {
	foreach i in `fb' {
				replace coding_id = id if timepoint == "`t'" & faceblock == "`i'" & coding_id == .
				replace id = id + 1
	}
}
	
*drop problem coding_ids for now
local problemcodeids 7 12 14 21 25 30 36 39 41 43 46 52 57 59
foreach n in `problemcodeids' {
	drop if coding_id == `n'
}
order coding_id timepoint faceblock
sort coding_id
levelsof coding_id, local(cid)
foreach i in `cid' {
	preserve
	keep if coding_id == `i'
	egen minid = min(coderid)
	replace coderid = 1 if coderid == minid
	egen maxid = max(coderid)
	replace coderid = 2 if coderid == maxid
	drop coder
	drop parcel_name
	reshape wide litteryesno littercount graffitiyesno graffiticount paintedovergraffitiyesno paintedovergraffiticount liquorbottlesyesno liquorbottlescount cigtobaccoyesno cigtobaccocount pillsyesno pillscount syringesyesno syringescount blunthashpipeyesno blunthashpipecount dimebagsyesno dimebagscount condomwrapperpornyesno condomwrapperporncount paintinpoorcondition newlypainted structuraladaptattach shedinbackyard ifyesfortheshedisitdiy ifyesfortheshedisitpref signsofdamagedisrepair roofinpoorcondition securitysystemsign notresspasssign bewareofdog videocameras securitydoor barredwindow highhedgesforprivacy fence weedsotherovergrowth deadweedsorlandscaping houseabandoned ifyesabandonedbeingused beingrenovated vacantlot ifyesvacantlotbeingused dumpinginyard abandonedcarsinyard enjoybackyard shoppingcarts pool ifyespoolisclear ifyespoolisgreen ifyesdoesnthavewater ifyesusedfordumping shade notes space front back problem problemnotes, i(parcel_fb) j(coderid)
	gen coding_pair = `i'
	save "$d_out\coding pairs\codepair`i'.dta", replace
	restore
}
use "$d_out\coding pairs\codepair1.dta", clear
forval t=2(1)63 {
	capture confirm file "$d_out\coding pairs\codepair`t'.dta"	
	if _rc == 0 {	
	append using "$d_out\coding pairs\codepair`t'.dta"
	}
}

order coding_pair parcel
sort coding_pair
*gen identifier = timepoint + "." + faceblock + "." + parcel + "." + frontback
save "$d_out\drone_sso_irr.dta", replace
