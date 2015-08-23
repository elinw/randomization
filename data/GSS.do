#delimit ;

   infix
      year     1 - 11
      id_      12 - 22
      age      23 - 33
      educ     34 - 44
      sex      45 - 55
      race     56 - 66
      relig    67 - 77
      zodiac   78 - 88
using GSS.dat;

label variable year     "Gss year for this respondent                       ";
label variable id_      "Respondent id number";
label variable age      "Age of respondent";
label variable educ     "Highest year of school completed";
label variable sex      "Respondents sex";
label variable race     "Race of respondent";
label variable relig    "Rs religious preference";
label variable zodiac   "Respondents astrological sign";


label define gsp001x
   99       "No answer"
   98       "Don't know"
   89       "89 or older"
;
label define gsp002x
   99       "No answer"
   98       "Don't know"
   97       "Not applicable"
;
label define gsp003x
   2        "Female"
   1        "Male"
;
label define gsp004x
   3        "Other"
   2        "Black"
   1        "White"
   0        "Not applicable"
;
label define gsp005x
   99       "No answer"
   98       "Don't know"
   13       "Inter-nondenominational"
   12       "Native american"
   11       "Christian"
   10       "Orthodox-christian"
   9        "Moslem/islam"
   8        "Other eastern"
   7        "Hinduism"
   6        "Buddhism"
   5        "Other"
   4        "None"
   3        "Jewish"
   2        "Catholic"
   1        "Protestant"
   0        "Not applicable"
;
label define gsp006x
   99       "No answer"
   98       "Don't know"
   12       "Pisces"
   11       "Aquarius"
   10       "Capricorn"
   9        "Sagittarius"
   8        "Scorpio"
   7        "Libra"
   6        "Virgo"
   5        "Leo"
   4        "Cancer"
   3        "Gemini"
   2        "Taurus"
   1        "Aries"
   0        "Not applicable"
;


label values age      gsp001x;
label values educ     gsp002x;
label values sex      gsp003x;
label values race     gsp004x;
label values relig    gsp005x;
label values zodiac   gsp006x;


