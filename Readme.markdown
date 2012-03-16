## PV Suck
This is the soft side of a PIC based PhotoVoltiac monitor and load balancer. The Finished code will perform continuous integration of the current flow of the PV array, and of the incoming house supply via a pair of current clamps, and possibly monitoring the mains supply voltage too if required.


The system will detect when a surplus of electricity is being produced, and will switch an immersion heater on to sink the excess. The original circuit had triac switching with the hope that it could be phase driven (which it can't, the meter will still read the instantaneous draw and not the average one), but this has the option of powering the heater through a site transformer. This proves to both have a significant load even when idle, but more so, it has a healthy inrush current when it comes on from cold. For this reason the switching is relay based, which has the benefit of better electrical isolation too.

Longer term, I hope to get a variety of logging and reporting out of the device too. Most likely by RS232 and perhaps a LCD. I kind of like the idea of running this as a shield on a RasPi too.

