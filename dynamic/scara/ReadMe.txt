


scara����ѧ��֤˵��;

scara_dy_cal_formula.m���ؼ��㹫ʽ;

1.����ͨ������scara_dy_traj_gen���ɹ켣�ͻ����˹��Բ�������Щ���Բ����������ļ���ʹ�ã�
2.��scara_dy_fir_test.slx��������У��ղ����ɵĹ켣�͹��Բ����������ģ��ʹ��
3.�������֮��matlab�����������ɵ����طŵ�tao1_real.mat��tao2_real.mat���ļ���
4.��scara_dy_check.m�����ղ����ɵĹ켣���������ǵĹ�ʽ�У��õ����ǹ�ʽ����õ�������
5.������õ������ظ����ǹ�ʽ����õ������ػ�ͼ�������ٻ�ͼ���õ���֤

����model�����ǻ�еͼֽ����scara_dy_fir_test.slx�����Ӧ����


SCARA dynmics validation instructions;

scara_dy_cal_formula.m torque calculation formula;

1. First generate the trajectory and robot inertia parameters by generating scara_dy_traj_gen (these inertia parameters will be used in the later files)
2. Open scara_dy_fir_test.slx, click Run, and the trajectory and inertia parameters generated just now will be used by this model
3. After the run is completed, MATLAB will put the generated torque into the tao1_real.mat and tao2_real.mat files
4. Open the scara_dy_check.m, bring the trajectory just generated into our formula, and get the moment calculated by our formula
5. Draw the moment obtained by simulation and the torque calculated by our formula, and then draw the difference to get verification

P.S. The model is a mechanical drawing, which corresponds to the scara_dy_fir_test.slx






