scriptsdir = $(prefix)/lib/k3screenctrl
dist_scripts_DATA = k3screenctrl/basic.sh
#dist_scripts_DATA += k3screenctrl/wan.sh
#dist_scripts_DATA += k3screenctrl/wifi.sh
dist_scripts_DATA += k3screenctrl/port.sh
#dist_scripts_DATA += k3screenctrl/weather.sh
#dist_scripts_DATA += k3screenctrl/host.sh

install-data-hook:
	install -d $(INSTALLDIR)/lib/k3screenctrl
	install -d $(INSTALLDIR)/tmp
	install -m 0755 -t $(INSTALLDIR)/lib/k3screenctrl $(dist_scripts_DATA)
