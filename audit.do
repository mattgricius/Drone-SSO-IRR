set more off
clear
set trace on
log close _all

**If set to 1 use matt anything else will run dani
global user_matt 1

**Directory locations**
if $user_matt == 1 {
**Matt**
global d "C:\Users\mattg\ASU Google Drive\Dissertation\Data\Interrater Reliability Drone Imagery SSO\Cleaned drone sso data to be used for IRR"
global d2 "C:\Users\mattg\ASU Google Drive\Dissertation\Data\Interrater Reliability Drone Imagery SSO\Cleaned drone sso data to be used for IRR\Bring in Separately"
global d_out "C:\Users\mattg\ASU Google Drive\Dissertation\Data\Interrater Reliability Drone Imagery SSO"
global work_dir "C:\localrepos\Drone-SSO-IRR"
}
else {
**Dani**
global d "C:\Users\dmwalla3\Dropbox\UAS and SSO Study\Interrater Reliability Drone Imagery SSO\Cleaned drone sso data to be used for IRR"
global d2 "C:\Users\dmwalla3\Dropbox\UAS and SSO Study\Interrater Reliability Drone Imagery SSO\Cleaned drone sso data to be used for IRR\Bring in Separately"
global d_out "C:\Users\dmwalla3\Dropbox\UAS and SSO Study\Interrater Reliability Drone Imagery SSO\"
}

*Parker is messed up
local pple forston fuentes gomez graham herrera jones topete tovar zhao arenas
local frontback front back

foreach n in `pple' {
	forvalues z=1(1)4 {

		forvalues b=1(1)4 {
		
			foreach y in `frontback' {
			
			
				capture confirm file "$d\dsso_`n'_`z'_`b'_`y'.dta"
			
				if _rc == 0 {
				
				use "$d\dsso_`n'_`z'_`b'_`y'.dta", clear
				
				*cleaning extra rows/variables and not applicable rows (i.e., not assigned)
capture drop if faceblock == "Faceblock #"
capture drop if faceblock == ""
capture drop if faceblock == "N"
capture drop if litteryesno == ""

*droping extra variables
capture drop bc-bd

capture drop be

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
replace dimebagsyesno = "N" if dimebagscount == "0"
replace dimebagscount = "-9" if dimebagscount == "0"
replace dimebagsyesno = "-8" if dimebagsyesno == "SN"
replace graffiticount = "-9" if graffitiyesno == "NO 0"
replace graffitiyesno = "N" if graffitiyesno == "NO 0"
replace graffitiyesno = "N" if graffitiyesno == "NO"
replace pillsyesno = "-8" if pillsyesno == "SN"
replace syringescount = "-8" if syringescount == "5" & syringesyesno == "-8"
replace syringescount = "-8" if syringescount == "0" & syringesyesno == "-8"
replace syringescount = "-9" if syringescount == "-8" & syringesyesno == "-9"
replace blunthashpipecount = "-8" if blunthashpipecount == "5" & blunthashpipeyesno == "-8"
replace dimebagscount = "-8" if dimebagscount == "5" & dimebagsyesno == "-8"
replace ifyesfortheshedisitdiy = "-8" if shedinbackyard == "Y" & ifyesfortheshedisitdiy == "NOYES" | ifyesfortheshedisitdiy == "S"
replace vacantlot = "N" if vacantlot == "ONO"
replace highhedgesforprivacy = "N" if highhedgesforprivacy == "8NO"
replace syringesyesno = "-8" if syringescount == "-8" & syringesyesno == "-9"
replace syringescount = "-8" if syringescount == "0" & syringesyesno == "-8"
replace syringescount = "-8" if syringescount == "5" & syringesyesno == "-8"
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

*Handle missing/blank mismatch
replace syringescount = "-8" if syringescount == "" & syringesyesno == "-8"
replace syringesyesno = "-8" if syringesyesno == "" & syringescount == "-8"
replace graffiticount = "-8" if graffiticount == "" & graffitiyesno == "-8"
replace graffitiyesno = "-8" if graffitiyesno == "" & graffiticount == "0"
replace graffiticount = "-8" if graffiticount == "0" & graffitiyesno == "-8"
replace paintedovergraffiticount = "-8" if paintedovergraffiticount == "" & paintedovergraffitiyesno == "-8"
replace paintedovergraffitiyesno = "-8" if paintedovergraffitiyesno == "" & paintedovergraffiticount == "0"
replace paintedovergraffiticount = "-8" if paintedovergraffiticount == "0" & paintedovergraffitiyesno == "-8"
replace liquorbottlescount = "-8" if liquorbottlescount == "" & liquorbottlesyesno == "-8"
replace liquorbottlesyesno = "-8" if liquorbottlesyesno == "" & liquorbottlescount == "-8"
replace liquorbottlesyesno = "-8" if liquorbottlesyesno == "" & liquorbottlescount == "0"
replace liquorbottlescount = "-8" if liquorbottlescount == "0" & liquorbottlesyesno == "-8"
replace cigtobaccocount = "-8" if cigtobaccocount == "" & cigtobaccoyesno == "-8"
replace cigtobaccoyesno = "-8" if cigtobaccoyesno == "" & cigtobaccocount == "-8"
replace pillscount = "-8" if pillscount == "" & pillsyesno == "-8"
replace pillsyesno = "-8" if pillsyesno == "" & pillscount == "-8"
replace blunthashpipecount = "-8" if blunthashpipecount == "" & blunthashpipeyesno == "-8"
replace blunthashpipeyesno = "-8" if blunthashpipeyesno == "" & blunthashpipecount == "-8"
replace dimebagscount = "-8" if dimebagscount == "" & dimebagsyesno == "-8"
replace dimebagsyesno = "-8" if dimebagsyesno == "" & dimebagscount == "-8"
replace condomwrapperporncount = "-8" if condomwrapperporncount == "" & condomwrapperpornyesno == "-8"
replace condomwrapperpornyesno = "-8" if condomwrapperpornyesno == "" & condomwrapperporncount == "-8"
replace condomwrapperpornyesno = "-8" if condomwrapperpornyesno == "" & condomwrapperporncount == "0"
replace condomwrapperporncount = "-8" if condomwrapperporncount == "0" & condomwrapperpornyesno == "-8"

*photograph shaded
capture rename significantportionsofthephot shade
capture replace shade=ltrim(shade)
capture replace shade=rtrim(shade)
capture replace shade=strupper(shade)
capture replace shade = "Y" if shade == "YES"
capture replace shade = "N" if shade == "NO"
capture label var shade "Is significant portions of the photo covered in shade?"


capture destring littercount graffiticount liquorbottlescount cigtobaccocount pillscount syringescount blunthashpipecount dimebagscount paintedovergraffiticount, replace

label def count -9 "Not applicable" -8 "Can't see" 5 "5 or more"

capture foreach v in littercount graffiticount liquorbottlescount cigtobaccocount pillscount syringescount blunthashpipecount dimebagscount paintedovergraffiticount{

	replace `v' = 5 if `v' >=5
	label val `v' count

}

order timepoint zone faceblock parcel coder front problem problemnotes

*Fix parcel strings
clonevar parcel_name = parcel
replace parcel = subinstr(parcel, "Front of ", "", .)
replace parcel = subinstr(parcel, "Side  of ", "", .)
replace parcel = subinstr(parcel, "Side of ", "", .)

*Convert coder string into numerical
encode coder, gen(coderid)

*Include front and back in parcel string
clonevar parcel_fb = parcel
replace parcel_fb = "f" + parcel_fb if front == 1
replace parcel_fb = "b" + parcel_fb if front == 0
	
save "$d_out\audit\dsso_`n'_`z'_`b'_`y'_audit.dta", replace

							
				}
			}
		}
								
	}

}


/*bring in other files
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
append using "$d\dsso_tovar_2_3A_back.dta"
append using "$d\dsso_tovar_2_3A_front.dta"
append using "$d\dsso_tovar_2_3B_back.dta"
append using "$d\dsso_tovar_2_3B_front.dta"
append using "$d\dsso_tovar_2_4A_back.dta"
append using "$d\dsso_tovar_2_4A_front.dta"
append using "$d\dsso_tovar_2_4B_back.dta"
append using "$d\dsso_tovar_2_4B_front.dta"
