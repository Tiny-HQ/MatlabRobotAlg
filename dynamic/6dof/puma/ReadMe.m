
% 1����������puma_gen_traj_and_mass_param.m���������������͹켣������ First, run puma_gen_traj_and_mass_param.m to generate mass parameters and trajectory parameters.
% 2����puma_dy_create_model.slx�������и�ģ�ͣ�˫��puma560���ģ�飬��ȥ֮�󣬻ῴ��base��link1��link6��
%  2.Open puma_dy_create_model.slx, there is a model in it, double-click the puma560 module, after entering, you will see base, link1 to link6,
%     ˫��base�������Ի����ҵ�visualization����external graphics file�ĵ��㵱ǰĿ¼�����.\puma\model\RobotPart0.stl��link1��link6��Ŀ¼Ҳ����ͬ���޸ģ�
% Double-click base, pop up the dialog box, find visualization, change the external graphics file to .pumamodelRobotPart0.stl in your current directory, and the directories from link1 to link6 are also the same modifications;
% 3������puma_dy_create_model.slx����20�룬����������tao_data_1��tao_data_2������Running puma_dy_create_model.slx, after 20 seconds, a torque tao_data_1 and tao_data_2������ will be generated.
% 4������puma_dy_check.m���ͻ��и����������߸�������ߣ�puma_dy_check operation, there will be a torque curve and an error curve of each axis;
% 
% 
% ��:.\puma\model\PUMA-560.robot����ļ�������robodk�򿪣����Կ���dh��������ô�����ģ�Attached:.\puma\model\PUMA-560.robot This file can be opened with robodk, and you can see how the dh parameter is created;
%     ����������.\puma\model\MASS0.txt����������The inertia parameter is.\puma\model\MASS0.txt����������
%     .\puma\model\PUMA560