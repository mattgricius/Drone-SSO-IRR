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

use "$d_out\cleaned drone sso data for missing and cant see values_test.dta", clear
drop problemnotes dup notes

local pple forston fuentes gomez graham herrera jones topete tovar zhao arenas
local frontback front back
foreach n in `pple' {
	forvalues z=1(1)4 {

		forvalues b=1(1)4 {
		
			foreach y in `frontback' {
				preserve
				if `y' == front {
				keep if timepoint == "`b'" & zone == "`z'" & front == 1 & coder == "`n'"
				}
				else {
				keep if timepoint == "`b'" & zone == "`z'" & front == 0 & coder == "`n'"
				}
				if timepoint == "`b'" {
				export delimited "$d_out\audit\dsso_`n'_`z'_`b'_`y'_audit.csv", replace
				}
				*save "$d_out\audit\dsso_`n'_`z'_`b'_`y'_audit.dta", replace
				restore
			}
		}
	}
}

