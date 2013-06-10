# This is a dummy .pro file used to extract some aspects of the used configuration and feed them to gyp
# We want the gyp generation step to happen after all the other config steps. For that we need to prepend
# our gyp_generator.prf feature to the CONFIG variable since it is processed backwards
CONFIG = gyp_generator $$CONFIG
GYPINCLUDES += ../blinq.gypi

TEMPLATE = lib
CONFIG += static

TARGET = blinq_shared

# Defining keywords such as 'signal' clashes with the chromium code base.
DEFINES += QT_NO_KEYWORDS

# We need a way to tap into gyp´s Debug vs. Release configuration
PER_CONFIG_DEFINES = BLINQ_PROCESS_PATH=\\\"$$getOutDir()/%config/$$BLINQ_PROCESS_NAME\\\"

# Keep Skia happy
CONFIG(release, debug|release): DEFINES += NDEBUG

QT += widgets quick

SOURCES = \
        backing_store_qt.cpp \
        render_widget_host_view_qt.cpp \
        web_event_factory.cpp \
        native_view_qt.cpp

HEADERS = \
        backing_store_qt.h \
        native_view_container_qt.h \
        native_view_qt.h \
        render_widget_host_view_qt.h \
        web_event_factory.h
