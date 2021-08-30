set more off
clear

log close _all

use "$d_out\cleaned drone sso data for missing and cant see values_test.dta", clear

set trace on

**Create unique id for coder pairs using timepoint, faceblock, and zone
gen coding_id = .
gen id = 1
levelsof faceblock, local(fb)
forval t=1/4 {
	foreach i in `fb' {
				replace coding_id = id if timepoint == "`t'" & faceblock == "`i'" & coding_id == .
				replace id = id + 1
	}
}
	
order coding_id timepoint faceblock
sort coding_id
