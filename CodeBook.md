### "CodeBook"

## Tidy File Variables

* [1] "ActivityName"(chr): string: Name of any of the six activities
    1. WALKING
    2. WALKING_UPSTAIRS
    3. WALKING_DOWNSTAIRS
    4. SITTING
    5. STANDING
    6. LAYING
    
* [2] "subjectID" (num): integer: ID for each one of 30 volunteers. It's number from 1 to 30

* [3] "Domain": (chr): the vector of features was obtained by calculating variables from the time and frequency domain
    a. "frequency"
    b. "time"

* [4] "Motion" (chr): The sensor acceleration signal has gravitational and body motion components
    a."Body"
    b. "Gravity"

* [5] "signals" (chr): The sensor signals (accelerometer and gyroscope) 
    a. "Acceleration"
    b. "Gravitational"

* [6] "Other" (chr): 
    a. "Jerk"
    b. "JerkMag"
    b. "Mag"
    c. <empty>

* [7] "Funtion" (chr): function applied (mean/average and the standard deviation)
    a."mean"
    b. "std"

* [8] "axial" (chr): they captured 3-axial linear acceleration 
    a. "X" 
    b. "Y"
    c. "Z"


### Metrics/Quantitative Variabless
* [9] "mean(Value)" (num)

