%% Creating and Plotting Dobot Magician
function [Dobot] = DobotMagician()
clf;
clc
scale = 0.5;
workspace = [-2 2 -2 2 -2 2]; % workspace environment boundary for the project 

%These links were from Sensors and Controls Dobot. There was a section with
%DH parameters for the Dobot Magician
Q1 = Link('d',0.08,'a',0,'alpha',-pi/2,'qlim',[deg2rad(-135) deg2rad(135)]);
Q2 = Link('d',0,'a',0.14,'alpha',0,'qlim',[deg2rad(5) deg2rad(80)],'offset', -pi/2);
Q3 = Link('d',0,'a',0.16,'alpha',0,'qlim',[deg2rad(15) deg2rad(170)]);
Q4 = Link('d',0,'a',0.05,'alpha',pi/2,'qlim',[deg2rad(-90) deg2rad(90)]);
Q5 = Link('d',-0.05,'a',0,'alpha',0,'qlim',[deg2rad(-85) deg2rad(85)]);


base = transl(0,0,0); %this will put the base of the robot at this coordinates
Dobot = SerialLink([Q1 Q2 Q3 Q4 Q5],'name','DOBOT MAGICIAN','base',base); %setting the parameters of the robot      
Dobot.teach(); % This will allow the robot to be controlled with each individual joints.
 %This will allow us to plot the dobot in its home position
T = transl(0.2,0.1,0.21);
q = Dobot.ikcon(T);
% 
Dobot.plot(q,'workspace',workspace,'scale',scale); %this will plot the robot with the translation coordinates
hold on;

end