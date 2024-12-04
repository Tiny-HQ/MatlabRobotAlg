stop_standard	根据当前的速度、加速度来求时间序列，其中速度大于0（如果反向，就取绝对值），
		加速度表示需要停止时候的加速度值，必须大于等于0，也就是如果当前处于减速段，不会处理，
		如果处于匀速段，会以速度跟jerk值来求取时间序列；
		如果处于加速段，反向时候，减速度跟当时加速度相同；
		
		V>0;A>=0;J>0;
		V标量；A标量；J标量

stop_ext		根据当前速度、加速度、以及设定的减速度（大于0）求时间序列，
		如果当前处于减速段，不会处理，
		如果处于匀速段或者加速段，会以当前速度、加速度以及当前减速度来计算时间序列；

		V>0;A>=0;J>0;A_set>0;
		V标量；A标量；J标量；A_set标量；

stop		standard和ext的加速度必须大于0，当前表示减速度可以为0，设定减速度（大于0）
		如果处于减速段，并且当前的减速度过大，速度过小会出现反向走的情况，会先将减速度减到0然后反向加速再减速到0；
		
		V>0;J>0;A_set>0;
		V标量；A矢量；J标量；A_set标量；


stop_entire	standard和ext的加速度必须大于0，stop的速度必须大于0，当前表示当前速度V可大于0可小于0，当前的加速度可大于0可小于0，
		
		J>0;A_set>0;
		V矢量；A矢量；J标量；A_set标量；

stop_standard 
Find the time series according to the current velocity and acceleration, where the velocity is greater than 0 (if it is reversed, the absolute value is taken),
		Acceleration represents the acceleration value when it needs to be stopped, and must be greater than or equal to 0, that is, if it is currently in the deceleration section, it will not be processed.
		If it is in the constant velocity range, the time series will be calculated by the velocity and the jerk value;
		If you are in the acceleration phase, the deceleration is the same as the acceleration at that time when you are reversing;
		
    V>0; A>=0; J>0;
		V scalar; A scalar; J scalar

stop_ext 
    Find the time series according to the current velocity, acceleration, and set deceleration (greater than 0),
		If it is currently in the deceleration section, it will not be processed,
		If it is in the constant velocity or acceleration phase, the time series will be calculated based on the current velocity, acceleration and current deceleration.

    V>0; A>=0; J>0; A_set>0;
		V scalar; A scalar; J scalar; A_set scalar;

    The acceleration of stop standard and ext must be greater than 0, the current deceleration can be 0, set the deceleration (greater than 0)
		If it is in the deceleration section, and the current deceleration is too large, the speed is too small, and the deceleration will be reduced to 0 first, and then the reverse acceleration will be decelerated to 0;
		
    V>0; J>0; A_set>0;
		V scalar; A vector; J scalar; A_set scalar;

stop_entire 
    The acceleration of standard and ext must be greater than 0, the speed of stop must be greater than 0, the current means that the current velocity V can be greater than 0 or less than 0, and the current acceleration can be greater than 0 or less than 0,
		
J>0; A_set>0;
		V vector; A vector; J scalar; A_set scalar;