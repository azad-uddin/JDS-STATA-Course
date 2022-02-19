

clear 

* /Users/azaduddin/Desktop/JDS Special Course 2022_STATA/DATA_ImpactEvaluation_WB
// Import Data
*import delimited "/Users/azaduddin/Desktop/JDS Special Course 2022_STATA/DATA_ImpactEvaluation_WB/hh_98.csv", varnames(1) clear 
 
 
log using day1.smcl, replace
 
 
import delimited "hh_98.csv", varnames(1) clear


save hh_98.dta, replace


clear

use "hh_98.dta", clear




// Describe data

des


des agehead sexhead educhead famsize hhland hhasset


sum 
sum agehead sexhead educhead famsize hhland hhasset




sum egg agehead sexhead educhead famsize hhland hhasset , sep(0)


list hhland hhasset expfd expnfd exptot in 1/10

codebook sexhead



tab sexhead

replace sexhead = 10 in 5
codebook sexhead
tab dmmfd
tab dfmfd
tab dfmfd if sexhead==1
list dfmfd if dfmfd==.
list dfmfd if dfmfd==.
list sexhead if agehead==50
list sexhead if agehead>50
list if agehead>50 & sexhead==1
list educhead if agehead>50 & sexhead==1
sum educhead if agehead>50 & sexhead==1
tab educhead if agehead>50 & sexhead==1
tab dfmfd if agehead>50 & sexhead==1





* Table

tab sexhead


tab educhead


tab educhead sexhead



tab agehead

sum agehead


recode agehead (18/30=1) (30/50=2) (50/95=3), gen(agecat)

tab agecat


* Recode educhead variable into 4 category as 0, 1-5, 6-10, more than 10

tab educhead

recode educhead (0=1) (1/5=2) (6/10=3) (11/16=4), gen(educcat)

tab educcat



label define educ 1 "No Education" 2 "Primary Completed" 3 " Secondary Completed" 4 "Higher than secondary"

tab educcat


label values educcat educ





tab educcat



tab agehead educhead



tab educcat sexhead


* Label values in the sexhead variable as 0=female 1=male


label define sexlabel 1 "Male" 0 "Female"
label values sexhead sexlabel


tab educcat sexhead


tab educcat sexhead, row



gen lexptot = log(exptot)



* Generate logarithm of food (expfd) and non-food (expnfd) expenditure.





gen lexpfd = log(expfd)

gen lexpnfd = log(expnfd)




log close




























