set more off
clear

log close _all

use "$d_out\cleaned drone sso data for missing and cant see values_test.dta", clear

set trace on

**Create unique id for coder pairs using timepoint, faceblock, and zone
gen coding_id = .
forval i=1/1317 {
	forval j=1/4 {
		forval k=1/4 {
			forval m=1/16 {
				if coding_id == . {
					replace coding_id = `i' if timepoint == "`j'" & zone == "`k'" & faceblock == "`k'.`m'"
					
				}
			}	
		}
	}
}
	
