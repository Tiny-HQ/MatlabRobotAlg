stop_standard	���ݵ�ǰ���ٶȡ����ٶ�����ʱ�����У������ٶȴ���0��������򣬾�ȡ����ֵ����
		���ٶȱ�ʾ��Ҫֹͣʱ��ļ��ٶ�ֵ��������ڵ���0��Ҳ���������ǰ���ڼ��ٶΣ����ᴦ��
		����������ٶΣ������ٶȸ�jerkֵ����ȡʱ�����У�
		������ڼ��ٶΣ�����ʱ�򣬼��ٶȸ���ʱ���ٶ���ͬ��
		
		V>0;A>=0;J>0;
		V������A������J����

stop_ext		���ݵ�ǰ�ٶȡ����ٶȡ��Լ��趨�ļ��ٶȣ�����0����ʱ�����У�
		�����ǰ���ڼ��ٶΣ����ᴦ��
		����������ٶλ��߼��ٶΣ����Ե�ǰ�ٶȡ����ٶ��Լ���ǰ���ٶ�������ʱ�����У�

		V>0;A>=0;J>0;A_set>0;
		V������A������J������A_set������

stop		standard��ext�ļ��ٶȱ������0����ǰ��ʾ���ٶȿ���Ϊ0���趨���ٶȣ�����0��
		������ڼ��ٶΣ����ҵ�ǰ�ļ��ٶȹ����ٶȹ�С����ַ����ߵ���������Ƚ����ٶȼ���0Ȼ��������ټ��ٵ�0��
		
		V>0;J>0;A_set>0;
		V������Aʸ����J������A_set������


stop_entire	standard��ext�ļ��ٶȱ������0��stop���ٶȱ������0����ǰ��ʾ��ǰ�ٶ�V�ɴ���0��С��0����ǰ�ļ��ٶȿɴ���0��С��0��
		
		J>0;A_set>0;
		Vʸ����Aʸ����J������A_set������

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