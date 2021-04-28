% This program is going to be used to calculate either spur,
% herringbone, or helical gear meshes. Comments will include
% Typical or commonly used numbers in standard gears.
% Use Degrees and SI units (millimeters).
% Author: Michael Cohen
% Date: 01-13-2015
% Title: Advanced Gear Calculator

clear all
clc

% Pressure Angle (as input)
% Typical angles can be from 14.5deg to 25deg
fprintf('\n Typical angles can be from 14.5deg to 25deg.\n')
fprintf('\n 15-17.5deg decreases noise while 20-25deg increases loading capacity\n')
Phi = input('\n What is your gear mesh"s pressure angle? ');

% The Minimum number of teeth for the pinion gear based on this pressure
% angle
Nmin = 2/((sind(Phi))^2);
fprintf('\n The minimum number of teeth that gear 1 can have is: %g \n',Nmin)

% Number Of Teeth for Gear 1
NoT1 = input('\n How many teeth does Gear 1 have? ');
% Pitch Diameter for Gear 1
Dp1 = input('\n What is Gear 1"s Pitch Circle (Center of Contact) Diameter in mm? ');
% Pitch Radius for Pinion
Rp1 = Dp1/2;
% Module for Pinion
mOd1 = Dp1/NoT1;
% Dedendum of Gear 1 (Pinion)
DD1 = 1.25*(mOd1);
% Addendum of Gear 1 (Pinion)
AD1 = mOd1;

% Outside Diameter Gear 1 (Pinion)
Do1 = Dp1 + AD1;
% Inside Diameter Gear 1 (Pinion)
Di1 = Dp1 - DD1;

fprintf('\n The module for Gear 1 is: %g mm',mOd1)
fprintf('\n The Outside Gear 1 Diameter (tooth tip) is: %g mm',Do1)
fprintf('\n The Inside Gear 1 Diameter (tooth base) is: %g mm',Di1)


% Number Of Gear Teeth for Gear 2
NoT2 = input('\n\n\n How many teeth does Gear 2 have? ');
% Pitch Diameter for Gear
Dp2 = input('\n What is the second gear"s Pitch Circle (Average Contact Distance) Diameter in mm? ');
% Pitch Radius for Gear
Rp2 = Dp2/2;
% Module for Gear 2
mOd2 = Dp2/NoT2;
% Dedendum of Gear 2
DD2 = 1.25*(mOd2);
% Addendum of Gear 2
AD2 = mOd2;

% Outside Diameter Gear 2
Do2 = Dp2 + AD2;
% Inside Diameter Gear 2
Di2 = Dp2 - DD2;

fprintf('\n The module for Gear 2 is: %g mm',mOd2)
fprintf('\n The Outside Gear 2 Diameter (tooth tip) is: %g mm',Do2)
fprintf('\n The Inside Gear 2 Diameter (tooth base) is: %g mm',Di2)


% Center to Center Distance
CD = Dp1/2 + Dp2/2;

% Length Of Action = Z
Z = sqrt((Rp1+AD1)^2 - (Rp1*cosd(Phi))^2) + sqrt((Rp2+AD2)^2 - (Rp2*cosd(Phi))^2) - CD*sind(Phi);
fprintf('\n The Length Of Action for this Gear Mesh is: %g',Z)

% Contact Ratio
CR = (NoT1*Z)/(Dp1*pi*cosd(Phi));
fprintf('\n\n The Contact Ratio is: %g',CR)


% The degrees of spacing between each tooth for Gear 1
Theta1 = 360/(NoT1);
% The Degrees between the CAD "Invisible String" Lines for Gear 1
Th_Inv1 = 360/(NoT1*2*pi);
% The Length of invisible string after 1*Th_Inv1 for Gear 1
L_Inv1 = (Dp1*cosd(Phi)/2)*(1/NoT1)