######################################################################
# Automatically generated by qmake (3.1) Mon Jun 7 20:28:16 2021
######################################################################
TEMPLATE = app
TARGET = deepin-ocr
INCLUDEPATH += .

# The following define makes your compiler warn you if you use any
# feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Input
HEADERS += src/mainwindow.h \
           src/service/ocrinterface.h \
           src/service/dbusocr_adaptor.h \
           src/ocrapplication.h \
    src/mainwidget.h \
    src/resulttextview.h \
    src/textloadwidget.h \
    src/view/imageview.h

SOURCES += src/main.cpp \
           src/mainwindow.cpp \
           src/service/ocrinterface.cpp \
           src/service/dbusocr_adaptor.cpp \
           src/ocrapplication.cpp \
    src/mainwidget.cpp \
    src/textloadwidget.cpp \
    src/resulttextview.cpp \
    src/view/imageview.cpp


QT += dtkgui
QT += dtkwidget


#installs
target.path=/usr/bin

#翻译
isEmpty(TRANSLATIONS) {
    include(./translations.pri)
}
TRANSLATIONS_COMPILED = $$TRANSLATIONS
TRANSLATIONS_COMPILED ~= s/\.ts/.qm/g
translations.path=/usr/share/deepin-ocr/translations
translations.files=$$TRANSLATIONS_COMPILED

#Dbus文件
dbus_service.path=/usr/share/dbus-1/services
dbus_service.files=./com.deepin.Ocr.service


INSTALLS += target dbus_service translations

RESOURCES += \
    resource.qrc
