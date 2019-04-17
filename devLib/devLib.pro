#-------------------------------------------------
#
# Project created by QtCreator 2019-03-29T22:32:04
#
#-------------------------------------------------

QT       -= core gui

TARGET = wiringPiDev
TEMPLATE = lib

VERSION = 2.50
DEFINES += WIRINGPIDEV_LIBRARY
DEFINES += _GNU_SOURCE
QMAKE_CFLAGS += -Wformat=2 -Wall -Winline -pipe -fPIC
INCLUDEPATH += ../wiringPi

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        ds1302.c maxdetect.c  piNes.c		\
        gertboard.c piFace.c			\
        lcd128x64.c lcd.c			\
        scrollPhat.c				\
        piGlow.c

HEADERS += \
        ds1302.h gertboard.h  lcd128x64.h  lcd.h  \
        maxdetect.h piFace.h  piGlow.h  piNes.h\
        scrollPhat.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}
