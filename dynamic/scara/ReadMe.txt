


scara动力学验证说明;

scara_dy_cal_formula.m力矩计算公式;

1.首先通过生成scara_dy_traj_gen生成轨迹和机器人惯性参数（这些惯性参数会后面的文件中使用）
2.打开scara_dy_fir_test.slx，点击运行，刚才生成的轨迹和惯性参数将被这个模型使用
3.运行完成之后，matlab将会运行生成的力矩放到tao1_real.mat和tao2_real.mat等文件中
4.打开scara_dy_check.m，将刚才生成的轨迹，带入我们的公式中，得到我们公式计算得到的力矩
5.将仿真得到的力矩跟我们公式计算得到的力矩画图，做差再画图，得到验证

附：model里面是机械图纸，和scara_dy_fir_test.slx里面对应起来


SCARA dynmics validation instructions;

scara_dy_cal_formula.m torque calculation formula;

1. First generate the trajectory and robot inertia parameters by generating scara_dy_traj_gen (these inertia parameters will be used in the later files)
2. Open scara_dy_fir_test.slx, click Run, and the trajectory and inertia parameters generated just now will be used by this model
3. After the run is completed, MATLAB will put the generated torque into the tao1_real.mat and tao2_real.mat files
4. Open the scara_dy_check.m, bring the trajectory just generated into our formula, and get the moment calculated by our formula
5. Draw the moment obtained by simulation and the torque calculated by our formula, and then draw the difference to get verification

P.S. The model is a mechanical drawing, which corresponds to the scara_dy_fir_test.slx






