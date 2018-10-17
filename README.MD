Board templates for ChibiOS RT/NIL
==================================

In most cases you'll be able to use Configuration Wizard from ChibiStudio that allows you to generate header and implementation (and make-) files from within Eclipse.

Original board templates and schemas reside in branch chibistudio_trunk of ChibiOS repository (Git mirror git@github.com:ChibiOS/ChibiOS.git) under the path of ChibiOS/chibios_config_wizard/resources/gencfg/.

This branch has not been updated for a while, so the best way to get new templates is to copy them from ChibiStudio: download the last version and copy ChibiStudio/chibios<release>/tools/ftl/* to chibios-board-templates/gencfg/.

Supported devices
-----------------

Currently the following families of STM32 microcontrollers are supported:

* stm32f0xx
* stm32f1xx
* stm32f3xx
* stm32f4xx
* stm32f7xx
* stm32h7xx
* stm32l0xx
* stm32l1xx
* stm32l4xx

How-to
------

Assuming you have [Freemarker template engine](https://freemarker.apache.org/freemarkerdownload.html) on your path, simply run example/stm32f103cb.bat, that's it! You'll get a new directory created.
