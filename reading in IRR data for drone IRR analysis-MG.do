
set more off
clear

log close _all

**If set to 1 use matt anything else will run dani
global user_matt 1

**Directory locations**
if $user_matt == 1 {
**Matt**
global d "C:\Users\mattg\ASU Google Drive\Dissertation\Data\Interrater Reliability Drone Imagery SSO\Cleaned drone sso data to be used for IRR"
global d2 "C:\Users\mattg\ASU Google Drive\Dissertation\Data\Interrater Reliability Drone Imagery SSO\Cleaned drone sso data to be used for IRR\Bring in Separately"
global d_out "C:\Users\mattg\ASU Google Drive\Dissertation\Data\Interrater Reliability Drone Imagery SSO"
global work_dir "C:\localrepos\Drone SSO IRR"
}
else {
**Dani**
global d "C:\Users\dmwalla3\Dropbox\UAS and SSO Study\Interrater Reliability Drone Imagery SSO\Cleaned drone sso data to be used for IRR"
global d2 "C:\Users\dmwalla3\Dropbox\UAS and SSO Study\Interrater Reliability Drone Imagery SSO\Cleaned drone sso data to be used for IRR\Bring in Separately"
global d_out "C:\Users\dmwalla3\Dropbox\UAS and SSO Study\Interrater Reliability Drone Imagery SSO\"
}

**Declare variable for data consistency check
local checkvar syringes
local countvar "countcantsee"

/*reading in all files and turning them into datasets
local names arenas forston fuentes gomez graham herrera

foreach n in `names' {
	forvalues z=1(1)4 {

		forvalues b=1(1)4 {
			
			capture confirm file "$d\dsso_`n'_`z'_`b'_front.xlsx"
			
			if _rc == 0 {
			
				clear
				import excel "$d\dsso_`n'_`z'_`b'_front.xlsx", firstrow case(lower) allstring
				gen coder = "`n'"
				gen timepoint = "`z'"
				gen zone = "`b'"
				gen space = "Front"
				gen front = 1
				gen back = 0
				save "$d\dsso_`n'_`z'_`b'_front.dta", replace
				clear
				
			}
			
			capture confirm file "$d\dsso_`n'_`z'_`b'_back.xlsx"
			
			if _rc == 0 {
			
				import excel "$d\dsso_`n'_`z'_`b'_back.xlsx", firstrow case(lower) allstring
				gen coder = "`n'"
				gen timepoint = "`z'"
				gen zone = "`b'"
				gen space = "Back"
				gen front = 0
				gen back = 1
				save "$d\dsso_`n'_`z'_`b'_back.dta", replace
				clear
				
			}
								
		}

	}
	
}


local names2 jones parker topete tovar zhao
foreach n in `names2' {
	forvalues z=1(1)4 {

		forvalues b=1(1)4 {
			
			capture confirm file "$d\dsso_`n'_`z'_`b'_front.xls.xlsx"
			
			if _rc == 0 {
			
				clear
				import excel "$d\dsso_`n'_`z'_`b'_front.xls.xlsx", firstrow case(lower) allstring
				gen coder = "`n'"
				gen timepoint = "`z'"
				gen zone = "`b'"
				gen space = "Front"
				gen front = 1
				gen back = 0
				save "$d\dsso_`n'_`z'_`b'_front.dta", replace
				clear
				
			}
			
			capture confirm file "$d\dsso_`n'_`z'_`b'_back.xls.xlsx"
			
			if _rc == 0 {
			
				import excel "$d\dsso_`n'_`z'_`b'_back.xls.xlsx", firstrow case(lower) allstring
				gen coder = "`n'"
				gen timepoint = "`z'"
				gen zone = "`b'"
				gen space = "Back"
				gen front = 0
				gen back = 1
				save "$d\dsso_`n'_`z'_`b'_back.dta", replace
				clear
				
			}
								
		}

	}
	
}

*files from the "bring in separately folder"

local names3 fuentes herrera tovar 
foreach n in `names3' {
	forvalues z=1(1)4 {

		forvalues b=1(1)4 {
			
			capture confirm file "$d2\dsso_`n'_`z'_`b'A_front.xlsx"
			
			if _rc == 0 {
			
				clear
				import excel "$d2\dsso_`n'_`z'_`b'A_front.xlsx", firstrow case(lower) allstring
				gen coder = "`n'"
				gen timepoint = "`z'"
				gen zone = "`b'"
				gen space = "Front"
				gen front = 1
				gen back = 0
				save "$d2\dsso_`n'_`z'_`b'A_front.dta", replace
				clear
				
			}
			
			capture confirm file "$d2\dsso_`n'_`z'_`b'A_back.xlsx"
			
			if _rc == 0 {
			
				import excel "$d2\dsso_`n'_`z'_`b'A_back.xlsx", firstrow case(lower) allstring
				gen coder = "`n'"
				gen timepoint = "`z'"
				gen zone = "`b'"
				gen space = "Back"
				gen front = 0
				gen back = 1
				save "$d2\dsso_`n'_`z'_`b'A_back.dta", replace
				clear
				
			}
			
			capture confirm file "$d2\dsso_`n'_`z'_`b'B_front.xlsx"
			
			if _rc == 0 {
			
				clear
				import excel "$d2\dsso_`n'_`z'_`b'B_front.xlsx", firstrow case(lower) allstring
				gen coder = "`n'"
				gen timepoint = "`z'"
				gen zone = "`b'"
				gen space = "Front"
				gen front = 1
				gen back = 0
				save "$d2\dsso_`n'_`z'_`b'B_front.dta", replace
				clear
				
			}
			
			capture confirm file "$d2\dsso_`n'_`z'_`b'B_back.xlsx"
			
			if _rc == 0 {
			
				import excel "$d2\dsso_`n'_`z'_`b'B_back.xlsx", firstrow case(lower) allstring
				gen coder = "`n'"
				gen timepoint = "`z'"
				gen zone = "`b'"
				gen space = "Back"
				gen front = 0
				gen back = 1
				save "$d2\dsso_`n'_`z'_`b'B_back.dta", replace
				clear
				
			}
								
		}

	}
	
}
*/

*Fix problems with some files
use "$d2\dsso_tovar_4_2A_front.dta", clear
replace littercountcantseec = "cs" if litteryesno == "cs"
replace graffiticountcantsee = "cs" if graffitiyesno == "cs"
replace paintedovergraffiticount = "cs" if paintedovergraffitiyesno == "cs"
replace liquorbottlescountcan = "cs" if liquorbottlesyesno == "cs"
replace cigtobaccocountcants = "cs" if cigtobaccoyesno == "cs"
replace pillscountcantseecs = "cs" if pillsyesno == "cs"
replace syringescountcantsee = "cs" if syringesyesno == "cs"
replace blunthashpipecountcan = "cs" if blunthashpipeyesno == "cs"
replace dimebagscountcantsee = "cs" if dimebagsyesno == "cs"
replace condomwrapperporncount= "cs" if condomwrapperpornyesno == "cs"
save "$d2\dsso_tovar_4_2A_front.dta", replace
use "$d2\dsso_tovar_4_2A_back.dta", clear
replace liquorbottlescountcan = "cs" if liquorbottlesyesno == "-8"
replace cigtobaccocountcants = "cs" if cigtobaccoyesno == "-8"
replace pillscountcantseecs = "cs" if pillsyesno == "-8"
replace syringescountcantsee = "cs" if syringesyesno == "-8"
replace blunthashpipecountcan = "cs" if blunthashpipeyesno == "-8"
replace dimebagscountcantsee = "cs" if dimebagsyesno == "-8"
replace condomwrapperporncount= "cs" if condomwrapperpornyesno == "-8"
save "$d2\dsso_tovar_4_2A_back.dta", replace
use "$d\dsso_jones_3_3_back.dta", clear
replace littercountcantseec = "-8" if litteryesno == "CS"
replace graffiticountcantsee = "-8" if graffitiyesno == "CS"
replace paintedovergraffiticount = "-8" if paintedovergraffitiyesno == "CS"
replace liquorbottlescountcan = "-8" if liquorbottlesyesno == "CS"
replace cigtobaccocountcants = "-8" if cigtobaccoyesno == "CS"
replace pillscountcantseecs = "-8" if pillsyesno == "CS"
replace syringescountcantsee = "-8" if syringesyesno == "CS"
replace blunthashpipecountcan = "-8" if blunthashpipeyesno == "CS"
replace dimebagscountcantsee = "-8" if dimebagsyesno == "CS"
replace condomwrapperporncount= "-8" if condomwrapperpornyesno == "CS"
save "$d\dsso_jones_3_3_back", replace

**making one big dataset
*starting with front of building comparison
use "$d\dsso_arenas_1_1_front.dta" , clear 
append using "$d\dsso_arenas_1_4_front.dta"
append using "$d\dsso_arenas_2_1_front.dta"
append using "$d\dsso_arenas_3_1_front.dta"
append using "$d\dsso_arenas_3_3_front.dta"
append using "$d\dsso_arenas_3_4_front.dta"
append using "$d\dsso_arenas_4_1_front.dta"
append using "$d\dsso_arenas_4_3_front.dta"
append using "$d\dsso_arenas_4_4_front.dta"

local pple forston fuentes gomez graham herrera jones parker topete tovar zhao

foreach n in `pple' {
	forvalues z=1(1)4 {

		forvalues b=1(1)4 {
			
			capture confirm file "$d\dsso_`n'_`z'_`b'_front.dta"
			
			if _rc == 0 {
				
				append using "$d\dsso_`n'_`z'_`b'_front.dta"
							
			}
			
		}
								
	}

}

foreach n in `pple' {
	forvalues z=1(1)4 {

		forvalues b=1(1)4 {
			
			capture confirm file "$d\dsso_`n'_`z'_`b'_back.dta"
			
			if _rc == 0 {
				
				append using "$d\dsso_`n'_`z'_`b'_back.dta"
							
			}
			
		}
								
	}

}

*bring in other files
append using "$d2\dsso_fuentes_2_4A_front.dta"
append using "$d2\dsso_fuentes_2_4B_front.dta"
append using "$d2\dsso_herrera_1_3A_back.dta"
append using "$d2\dsso_herrera_1_3A_front.dta"
append using "$d2\dsso_herrera_1_3B_back.dta"
append using "$d2\dsso_herrera_1_3B_front.dta"
append using "$d2\dsso_tovar_4_1A_back.dta"
append using "$d2\dsso_tovar_4_1A_front.dta"
append using "$d2\dsso_tovar_4_1B_back.dta"
append using "$d2\dsso_tovar_4_1B_front.dta"
append using "$d2\dsso_tovar_4_2A_back.dta"
append using "$d2\dsso_tovar_4_2A_front.dta"
append using "$d2\dsso_tovar_4_2B_back.dta"
append using "$d2\dsso_tovar_4_2B_front.dta"

****ALL FILES IN, now clean

*cleaning extra rows/variables and not applicable rows (i.e., not assigned)
drop if faceblock == "Faceblock #"
drop if faceblock == ""
drop if faceblock == "N"
drop if litteryesno == ""

*droping extra variables
drop bc-bd

drop be

*identify problem codes (things you can't logically sort out) here
gen problem = 0
replace problem = 1 if ifyespoolisgreen == "22-DEC"
gen problemnotes = ""
replace problemnotes = "some variables have dates as values when they shouldn't" if ifyespoolisgreen == "22-DEC"
replace problem = 1 if pillsyesno == "SN"
replace problemnotes = "What does SN mean?" if pillsyesno == "SN"

**HOMOGENIZING CODER ANSWERS
tostring securitysystemsign notresspasssign bewareofdog videocameras securitydoor barredwindow ifyesabandonedbeingused ifyesvacantlotbeingused, replace

foreach v in litteryesno graffitiyesno paintedovergraffitiyesno liquorbottlesyesno cigtobaccoyesno pillsyesno syringesyesno blunthashpipeyesno condomwrapperpornyesno dimebagsyesno paintinpoorcondition newlypainted structuraladaptationsasattach shedinbackyard signsofdamagedisrepair roofinpoorcondition securitysystemsign notresspasssign bewareofdog videocameras securitydoor barredwindow highhedgesforprivacy fence weedsotherovergrowth deadweedsorlandscaping ifyesfortheshedisitdiy ifyesfortheshedisitpref houseabandoned beingrenovated vacantlot dumpinginyard abandonedcarsinyard cantheresidentenjoytheirbac shoppingcarts pool ifyespoolisclear ifyespoolisgreen ifyesdoesnthavewater ifyesusedfordumping {

	replace `v' = rtrim(`v')
	replace `v' = ltrim(`v')
	replace `v' = strupper(`v')
	
	replace `v' = "Y" if `v' == "YES"
	replace `v' = "Y" if `v' == "YES "
	replace `v' = "N" if `v' == "NO"
	replace `v' = "N" if `v' == "NO"
	replace `v' = "N" if `v' == "N-"
	replace `v' = "-8" if `v' == "CS"
	replace `v' = "-8" if `v' == "8-"
	replace `v' = "-8" if `v' == "8"
	replace `v' = "-8" if `v' == "-8-"
	replace `v' = "-9" if `v' == "NA"
	replace `v' = "-9" if `v' == "N/A"	
	replace `v' = "-9" if `v' == "N-"	

}

foreach v in littercountcantseec graffiticountcantsee paintedovergraffiticount liquorbottlescountcan cigtobaccocountcants pillscountcantseecs syringescountcantsee blunthashpipecountcan condomwrapperporncount dimebagscountcantsee condomwrapperporncount {
	
	replace `v' = rtrim(`v')
	replace `v' = ltrim(`v')
	replace `v' = strupper(`v')
	replace `v' = "-8" if `v' == "CS"
	replace `v' = "-8" if `v' == "C"
	replace `v' = "-8" if `v' == "C S"
	replace `v' = "-8" if `v' == "CS-"
	replace `v' = "-8" if `v' == "CD"
	replace `v' = "-8" if `v' == "-8-"
	replace `v' = "-9" if `v' == "NA"
	replace `v' = "-9" if `v' == "N/A"
	replace `v' = "0" if `v' == "N"
	replace `v' = "0" if `v' == "NO"
	replace `v' = "5" if `v' == "5+"
	replace `v' = "10" if `v' == "10+"

}
 
**Data Check
tab `checkvar'yesno
tab `checkvar'`countvar'
tab `checkvar'yesno `checkvar'`countvar'

replace littercountcantseec = "-9" if littercountcantseec == "" & litteryesno == "N"
replace littercountcantseec = "-9" if litteryesno == "N"
replace graffiticountcantsee = "-9" if graffiticountcantsee == "" & graffitiyesno == "N"
replace paintedovergraffiticount = "-9" if paintedovergraffiticount == "" & paintedovergraffitiyesno == "N"
replace liquorbottlescountcan = "-9" if liquorbottlescountcan == "" & liquorbottlesyesno == "N"
replace cigtobaccocountcants = "-9" if cigtobaccocountcants == "" & cigtobaccoyesno == "N"
replace pillscountcantseecs = "-9" if pillscountcantseecs == "" & pillsyesno == "N"
replace syringescountcantsee = "-9" if syringescountcantsee == "" & syringesyesno == "N"
replace blunthashpipecountcan = "-9" if blunthashpipecountcan == "" & blunthashpipeyesno == "N"
replace dimebagscountcantsee = "-9" if dimebagscountcantsee == "" & dimebagsyesno == "N"
replace ifyesfortheshedisitdiy = "-9" if ifyesfortheshedisitdiy == "" & shedinbackyard == "N"
replace ifyesfortheshedisitpref = "-9" if ifyesfortheshedisitpref == "" & shedinbackyard == "N"
replace ifyespoolisclear = "-9" if ifyespoolisclear == "" & pool == "N"
replace ifyespoolisgreen = "-9" if ifyespoolisgreen == "" & pool == "N"
replace ifyesdoesnthavewater = "-9" if ifyesdoesnthavewater == "" & pool == "N"
replace ifyesusedfordumping = "-9" if ifyesusedfordumping == "" & pool == "N"
replace ifyesabandonedbeingused = "-9" if ifyesabandonedbeingused == "" & houseabandoned == "N"
replace ifyesabandonedbeingused = "-9" if ifyesabandonedbeingused == "." & houseabandoned == "N"
replace ifyesvacantlotbeingused = "-9" if ifyesvacantlotbeingused == "" & vacantlot == "N"
replace ifyesvacantlotbeingused = "-9" if ifyesvacantlotbeingused == "." & vacantlot == "N"

foreach v in securitysystemsign notresspasssign bewareofdog videocameras securitydoor barredwindow {

	replace `v' = "" if `v' == "."
}

rename littercountcantseec littercount 
rename graffiticountcantsee graffiticount
rename liquorbottlescountcan liquorbottlescount
rename cigtobaccocountcants cigtobaccocount
rename pillscountcantseecs pillscount
rename syringescountcantsee syringescount
rename blunthashpipecountcan blunthashpipecount
rename dimebagscountcantsee dimebagscount

**Data Check
tab `checkvar'count
tab `checkvar'yesno `checkvar'count

local yn paintinpoorcondition newlypainted structuraladaptationsasattach shedinbackyard signsofdamagedisrepair roofinpoorcondition securitysystemsign notresspasssign bewareofdog videocameras securitydoor barredwindow highhedgesforprivacy fence weedsotherovergrowth deadweedsorlandscaping houseabandoned beingrenovated vacantlot dumpinginyard abandonedcarsinyard cantheresidentenjoytheirbac shoppingcarts pool

foreach v in `yn' {

	replace `v' = "-8" if `v' == "8"
	replace `v' = "-8" if `v' == "CS"
	replace `v' = "-8" if `v' == "POSSIBLY"
	replace `v' = "-8" if `v' == "YESNO"
	replace `v' = "-8" if `v' == "23-DEC"
	replace `v' = "-8" if `v' == "N-8"
	replace `v' = "-8" if `v' == "NN"
	
	replace `v' = "-9" if `v' == "NA"
	replace `v' = "-9" if `v' == "N/A"
	replace `v' = "N" if `v' == "NO"
	replace `v' = "Y" if `v' == "YES"
	replace `v' = "Y" if `v' == "YESQ"
		
}

**cleaning the skip patterns
replace littercount = "-9" if litteryesno == "N"
replace graffiticount = "-9" if graffitiyesno == "N"
replace graffiticount = "-9" if graffitiyesno == "N"
replace paintedovergraffiticount = "-9" if paintedovergraffitiyesno == "N"
replace liquorbottlescount = "-9" if liquorbottlesyesno == "N"
replace cigtobaccocount = "-9" if cigtobaccoyesno == "N"
replace pillscount = "-9" if pillsyesno == "N"
replace blunthashpipecount = "-9" if blunthashpipeyesno == "N"
replace syringescount = "-9" if syringesyesno == "N"
replace dimebagscount = "-9" if dimebagsyesno ==   "N"
replace condomwrapperporncount = "-9" if condomwrapperpornyesno == "N"

**Data Check
tab `checkvar'count
tab `checkvar'yesno `checkvar'count

replace ifyesabandonedbeingused = ltrim(ifyesabandonedbeingused)
replace ifyesabandonedbeingused = rtrim(ifyesabandonedbeingused)
replace ifyesabandonedbeingused = strupper(ifyesabandonedbeingused)
replace ifyesabandonedbeingused = "-9" if ifyesabandonedbeingused == "NN" | ifyesabandonedbeingused == "N/A" | ifyesabandonedbeingused == "9"
replace ifyesabandonedbeingused = "Y" if ifyesabandonedbeingused == "YES"
replace ifyesabandonedbeingused = "N" if ifyesabandonedbeingused == "NO"

replace ifyesvacantlotbeingused = ltrim(ifyesvacantlotbeingused)
replace ifyesvacantlotbeingused = rtrim(ifyesvacantlotbeingused)
replace ifyesvacantlotbeingused = strupper(ifyesvacantlotbeingused)
replace ifyesvacantlotbeingused = "-9" if ifyesvacantlotbeingused == "N /A" | ifyesvacantlotbeingused == "N/A" | ifyesvacantlotbeingused == "9"
replace ifyesvacantlotbeingused = "-8" if ifyesvacantlotbeingused == "CS" 
replace ifyesvacantlotbeingused = "Y" if ifyesvacantlotbeingused == "YES"
replace ifyesvacantlotbeingused = "N" if ifyesvacantlotbeingused == "NO"

replace ifyespoolisclear = ltrim(ifyespoolisclear)
replace ifyespoolisclear = rtrim(ifyespoolisclear)
replace ifyespoolisclear = strupper(ifyespoolisclear)
replace ifyespoolisclear = "-8" if ifyespoolisclear == "CS"
replace ifyespoolisclear = "-9" if ifyespoolisclear == "N/A"

replace ifyespoolisgreen = ltrim(ifyespoolisgreen)
replace ifyespoolisgreen = rtrim(ifyespoolisgreen)
replace ifyespoolisgreen = strupper(ifyespoolisgreen)
replace ifyespoolisgreen = "-8" if ifyespoolisgreen == "CS"
replace ifyespoolisgreen = "-9" if ifyespoolisgreen == "N/A"
replace ifyespoolisgreen = "-8" if ifyespoolisgreen == "22-DEC"

replace ifyesdoesnthavewater = ltrim(ifyesdoesnthavewater)
replace ifyesdoesnthavewater = rtrim(ifyesdoesnthavewater)
replace ifyesdoesnthavewater = strupper(ifyesdoesnthavewater)
replace ifyesdoesnthavewater = "-8" if ifyesdoesnthavewater == "CS"
replace ifyesdoesnthavewater = "-8" if ifyesdoesnthavewater == "22-DEC"
replace ifyesdoesnthavewater = "-9" if ifyesdoesnthavewater == "N/A"
replace ifyesdoesnthavewater = "-9" if ifyesdoesnthavewater == "9"

replace ifyesusedfordumping = ltrim(ifyesusedfordumping)
replace ifyesusedfordumping = rtrim(ifyesusedfordumping)
replace ifyesusedfordumping = strupper(ifyesusedfordumping)
replace ifyesusedfordumping = "-8" if ifyesusedfordumping == "CS"
replace ifyesusedfordumping = "-9" if ifyesusedfordumping == "N/A"
replace ifyesusedfordumping = "-9" if ifyesusedfordumping == "9"

*shed skip pattern
replace ifyesfortheshedisitdiy = "-9" if shedinbackyard == "N"
replace ifyesfortheshedisitdiy = "-9" if shedinbackyard == "-9"
replace ifyesfortheshedisitpref = "-9" if shedinbackyard == "N"
replace ifyesfortheshedisitpref = "-9" if shedinbackyard == "-9"

*vacant lot skip pattern
replace ifyesvacantlotbeingused = "-9" if vacantlot == "-9"
replace ifyesvacantlotbeingused = "-9" if vacantlot == "N"

*abandoned house skip pattern
replace ifyesabandonedbeingused = "-9" if houseabandoned == "-9"
replace ifyesabandonedbeingused = "-9" if houseabandoned == "N"

*pool skip pattern
replace ifyespoolisclear = "-9" if pool == "-9"
replace ifyespoolisgreen = "-9" if pool == "-9"
replace ifyesdoesnthavewater = "-9" if pool == "-9"
replace ifyesusedfordumping = "-9" if pool == "-9"

replace ifyespoolisclear = "-8" if pool == "-8"
replace ifyespoolisgreen = "-8" if pool == "-8"
replace ifyesdoesnthavewater = "-8" if pool == "-8"
replace ifyesusedfordumping = "-8" if pool == "-8"

replace ifyespoolisclear = "-9" if pool == "N"
replace ifyespoolisgreen = "-9" if pool == "N"
replace ifyesdoesnthavewater = "-9" if pool == "N"
replace ifyesusedfordumping = "-9" if pool == "N"


**single cases that need fixing
replace graffiticount = "-9" if graffitiyesno == "NO 0"
replace graffitiyesno = "NO" if graffitiyesno == "NO 0"
replace signsofdamagedisrepair="N" if signsofdamagedisrepair == "N-8"
replace securitysystemsign ="N" if securitysystemsign == "NN"
replace notresspasssign = "-8" if notresspasssign == "8-"
replace litteryesno = "N" if littercount == "0" & litteryesno == "Y"
replace littercount = "-9" if littercount == "0"
*Problem code
*replace litteryesno = "N" if littercount == "0"
*replace littercount = "0" if littercount == "-9"
replace dimebagsyesno = "N" if dimebagscount == "0"
replace dimebagscount = "-9" if dimebagscount == "0"
replace dimebagsyesno = "-8" if dimebagsyesno == "SN"
replace graffiticount = "-9" if graffitiyesno == "NO 0"
replace graffitiyesno = "N" if graffitiyesno == "NO 0"
replace graffitiyesno = "N" if graffitiyesno == "NO"
replace pillsyesno = "-8" if pillsyesno == "SN"
replace syringescount = "-8" if syringescount == "5" & syringesyesno == "-8"
replace blunthashpipecount = "-8" if blunthashpipecount == "5" & blunthashpipeyesno == "-8"
replace dimebagscount = "-8" if dimebagscount == "5" & dimebagsyesno == "-8"
replace ifyesfortheshedisitdiy = "-8" if shedinbackyard == "Y" & ifyesfortheshedisitdiy == "NOYES" | ifyesfortheshedisitdiy == "S"
replace vacantlot = "N" if vacantlot == "ONO"
replace highhedgesforprivacy = "N" if highhedgesforprivacy == "8NO"
replace syringesyesno = "-8" if syringescount == "-8" & syringesyesno == "-9"
replace syringescount = "-8" if syringescount == "0" & syringesyesno == "-8"
replace dimebagscount = "-8" if dimebagscount == "8" & dimebagsyesno == "-8"
replace ifyesfortheshedisitdiy = "-8" if ifyesfortheshedisitdiy == "-9" & shedinbackyard == "-8"
replace ifyesfortheshedisitdiy = "-8" if ifyesfortheshedisitdiy == "-9" & shedinbackyard == "Y"
replace ifyesfortheshedisitpref = "-8" if ifyesfortheshedisitpref == "-9" & shedinbackyard == "-8"
replace ifyesfortheshedisitpref = "-8" if ifyesfortheshedisitpref == "-9" & shedinbackyard == "Y"
replace barredwindow = "-8" if barredwindow == "-"
replace ifyespoolisclear = "-8" if ifyespoolisclear == "-9" & pool == "-8"
replace ifyespoolisclear = "-8" if ifyespoolisclear == "-9" & pool == "Y"
replace ifyespoolisgreen = "-8" if ifyespoolisgreen == "-9" & pool == "-8"
replace ifyespoolisgreen = "-8" if ifyespoolisgreen == "-9" & pool == "Y"
replace ifyesdoesnthavewater = "-8" if ifyesdoesnthavewater == "-9" & pool == "-8"
replace ifyesdoesnthavewater = "-8" if ifyesdoesnthavewater == "-9" & pool == "Y"
replace ifyesusedfordumping = "-8" if ifyesusedfordumping == "-9" & pool == "-8"
replace ifyesusedfordumping = "-8" if ifyesusedfordumping == "-9" & pool == "Y"

*photograph shaded
rename significantportionsofthephot shade
replace shade=ltrim(shade)
replace shade=rtrim(shade)
replace shade=strupper(shade)
replace shade = "Y" if shade == "YES"
replace shade = "N" if shade == "NO"
label var shade "Is significant portions of the photo covered in shade?"

destring littercount graffiticount liquorbottlescount cigtobaccocount pillscount syringescount blunthashpipecount dimebagscount paintedovergraffiticount, replace

label def count -9 "Not applicable" -8 "Can't see" 5 "5 or more"

foreach v in littercount graffiticount liquorbottlescount cigtobaccocount pillscount syringescount blunthashpipecount dimebagscount paintedovergraffiticount{

	replace `v' = 5 if `v' >=5
	label val `v' count

}

order timepoint zone faceblock parcel coder front problem problemnotes

**Data Check
tab `checkvar'count
tab `checkvar'yesno `checkvar'count
tab shedinbackyard ifyesfortheshedisitdiy
tab shedinbackyard ifyesfortheshedisitpref

save "$d_out\cleaned drone sso data for missing and cant see values_test.dta", replace

do "$work_dir\Data consistency.do"
