clc
clear all

% Distance Traveled Each Day (miles/day)
Dist = 40;





% Miles before Tesla Model S needs recharge (miles)
TModS_Dist = 365;

% Number of days before recharge
Days_RC = TModS_Dist / Dist;

% Charge Capacity of Tesla Model S (kWh)
TModS_Cap = 85;

% Cost Per full charge (Cost/kWh * Capacity = $)
TModS_ChCost = 0.09*TModS_Cap;

% Cost per year ($/year)
TModS_AnnChrg = TModS_ChCost * (365/Days_RC);

TModS_Init = 110000;

for i = 1:1:8
PresValMaintain_TModS = (TModS_AnnChrg/(1.005)^i);
end

Pres_ResaleTModS = 50000/(1.03)^8;

TModS_Total8 = TModS_Init + PresValMaintain_TModS - Pres_ResaleTModS;

fprintf('The total 8 year cost for Tesla Model S is $%g',TModS_Total8)
disp(' ')
disp(' ')





% Miles before Acura NSX needs refill (miles)
GPV_Dist = 384;

% Number of days before rfill
Days_RF = GPV_Dist / Dist;

% Gallon Capacity of NSX (gal)
GPV_Cap = 16;

% Cost Per full refill (Cost/Gal * Capacity = $)
GPV_GCost = 3.00*GPV_Cap;

% Cost per year ($/year)
GPV_AnnGasCost = GPV_GCost * (365/Days_RF) + 2000;

NSX_Init = 35000;

for i = 1:1:8
PresValMaintain_NSX = (GPV_AnnGasCost/(1.05)^i);
end

Pres_ResaleNSX = 25000/(1.03)^8;

NSX_Total8 = NSX_Init + PresValMaintain_NSX - Pres_ResaleNSX;

fprintf('The total 8 year cost for the NSX is $%g',NSX_Total8)
disp(' ')
disp(' ')

