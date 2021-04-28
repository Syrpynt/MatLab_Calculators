
%% OUTLINE

% Program Details
% Purpose Description
% Inputs
% Outputs
% Results/Conclusion




%% Details

% Program: Arrow_Shaft_StngthClcltr.m
% Author: Michael Anthony Cohen
% Date: 06/02/2014


%% Purpose

% I want to make an easy program for user's to follow the engineering
% mechanics of arrow shafts and use empirical equations to solve the
% strength and cost and weight differences between Aluminum, Titanium,
% steel, and carbon options for arrow splines.

% My option to put steel in this program as an option is mainly to show
% that it is highly unfeasible for the density/weight is far too high
% for the arrow to be suitable for any purpose.


clc
clear all

%% INPUTS

% The elastic modulus is in units of Pascals
% The density is units of kg/m^3
% cost is $/length

% Aluminum 2024 properties
Elstc2024 = 73000000000;
Dnsty2024 = 2780;

% Aluminum 6064 properties
Elstc6064 = 69000000000;
Dnsty6064 = 2720;

% Titanium Grade 9 properties
ElstcG9 = 103000000000;
DnstyG9 = 4480;

% Titanium Grade 5 properties
ElstcG5 = 115000000000;
DnstyG5 = 4420;

% Carbon Fiber Matrix (Quasi-Isotropic) properties
ElstcCFQI = 45500000000;
DnstyCFQI = 1550;

% Carbon Fiber Matrix (Unidirectional Laminate) properties
ElstcCFUL = 215000000000;
DnstyCFUL = 1630;

% Steel Stainless AISI 302 properties
ElstcStn = 180000000000;
DnstyStn = 7700;

% Steel Annealed ASTM-A36 properties
ElstcAnn = 200000000000;
DnstyAnn = 7848;

% Arrow length in meters, 39.37 inches is 1 meter
lngth = 0.7112;

% Arrow outer diameter, thickness, inner radius and outer radius in meters
OD = 0.0079375;
th = 0.000508;
Ro = (OD/2)
Ri = Ro - th
Ravg = (Ri + Ro)/2;
% Shaft cross sectional area
Ar = pi*(Ro^2 - Ri^2);
Ii = (pi/4)*(Ro^4 - Ri^4)

%% OUTPUTS

k = sqrt(Ii/Ar)
Lratio = lngth/k;
Syc2024 = 2*(pi^2)*Elstc2024/(Lratio^2)
Syc6064 = 2*(pi^2)*Elstc6064/(Lratio^2)
SycG9 =   2*(pi^2)*ElstcG9/(Lratio^2)
SycG5 =   2*(pi^2)*ElstcG5/(Lratio^2)
SycCFQI = 2*(pi^2)*ElstcCFQI/(Lratio^2)
SycCFUL = 2*(pi^2)*ElstcCFUL/(Lratio^2)
SycStn =  2*(pi^2)*ElstcStn/(Lratio^2)
SycAnn =  2*(pi^2)*ElstcAnn/(Lratio^2)

Fcrit_2024 = Ar*(Syc2024 - (1/Elstc2024)*(Syc2024*Lratio/(2*pi))^2)
Fcrit_6064 = Ar*(Syc6064 - (1/Elstc6064)*(Syc6064*Lratio/(2*pi))^2)
Fcrit_G9 =   Ar*(SycG9 - (1/ElstcG9)*(SycG9*Lratio/(2*pi))^2)
Fcrit_G5 =   Ar*(SycG5 - (1/ElstcG5)*(SycG5*Lratio/(2*pi))^2)
Fcrit_CFQI = Ar*(SycCFQI - (1/ElstcCFQI)*(SycCFQI*Lratio/(2*pi))^2)
Fcrit_CFUL = Ar*(SycCFUL - (1/ElstcCFUL)*(SycCFUL*Lratio/(2*pi))^2)
Fcrit_Stn =  Ar*(SycStn - (1/ElstcStn)*(SycStn*Lratio/(2*pi))^2)
Fcrit_Ann =  Ar*(SycAnn - (1/ElstcAnn)*(SycAnn*Lratio/(2*pi))^2)


%% CONCLUSION



