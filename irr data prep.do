set more off
clear

log close _all
log using "$d_out\irr_data_prep.log", replace

use "$d_out\cleaned drone sso data for missing and cant see values_test.dta", clear

*set trace on

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
	
order coding_id timepoint faceblock
sort coding_id
levelsof coding_id, local(cid)
foreach i in `cid' {
	preserve
	keep if coding_id == `i'
	drop coder
	drop parcel_name
	reshape wide litteryesno littercount graffitiyesno graffiticount paintedovergraffitiyesno paintedovergraffiticount liquorbottlesyesno liquorbottlescount cigtobaccoyesno cigtobaccocount pillsyesno pillscount syringesyesno syringescount blunthashpipeyesno blunthashpipecount dimebagsyesno dimebagscount condomwrapperpornyesno condomwrapperporncount paintinpoorcondition newlypainted structuraladaptationsasattach shedinbackyard ifyesfortheshedisitdiy ifyesfortheshedisitpref signsofdamagedisrepair roofinpoorcondition securitysystemsign notresspasssign bewareofdog videocameras securitydoor barredwindow highhedgesforprivacy fence weedsotherovergrowth deadweedsorlandscaping houseabandoned ifyesabandonedbeingused beingrenovated vacantlot ifyesvacantlotbeingused dumpinginyard abandonedcarsinyard cantheresidentenjoytheirbac shoppingcarts pool ifyespoolisclear ifyespoolisgreen ifyesdoesnthavewater ifyesusedfordumping shade notes space front back problem problemnotes, i(parcel_fb) j(coderid)
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
save "$d_out\drone_sso_irr.dta", replace
