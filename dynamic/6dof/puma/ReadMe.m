
% 1、首先运行puma_gen_traj_and_mass_param.m，生成质量参数和轨迹参数； First, run puma_gen_traj_and_mass_param.m to generate mass parameters and trajectory parameters.
% 2、打开puma_dy_create_model.slx这里面有个模型，双击puma560这个模块，进去之后，会看到base、link1到link6，
%  2.Open puma_dy_create_model.slx, there is a model in it, double-click the puma560 module, after entering, you will see base, link1 to link6,
%     双击base，弹出对话框，找到visualization，把external graphics file改到你当前目录下面的.\puma\model\RobotPart0.stl，link1到link6的目录也是相同的修改；
% Double-click base, pop up the dialog box, find visualization, change the external graphics file to .pumamodelRobotPart0.stl in your current directory, and the directories from link1 to link6 are also the same modifications;
% 3、运行puma_dy_create_model.slx，过20秒，会生成力矩tao_data_1、tao_data_2、、、Running puma_dy_create_model.slx, after 20 seconds, a torque tao_data_1 and tao_data_2、、、 will be generated.
% 4、运行puma_dy_check.m，就会有各轴力矩曲线跟误差曲线；puma_dy_check operation, there will be a torque curve and an error curve of each axis;
% 
% 
% 附:.\puma\model\PUMA-560.robot这个文件可以用robodk打开，可以看到dh参数是怎么建立的；Attached:.\puma\model\PUMA-560.robot This file can be opened with robodk, and you can see how the dh parameter is created;
%     惯量参数是.\puma\model\MASS0.txt。。。。。The inertia parameter is.\puma\model\MASS0.txt。。。。。
%     .\puma\model\PUMA560