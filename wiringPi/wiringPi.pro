TEMPLATE = lib
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

TARGET = wiringPi
VERSION = 2.50
DEFINES += _GNU_SOURCE

QMAKE_CFLAGS += -Wformat=2 -Wall -Wextra -Winline -pipe -fPIC
LIBS += -lm -lpthread -lrt -lcrypt

unix {
    target.path = /usr/lib
    INSTALLS += target
}

SOURCES += \
    ads1115.c \
    bmp180.c \
    drcNet.c \
    drcSerial.c \
    ds18b20.c \
    htu21d.c \
    max5322.c \
    max31855.c \
    mcp23s08.c \
    mcp23s17.c \
    mcp3002.c \
    mcp3004.c \
    mcp3422.c \
    mcp4802.c \
    mcp23008.c \
    mcp23016.c \
    mcp23017.c \
    pcf8574.c \
    pcf8591.c \
    piHiPri.c \
    piThread.c \
    pseudoPins.c \
    rht03.c \
    sn3218.c \
    softPwm.c \
    softServo.c \
    softTone.c \
    sr595.c \
    wiringPi.c \
    wiringPiI2C.c \
    wiringPiSPI.c \
    wiringSerial.c \
    wiringShift.c \
    wpiExtensions.c


HEADERS += \
    ads1115.h \
    bmp180.h \
    drcNet.h \
    drcSerial.h \
    ds18b20.h \
    htu21d.h \
    max5322.h \
    max31855.h \
    mcp23s08.h \
    mcp23s17.h \
    mcp23x08.h \
    mcp23x0817.h \
    mcp3002.h \
    mcp3004.h \
    mcp3422.h \
    mcp4802.h \
    mcp23008.h \
    mcp23016.h \
    mcp23016reg.h \
    mcp23017.h \
    pcf8574.h \
    pcf8591.h \
    pseudoPins.h \
    rht03.h \
    sn3218.h \
    softPwm.h \
    softServo.h \
    softTone.h \
    sr595.h \
    wiringPiI2C.h \
    wiringPiSPI.h \
    wiringSerial.h \
    wiringShift.h \
    wpiExtensions.h \
    wiringPi.h

