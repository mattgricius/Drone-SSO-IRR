set more off
clear

log close _all

*global d "C:\Users\dmwalla3\Dropbox\UAS and SSO Study\Interrater Reliability Drone Imagery SSO\Cleaned drone sso data to be used for IRR"
global d "C:\Users\mattg\ASU Google Drive\Dissertation\Data\Interrater Reliability Drone Imagery SSO"

use "$d\cleaned drone sso data for missing and cant see values_test.dta", clear



local varlistcount "litter graffiti paintedovergraffiti liquorbottles cigtobacco pills syringes blunthashpipe dimebags condomwrapperporn"

local varlist "paintinpoorcondition newlypainted structuraladaptationsasattach shedinbackyard ifyesfortheshedisitdiy ifyesfortheshedisitpref signsofdamagedisrepair roofinpoorcondition securitysystemsign notresspasssign bewareofdog videocameras securitydoor barredwindow highhedgesforprivacy fence weedsotherovergrowth deadweedsorlandscaping houseabandoned ifyesabandonedbeingused beingrenovated vacantlot ifyesvacantlotbeingused dumpinginyard abandonedcarsinyard cantheresidentenjoytheirbac shoppingcarts pool ifyespoolisclear ifyespoolisgreen ifyesdoesnthavewater ifyesusedfordumping shade space front back problem"


foreach var in `varlistcount' {
	tab `var'yesno `var'count
	*tab `var'yesno `var'count, missing
}

foreach var in `varlist' {
	tab `var'
	*tab `var', missing
}
