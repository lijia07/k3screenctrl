bin_PROGRAMS = k3screenctrl k3screenbg
k3screenctrl_SOURCES = checksum.h common.h config.c config.h crcccitt.c debug.c debug.h \
					file_util.c file_util.h frame.c frame.h gpio.c gpio.h handlers.c handlers.h \
					infocenter.c infocenter.h logging.c logging.h main.c mcu_proto.h \
					mem_util.c mem_util.h pages.c pages.h requests.c requests.h scripts.c scripts.h \
					serial_port.c serial_port.h signals.c signals.h firmware_upgrade.c firmware_upgrade.h
k3screenbg_SOURCES = k3screenbg.c
AM_CFLAGS = -std=gnu99 -D_GNU_SOURCE -I$(SRCBASE)/include -I$(KERNEL_HEADER_DIR) \
			-I$(TOP)/nvram${BCMEX} -I$(TOP)/shared -I$(SRCBASE)/shared/bcmwifi/include \
			-I$(TOP)/curl-7.21.7/include -I$(TOP)/json-c -I$(TOP)/openssl/include -I$(TOP)/networkmap \
			-I$(TOP)/bwdpi_source/asus_include -I$(TOP)/httpd
AM_CFLAGS += -I$(TOP)/bwdpi_source/src/tdts_udb_sample
AM_CFLAGS += -I$(TOP)/bwdpi_source/src/tdts_udb_sample/linux
AM_CFLAGS += -I$(TOP)/bwdpi_source/include

AM_LDFLAGS = -L$(TOP)/nvram${BCMEX} -lnvram -L$(TOP)/shared -lshared -L$(TOP)/curl-7.21.7/lib/.libs -lcurl \
			-L$(TOP)/json-c/.libs -ljson-c -L$(TOP)/openssl -lcrypto -lssl -ldl
AM_LDFLAGS += -L$(TOP)/bwdpi_source/asus -lbwdpi
AM_LDFLAGS += -L$(TOP)/bwdpi_source/asus_sql -lbwdpi_sql
AM_LDFLAGS += -L$(TOP)/sqlite/.libs -lsqlite3
AM_LDFLAGS += -lpthread
