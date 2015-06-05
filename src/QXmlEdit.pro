#/**************************************************************************
# *  This file is part of QXmlEdit                                         *
# *  Copyright (C) 2011 by Luca Bellonda and individual contributors       *
# *    as indicated in the AUTHORS file                                    *
# *  lbellonda _at_ gmail.com                                              *
# *                                                                        *
# * This library is free software; you can redistribute it and/or          *
# * modify it under the terms of the GNU Library General Public            *
# * License as published by the Free Software Foundation; either           *
# * version 2 of the License, or (at your option) any later version.       *
# *                                                                        *
# * This library is distributed in the hope that it will be useful,        *
# * but WITHOUT ANY WARRANTY; without even the implied warranty of         *
# * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU      *
# * Library General Public License for more details.                       *
# *                                                                        *
# * You should have received a copy of the GNU Library General Public      *
# * License along with this library; if not, write to the                  *
# * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,       *
# * Boston, MA  02110-1301  USA                                            *
# **************************************************************************/


# TO CUSTOMIZE INSTALLATION DIRECTORY SET THESE VARIABLES
# Note:
#  WITH SOME MORE WORK WE CAN USE VARIABLES PASSED TO MAKE LIKE THAT
#  in pro DEFINES += UNIX_RESOURCE_PATH=\"$(QXMLEDIT_DATADIR)\"
#  and calling make QXMLEDIT_DATADIR=/usr/share/qxmledit

# Additional resources not included with this script:
#.desktop file in: install_scripts/environment/desktop/QXmlEdit.desktop
#Icon in: install_scripts/environment/icon/qxmledit.png


############################ BEGIN INSTALLATION FOLDERS DECLARATION ###########################################

#message(QXMLEDIT_INST_DATA_DIR = $$(QXMLEDIT_INST_DATA_DIR))
#message(QXMLEDIT_INST_DIR = $$(QXMLEDIT_INST_DIR))
#message(QXMLEDIT_INST_DOC_DIR = $$(QXMLEDIT_INST_DOC_DIR))
#message(QXMLEDIT_INST_LIB_DIR = $$(QXMLEDIT_INST_LIB_DIR))
#message(QXMLEDIT_INST_TRANSLATIONS_DIR = $$(QXMLEDIT_INST_TRANSLATIONS_DIR))
#message(QXMLEDIT_UNIX_LOWERCASE_NAME = $$(QXMLEDIT_UNIX_LOWERCASE_NAME))


INST_DATA_DIR=$$(QXMLEDIT_INST_DATA_DIR)
isEmpty(INST_DATA_DIR) {
    INST_DATA_DIR = /opt/qxmledit
}
INST_DATA_DIR=$$(QXMLEDIT_INST_DATA_DIR)
isEmpty(INST_DATA_DIR) {
    INST_DATA_DIR = /opt/qxmledit
}

INST_DIR=$$(QXMLEDIT_INST_DIR)
isEmpty(INST_DIR) {
    INST_DIR = /opt/qxmledit
}

INST_DOC_DIR=$$(QXMLEDIT_INST_DOC_DIR)
isEmpty(INST_DOC_DIR) {
    INST_DOC_DIR = /opt/qxmledit
}

INST_LIB_DIR=$$(QXMLEDIT_INST_LIB_DIR)
isEmpty(INST_LIB_DIR) {
    INST_LIB_DIR = /opt/qxmledit
}

INST_TRANSLATIONS_DIR=$$(QXMLEDIT_INST_TRANSLATIONS_DIR)
isEmpty(INST_TRANSLATIONS_DIR) {
    INST_TRANSLATIONS_DIR=$$INST_DATA_DIR/translations
}

USE_QWTPLOT=$$(QXMLEDIT_USE_QWTPLOT)
isEmpty(USE_QWTPLOT) {
    USE_QWTPLOT="N"
}

TARGET_NAME_UNIXSTYLE=$$(QXMLEDIT_UNIX_LOWERCASE_NAME)

############################ END INSTALLATION FOLDERS DECLARATION #############################################

include("version.pri")

#default value for the unix/Linux target name
TARGET_NAME_UNIXSTYLE_DEFAULT=""

unix:!macx: {
   TARGET_NAME_UNIXSTYLE_DEFAULT="1"
}

equals(TARGET_NAME_UNIXSTYLE, "") {
    TARGET_NAME_UNIXSTYLE = $$TARGET_NAME_UNIXSTYLE_DEFAULT
}

TEMPLATE = app

DESTDIR = ../build

LANGUAGE = C++
RESOURCES = risorse.qrc
CONFIG += qt \
    warn_on


greaterThan(QT_MAJOR_VERSION, 4) {
    QT       += printsupport gui widgets core
}


greaterThan(QT_MAJOR_VERSION, 4) {
win32 {
    DEFINES += "_NO_W32_PSEUDO_MODIFIERS"
    DEFINES += "NOGDI"
}
}

macx: {
    QT       += macextras
}

equals(TARGET_NAME_UNIXSTYLE, "1") {
    TARGET = qxmledit
}

win32-msvc2010 {

} else {
    QMAKE_CXXFLAGS += -Wall
    QMAKE_CXXFLAGS +=-Werror
}

lessThan(QT_MAJOR_VERSION, 5) {
    QMAKE_CXXFLAGS +=-Wno-unused-local-typedefs
}


# TODO data files not installed
# DATADIR = $$PREFIX/share/qxmledit
# DEFINES += DATADIR=\\\"$$DATADIR\\\"
#CONFIG += debug
#CONFIG += release

############ CONFIGURATION SENT TO THE PROGRAM ############

CONFIG += precompile_header
PRECOMPILED_HEADER  = precompiled_app.h

# translations folder (inside the resources folder).
DEFINES += TRANLASTION_DIR=translations


HEADERS = precompiled_app.h \
    mainwindow.h \
    globals/includes/xmlEdit.h \
    applicationdata.h \
    preferreddirs.h \
    qxmledit.h \
    validatormessagehandler.h \
    texteditutils.h \
    snippet.h \
    snippethandler.h \
    editsnippet.h \
    snippet_interface.h \
    test.h \
    paths.h \
    xsaxhandler.h \
    searchinfiles.h \
    scansax.h \
    xmlutils.h \
    aboutdialog.h \
    authorinfo.h \
    schemavalidator.h \
    schemachooser.h \
    SchemaInterface.h \
    configurationdialog.h \
    welcomedialog.h \
    config/configurestyle.h \
    config/configvalidation.h \
    config/configurationgeneraloptions.h \
    widgets/columnarview.h \
    services/loghandler.h \
    framework/include/log.h \
    config/configuresessionswidget.h \
    StartParams.h \
    base64dialog.h \
    uiservices.h \
    charencodingdialog.h \
    appconfig.h \
    widgets/attrfilterstatus.h \
    filter/attributefiltermanagement.h \
    filter/attributeprofilemgmtdialog.h \
    filter/attributefilterdataaccess.h \
    sessions/data_access/model/attrfilterprofile.h \
    sessions/data_access/model/attrfilterdetail.h \
    filter/fakeattributefilterdataaccess.h \
    filter/attributefilterdetaildialog.h \
    config/configureeditmodesdialog.h \
    tipsaboutvisualappearance.h \
    config/configurexmlmanagementdialog.h \
    globals/includes/data/GenericPersistentData.h \
    globals/includes/data/DataInterface.h \
    qxmleditapplication.h \
    config/configureeditorcolors.h \
    framework/include/Notifier.h \
    licensedialog.h \
    modules/anonymize/anonymizedialog.h \
    mainwndcontroller.h \
    modules/anonymize/anonadvdialog.h \
    modules/anonymize/anonaddexcelementdialog.h \
    modules/anonymize/anonattrexcdialog.h \
    modules/anonymize/anonprofilemanager.h \
    modules/anonymize/anonprofiledialog.h \
    modules/anonymize/anoneditprofiledialog.h \
    modules/anonymize/anonimyzebatchdialog.h \
    modules/anonymize/anonsettingwidget.h \
    precompiled_app.h \
    qxmeditmetainfo.h \
    infodialog.h

SOURCES = \
    main.cpp \
    mainwindow.cpp \
    applicationdata.cpp \
    services/loghandler.cpp \
    preferreddirs.cpp \
    snippet.cpp \
    snippethandler.cpp \
    editsnippet.cpp \
    searchinfiles.cpp \
    scansax.cpp \
    aboutdialog.cpp \
    AboutData.cpp \
    schemachooser.cpp \
    configurationdialog.cpp \
    welcomedialog.cpp \
    compare.cpp \
    config/configurationgeneraloptions.cpp \
    config/configurestyle.cpp \
    config/configvalidation.cpp \
    widgets/columnarview.cpp \
    config/configuresessionswidget.cpp \
    base64dialog.cpp \
    uiservices.cpp \
    charencodingdialog.cpp \
    appconfig.cpp \
    widgets/attrfilterstatus.cpp \
    filter/attributefiltermanagement.cpp \
    filter/attributeprofilemgmtdialog.cpp \
    filter/attributefilterdataaccess.cpp \
    filter/fakeattributefilterdataaccess.cpp \
    filter/attributefilterdetaildialog.cpp \
    config/configureeditmodesdialog.cpp \
    tipsaboutvisualappearance.cpp \
    config/configurexmlmanagementdialog.cpp \
    mainutils.cpp \
    qxmleditapplication.cpp \
    config/configureeditorcolors.cpp \
    licensedialog.cpp \
    modules/anonymize/anonymizedialog.cpp \
    mainwndcontroller.cpp \
    modules/anonymize/anonadvdialog.cpp \
    modules/anonymize/anonaddexcelementdialog.cpp \
    modules/anonymize/anonattrexcdialog.cpp \
    modules/anonymize/anonprofilemanager.cpp \
    modules/anonymize/anonprofiledialog.cpp \
    modules/anonymize/anoneditprofiledialog.cpp \
    modules/anonymize/anonimyzebatchdialog.cpp \
    modules/anonymize/anonsettingwidget.cpp \
    infodialog.cpp

FORMS = MainWindow.ui \
    configoptions.ui \
    configurationdialog.ui \
    preferreddirs.ui \
    snippethandler.ui \
    editsnippet.ui \
    searchinfiles.ui \
    aboutdialog.ui \
    schemachooser.ui \
    welcomedialog.ui \
    widgets/columnarview.ui \
    config/configurationgeneraloptions.ui \
    config/configurestyle.ui \
    config/configvalidation.ui \
    config/configuresessionswidget.ui \
    base64dialog.ui \
    charencodingdialog.ui \
    widgets/attrfilterstatus.ui \
    filter/attributeprofilemgmtdialog.ui \
    filter/attributefilterdetaildialog.ui \
    config/configureeditmodesdialog.ui \
    tipsaboutvisualappearance.ui \
    config/configurexmlmanagementdialog.ui \
    config/configureeditorcolors.ui \
    licensedialog.ui \
    modules/anonymize/anonymizedialog.ui \
    modules/anonymize/anonadvdialog.ui \
    modules/anonymize/anonaddexcelementdialog.ui \
    modules/anonymize/anonattrexcdialog.ui \
    modules/anonymize/anonprofiledialog.ui \
    modules/anonymize/anoneditprofiledialog.ui \
    modules/anonymize/anonimyzebatchdialog.ui \
    modules/anonymize/anonsettingwidget.ui \
    infodialog.ui

INCLUDEPATH += .
INCLUDEPATH += sessions/include
INCLUDEPATH += framework/include
INCLUDEPATH += globals/includes

QT += xml svg network sql
#QT += declarative
QT += xmlpatterns

# object files
OBJECTS_DIR = ../build/app/obj
MOC_DIR = ../build/app/moc
UI_DIR = ../build/app/ui
UI_HEADERS_DIR = ../build/app/ui/include
UI_SOURCES_DIR = ../build/app/ui/src
RCC_DIR = ../build/app/rcc
TRANSLATIONS = \
   languages_app/QXmlEdit_cs.ts
TRANSL = \
   languages_app/QXmlEdit_cs.qm


target.path = $$INST_DIR
translationsfiles.path = $$INST_TRANSLATIONS_DIR
translationsfiles.files = $$TRANSL

INSTALLS += target translationsfiles

ICON = images/qxmledit.icns
win32:RC_FILE = win.rc
os2:RC_FILE = os2.rc

macx:QMAKE_INFO_PLIST    = QXmlEdit.plist

styles.path = $$INST_DATA_DIR
styles.files = data/sample.style
snippets.path = $$INST_DATA_DIR/snippets
snippets.files = data/snippets/{6d11b8d1-e285-46b2-8375-79e17cab9862}.xml \
    data/snippets/{b3303cb3-8537-46d0-943b-cf898cc93b3f}.xml \
    data/snippets/{bd4984f5-107e-48ca-9780-c263ff1aa58d}.xml \
    data/snippets/{d78f4e09-4003-4178-adec-134a7b996d6e}.xml \
    data/snippets/{e40792fb-16de-4418-9320-4feaa92c28a3}.xml \
    data/snippets/{edc60671-0ae0-401b-989d-5d0b82976bce}.xml \
    data/snippets/{f6d7ebdd-c505-4a6a-8a16-f7c99581a995}.xml
manual.path = $$INST_DOC_DIR
manual.files = ../doc/QXmlEdit_manual.pdf

desktopInfo.path = $$INST_DATA_DIR
desktopInfo.files = ../install_scripts/environment/desktop/QXmlEdit.desktop \
    ../install_scripts/environment/desktop/QXmlEdit.appdata.xml

# resources are defined in paths.h
unix:!macx:DEFINES += UNIX_RESOURCES

DEFINES += UNIX_RESOURCE_PATH=$$INST_DATA_DIR
DEFINES += UNIX_DOC_PATH=$$INST_DOC_DIR
unix:INSTALLS += snippets
unix:INSTALLS += styles
unix:INSTALLS += manual
unix:INSTALLS += desktopInfo

OTHER_FILES += \
    resources/test.xsd \
    ../doc/XsdEditor_design.txt \
    ../TODO \
    ../NEWS \
    QXmlEdit.plist \
    resources/data/unicodeChars.xml \
    version.pri

INCLUDEPATH += $$PWD
DEPENDPATH += $$PWD

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../build/lib/release/ -L$$OUT_PWD/../build -lQXmlEditWidget
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../build/lib/debug/ -L$$OUT_PWD/../build -lQXmlEditWidget
else:symbian: LIBS += -lQXmlEditWidget
else:macx: LIBS += -L$(DESTDIR) -lQXmlEditWidget
else:unix: LIBS += -L$$OUT_PWD/../build/ -lQXmlEditWidget
else:os2: LIBS += -L..\build -lQXmlEdtW

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../build/lib/release/ -L$$OUT_PWD/../build -lQXmlEditSessions
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../build/lib/debug/ -L$$OUT_PWD/../build -lQXmlEditSessions
else:symbian: LIBS += -lQXmlEditSessions
else:macx: LIBS += -L$(DESTDIR) -lQXmlEditSessions
else:unix: LIBS += -L$$OUT_PWD/../build/ -lQXmlEditSessions
else:os2: LIBS += -L..\build -lQXEdtSes

contains(USE_QWTPLOT, Y) {
    QT += opengl
    LIBS += -lqwtplot3d-qt4
    DEFINES += QWT_PLOT3D
    #LIBS += -L$$OUT_PWD/../../../qwtplot/qwtplot3d/lib -lqwtplot3d
}



