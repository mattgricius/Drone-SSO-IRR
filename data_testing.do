set more off
clear
log close _all
**If set to 1 use matt anything else will run dani
global user_matt 1
ZAS
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
