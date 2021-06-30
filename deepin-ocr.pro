######################################################################
# Automatically generated by qmake (3.1) Mon Jun 7 20:28:16 2021
######################################################################
TEMPLATE = app
TARGET = deepin-ocr
INCLUDEPATH += .
#CONFIG += C++17
#QMAKE_CXXFLAGS += -std=c++17 -std=gnu++17

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
    src/view/imageview.h \
    src/tessocrutils/tessocrutils.h \
    src/loadingwidget.h

SOURCES += src/main.cpp \
           src/mainwindow.cpp \
           src/service/ocrinterface.cpp \
           src/service/dbusocr_adaptor.cpp \
           src/ocrapplication.cpp \
    src/mainwidget.cpp \
    src/textloadwidget.cpp \
    src/resulttextview.cpp \
    src/view/imageview.cpp \
    src/tessocrutils/tessocrutils.cpp \
    src/loadingwidget.cpp

LIBS +=  -llept  -ltesseract\

#include(3rdparty/tesseract_ocr/tesseract_dependency.pri)

QT += dtkgui
QT += dtkwidget


#installs
target.path=/usr/bin

##翻译
isEmpty(TRANSLATIONS) {
    include(./translations.pri)
}
#CONFIG(release, debug|release) {
#    TRANSLATIONS = $$files($$PWD/translations/*.ts)
#    #遍历目录中的ts文件，调用lrelease将其生成为qm文件
#    for(tsfile, TRANSLATIONS) {
#        qmfile = $$replace(tsfile, .ts$, .qm)
#        system(lrelease $$tsfile -qm $$qmfile) | error("Failed to lrelease")
#    }
#}
TRANSLATIONS_COMPILED = $$TRANSLATIONS
TRANSLATIONS_COMPILED ~= s/\.ts/.qm/g

translations.path=/usr/share/deepin-ocr/translations
translations.files = $$TRANSLATIONS_COMPILED

#translations.files=$$PWD/translations/*qm

#Dbus文件
dbus_service.path=/usr/share/dbus-1/services
dbus_service.files=./com.deepin.Ocr.service

#Tesseract-ocr识别语言包
tesslangs.path=/usr/share/deepin-ocr/tesslangs
tesslangs.files=./assets/tesslangs/chi_sim.traineddata ./assets/tesslangs/chi_tra.traineddata ./assets/tesslangs/eng.traineddata ./assets/tesslangs/chi_sim_vert.traineddata ./assets/tesslangs/chi_tra_vert.traineddata

desktop.path=/usr/share/applications
desktop.files=./deepin-ocr.desktop

icon.path=/usr/share/icons/hicolor/scalable/apps
icon.files=./assets/deepin-ocr.svg


INSTALLS += target dbus_service translations icon desktop tesslangs

CONFIG *= update_translations release_translations

CONFIG(update_translations) {
    isEmpty(lupdate):lupdate=lupdate
    system($$lupdate -no-obsolete -locations none $$_PRO_FILE_)
}

CONFIG(release_translations) {
    isEmpty(lrelease):lrelease=lrelease
    system($$lrelease $$_PRO_FILE_)
}

DSR_LANG_PATH += $$DSRDIR/translations
DEFINES += "DSR_LANG_PATH=\\\"$$DSR_LANG_PATH\\\""

RESOURCES += \
    resource.qrc

#DISTFILES += \
#    3rdparty/tesseract_ocr/tesseract_dependency.pri
