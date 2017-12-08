## __1. “Tidydata” DATABASE__: 180 obs. 68 variables
- __subject.__ Integer. 30 correlative values. 1,2,…30
- __activity.__  Factor. 6 levels:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING
- __Rest of variables.__  66 Numeric variables. Values in [-1:+1] corresponding to averages of normalized original values.

		1	Time domain.Body acceleration.Accelerometer.-Average.-x
		2	Time domain.Body acceleration.Accelerometer.-Average.-Y
		3	Time domain.Body acceleration.Accelerometer.-Average.-Z
		4	Time domain.Body acceleration.Accelerometer.-Standard deviation.-X
		5	Time domain.Body acceleration.Accelerometer.-Standard deviation.-Y
		6	Time domain.Body acceleration.Accelerometer.-Standard deviation.-Z
		7	Time domain.Gravity acceleration.Accelerometer.-Average.-X
		8	Time domain.Gravity acceleration.Accelerometer.-Average.-Y
		9	Time domain.Gravity acceleration.Accelerometer.-Average.-Z
		10	Time domain.Gravity acceleration.Accelerometer.-Standard deviation.-X
		11	Time domain.Gravity acceleration.Accelerometer.-Standard deviation.-Y
		12	Time domain.Gravity acceleration.Accelerometer.-Standard deviation.-Z
		13	Time domain.Body acceleration.Accelerometer.Jerk signal.-Average.-X
		14	Time domain.Body acceleration.Accelerometer.Jerk signal.-Average.-Y
		15	Time domain.Body acceleration.Accelerometer.Jerk signal.-Average.-Z
		16	Time domain.Body acceleration.Accelerometer.Jerk signal.-Standard deviation.-X
		17	Time domain.Body acceleration.Accelerometer.Jerk signal.-Standard deviation.-Y
		18	Time domain.Body acceleration.Accelerometer.Jerk signal.-Standard deviation.-Z
		19	Time domain.Body acceleration.Gyroscope.-Average.-X
		20	Time domain.Body acceleration.Gyroscope.-Average.-Y
		21	Time domain.Body acceleration.Gyroscope.-Average.-Z
		22	Time domain.Body acceleration.Gyroscope.-Standard deviation.-X
		23	Time domain.Body acceleration.Gyroscope.-Standard deviation.-Y
		24	Time domain.Body acceleration.Gyroscope.-Standard deviation.-Z
		25	Time domain.Body acceleration.Gyroscope.Jerk signal.-Average.-X
		26	Time domain.Body acceleration.Gyroscope.Jerk signal.-Average.-Y
		27	Time domain.Body acceleration.Gyroscope.Jerk signal.-Average.-Z
		28	Time domain.Body acceleration.Gyroscope.Jerk signal.-Standard deviation.-X
		29	Time domain.Body acceleration.Gyroscope.Jerk signal.-Standard deviation.-Y
		30	Time domain.Body acceleration.Gyroscope.Jerk signal.-Standard deviation.-Z
		31	Time domain.Body acceleration.Accelerometer.Fourier Transformation.-Average.
		32	Time domain.Body acceleration.Accelerometer.Fourier Transformation.-Standard deviation.
		33	Time domain.Gravity acceleration.Accelerometer.Fourier Transformation.-Average.
		34	Time domain.Gravity acceleration.Accelerometer.Fourier Transformation.-Standard deviation.
		35	Time domain.Body acceleration.Accelerometer.Jerk signal.Fourier Transformation.-Average.
		36	Time domain.Body acceleration.Accelerometer.Jerk signal.Fourier Transformation.-Standard deviation.
		37	Time domain.Body acceleration.Gyroscope.Fourier Transformation.-Average.
		38	Time domain.Body acceleration.Gyroscope.Fourier Transformation.-Standard deviation.
		39	Time domain.Body acceleration.Gyroscope.Jerk signal.Fourier Transformation.-Average.
		40	Time domain.Body acceleration.Gyroscope.Jerk signal.Fourier Transformation.-Standard deviation.
		41	Frequency domain.Body acceleration.Accelerometer.-Average.-X
		42	Frequency domain.Body acceleration.Accelerometer.-Average.-Y
		43	Frequency domain.Body acceleration.Accelerometer.-Average.-Z
		44	Frequency domain.Body acceleration.Accelerometer.-Standard deviation.-X
		45	Frequency domain.Body acceleration.Accelerometer.-Standard deviation.-Y
		46	Frequency domain.Body acceleration.Accelerometer.-Standard deviation.-Z
		47	Frequency domain.Body acceleration.Accelerometer.Jerk signal.-Average.-X
		48	Frequency domain.Body acceleration.Accelerometer.Jerk signal.-Average.-Y
		49	Frequency domain.Body acceleration.Accelerometer.Jerk signal.-Average.-Z
		50	Frequency domain.Body acceleration.Accelerometer.Jerk signal.-Standard deviation.-X
		51	Frequency domain.Body acceleration.Accelerometer.Jerk signal.-Standard deviation.-Y
		52	Frequency domain.Body acceleration.Accelerometer.Jerk signal.-Standard deviation.-Z
		53	Frequency domain.Body acceleration.Gyroscope.-Average.-X
		54	Frequency domain.Body acceleration.Gyroscope.-Average.-Y
		55	Frequency domain.Body acceleration.Gyroscope.-Average.-Z
		56	Frequency domain.Body acceleration.Gyroscope.-Standard deviation.-X
		57	Frequency domain.Body acceleration.Gyroscope.-Standard deviation.-Y
		58	Frequency domain.Body acceleration.Gyroscope.-Standard deviation.-Z
		59	Frequency domain.Body acceleration.Accelerometer.Fourier Transformation.-Average.
		60	Frequency domain.Body acceleration.Accelerometer.Fourier Transformation.-Standard deviation.
		61	Frequency domain.Body acceleration.Accelerometer.Jerk signal.Fourier Transformation.-Average.
		62	Frequency domain.Body acceleration.Accelerometer.Jerk signal.Fourier Transformation.-Standard deviation.
		63	Frequency domain.Body acceleration.Gyroscope.Fourier Transformation.-Average.
		64	Frequency domain.Body acceleration.Gyroscope.Fourier Transformation.-Standard deviation.
		65	Frequency domain.Body acceleration.Gyroscope.Jerk signal.Fourier Transformation.-Average.
		66	Frequency domain.Body acceleration.Gyroscope.Jerk signal.Fourier Transformation.-Standard deviation.


## 2. Original DATA: 

- __activity_labels:__  txt file with Name of the 6 different activities__
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

- __features:__  txt file with labels for the 561 features. With the following pattern:

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

	tBodyAcc-XYZ
	tGravityAcc-XYZ
	tBodyAccJerk-XYZ
	tBodyGyro-XYZ
	tBodyGyroJerk-XYZ
	tBodyAccMag
	tGravityAccMag
	tBodyAccJerkMag
	tBodyGyroMag
	tBodyGyroJerkMag
	fBodyAcc-XYZ
	fBodyAccJerk-XYZ
	fBodyGyro-XYZ
	fBodyAccMag
	fBodyAccJerkMag
	fBodyGyroMag
	fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

	mean(): Mean value
	std(): Standard deviation
	mad(): Median absolute deviation 
	max(): Largest value in array
	min(): Smallest value in array
	sma(): Signal magnitude area
	energy(): Energy measure. Sum of the squares divided by the number of values. 
	iqr(): Interquartile range 
	entropy(): Signal entropy
	arCoeff(): Autorregresion coefficients with Burg order equal to 4
	correlation(): correlation coefficient between two signals
	maxInds(): index of the frequency component with largest magnitude
	meanFreq(): Weighted average of the frequency components to obtain a mean frequency
	skewness(): skewness of the frequency domain signal 
	kurtosis(): kurtosis of the frequency domain signal 
	bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
	angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

	gravityMean
	tBodyAccMean
	tBodyAccJerkMean
	tBodyGyroMean
	tBodyGyroJerkMean


