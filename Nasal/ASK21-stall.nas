## Learjet 35-A, stall and overspeed warning
## PH-JBO 20120130p
# modified by Herbert Wagner for ASK21 09/2016


var aoaStall = 4.5;
setprop("/instrumentation/alerts/aoaStall",4.5);
setprop("/instrumentation/alerts/stall",0);

var warning = func {
  
  ## get variables
  var aoa = getprop("/orientation/alpha-deg");
  var flaps = getprop("/controls/flight/spoiler") * 6;
  var gear = 1;
  var stalling = "false";
  var gearalt = getprop("/position/gear-agl-ft");
  var aoaStall = (4.5 + flaps + gear);
## compare and set warning
  if ((aoa!=nil) and (flaps!=nil))
    {
        if (aoa>aoaStall)
	{var stalling="true";}
     }
	if ((gearalt!=nil) and (getprop("/gear/gear[1]/wow")!=1) )
	{
	setprop("/instrumentation/alerts/stall",stalling);
	setprop("/instrumentation/alerts/aoaStall",aoaStall);
	}
	else setprop("/instrumentation/alerts/stall",0);
	setprop("/instrumentation/alerts/aoaStall",aoaStall);
	settimer (warning,0.5);
}

warning();