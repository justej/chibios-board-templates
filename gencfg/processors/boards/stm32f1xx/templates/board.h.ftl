[#ftl]
[#--
    ChibiOS - Copyright (C) 2006..2018 Giovanni Di Sirio.

    This file is part of ChibiOS.

    ChibiOS is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 3 of the License, or
    (at your option) any later version.

    ChibiOS is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
  --]
[@pp.dropOutputFile /]
[#import "/@lib/libutils.ftl" as utils /]
[#import "/@lib/liblicense.ftl" as license /]
[@pp.changeOutputFile name="board.h" /]
/*
[@license.EmitLicenseAsText /]
*/

/*
 * This file has been automatically generated using ChibiStudio board
 * generator plugin. Do not edit manually.
 */

#ifndef BOARD_H
#define BOARD_H

/*===========================================================================*/
/* Driver constants.                                                         */
/*===========================================================================*/

/*
 * Setup for ${doc1.board.board_name[0]} board.
 */

/*
 * Board identifier.
 */
#define BOARD_${doc1.board.board_id[0]}
#define BOARD_NAME                  "${doc1.board.board_name[0]}"
[#if doc1.board.ethernet_phy[0]??]

/*
 * Ethernet PHY type.
 */
#define BOARD_PHY_ID                ${doc1.board.ethernet_phy.identifier[0]}
[#if doc1.board.ethernet_phy.bus_type[0]?string == "RMII"]
#define BOARD_PHY_RMII
[/#if]
[/#if]
[#if doc1.board.usb_phy[0]?? && doc1.board.usb_phy.bus_type[0]?string == "ULPI"]

/*
 * The board has an ULPI USB PHY.
 */
#define BOARD_OTG2_USES_ULPI
[/#if]

/*
 * Board oscillators-related settings.
[#if doc1.board.clocks.@LSEFrequency[0]?number == 0]
 * NOTE: LSE not fitted.
[/#if]
[#if doc1.board.clocks.@HSEFrequency[0]?number == 0]
 * NOTE: HSE not fitted.
[/#if]
 */
#if !defined(STM32_LSECLK)
#define STM32_LSECLK                ${doc1.board.clocks.@LSEFrequency[0]}U
#endif

[#if doc1.board.clocks.@LSEBypass[0]?string == "true"]
#define STM32_LSE_BYPASS

[/#if]
#if !defined(STM32_HSECLK)
#define STM32_HSECLK                ${doc1.board.clocks.@HSEFrequency[0]}U
#endif

[#if doc1.board.clocks.@HSEBypass[0]?string == "true"]
#define STM32_HSE_BYPASS

[/#if]

/*
 * MCU type as defined in the ST header.
 */
#define ${doc1.board.subtype[0]}

/*
 * IO pins assignments.
 */
[#list doc1.board.ports.* as port]
  [#assign port_name = port?node_name?upper_case /]
  [#list port.* as pin]
    [#assign names = pin.@ID[0]?string?word_list /]
    [#if names?size == 0]
      [#assign pin_name = pin?node_name?upper_case /]
#define ${(port_name + "_" + pin_name)?right_pad(27, " ")} ${pin_index?string}U
    [#else]
      [#list names as name]
#define ${(port_name + "_" + name)?right_pad(27, " ")} ${pin_index?string}U
      [/#list]
    [/#if]
  [/#list]

[/#list]
/*
 * IO lines assignments.
 */
[#list doc1.board.ports.* as port]
  [#assign port_name = port?node_name?upper_case /]
  [#list port.* as pin]
    [#assign names = pin.@ID[0]?string?word_list /]
    [#if names?size > 0]
      [#list names as name]
#define LINE_${name?right_pad(22, " ")} PAL_LINE(${port_name}, ${pin_index?string}U)
      [/#list]
    [/#if]
  [/#list]
[/#list]

/*===========================================================================*/
/* Driver pre-compile time settings.                                         */
/*===========================================================================*/

/*===========================================================================*/
/* Derived constants and error checks.                                       */
/*===========================================================================*/

/*===========================================================================*/
/* Driver data structures and types.                                         */
/*===========================================================================*/

/*===========================================================================*/
/* Driver macros.                                                            */
/*===========================================================================*/

/*
 * I/O ports initial setup, this configuration is established soon after reset
 * in the initialization code.
 * Please refer to the STM32 Reference Manual for details.
 */
#define PIN_MODE_INPUT(n)               (0U << (((n) % 8) * 4U))
#define PIN_MODE_OUTPUT_MINIMUM(n)      (2U << (((n) % 8) * 4U))
#define PIN_MODE_OUTPUT_MEDIUM(n)       (1U << (((n) % 8) * 4U))
#define PIN_MODE_OUTPUT_MAXIMUM(n)      (3U << (((n) % 8) * 4U))
#define PIN_CONF_OUTPUT_PUSHPULL(n)     (0U << (((n) % 8) * 4U))
#define PIN_CONF_OUTPUT_OPENDRAIN(n)    (4U << (((n) % 8) * 4U))
#define PIN_CONF_ALTERNATE_PUSHPULL(n)  (8U << (((n) % 8) * 4U))
#define PIN_CONF_ALTERNATE_OPENDRAIN(n) (12U << (((n) % 8) * 4U))
#define PIN_CONF_ANALOG_INPUT(n)        (0U << (((n) % 8) * 4U))
#define PIN_CONF_FLOATING_INPUT(n)      (4U << (((n) % 8) * 4U))
#define PIN_CONF_PULLED_INPUT(n)        (8U << (((n) % 8) * 4U))
#define PIN_ODR_LOW(n)                  (0U << (n))
#define PIN_ODR_HIGH(n)                 (1U << (n))

[#list doc1.board.ports.* as port]
  [#assign port_name = port?node_name?upper_case /]
/*
 * ${port_name} setup:
 *
  [#-- Generating pin descriptions inside the comment.--]
  [#list port.* as pin]
    [#assign pin_name = pin?node_name?upper_case /]
    [#assign name = pin.@ID[0]?string?trim /]
    [#if name?length == 0]
      [#assign name = pin_name /]
    [/#if]
    [#assign mode = pin.@Mode[0] /]
    [#assign speed = pin.@Speed[0] /]
    [#assign level = pin.@Level[0] /]
    [#if mode == "PushPullOutput"]
      [#assign desc = "output push-pull " + speed /]
    [#elseif mode == "OpenDrainOutput"]
      [#assign desc = "output open-drain " + speed /]
    [#elseif mode == "AlternateFunctionPushPull" ]
      [#assign desc = "alternate push-pull " + speed /]
    [#elseif mode == "AlternateFunctionOpenDrain" ]
      [#assign desc = "alternate open-drain " + speed /]
    [#elseif mode == "AnalogInput"]
      [#assign desc = "analog" /]
    [#elseif mode == "FloatingInput"]
      [#assign desc = "input floating" /]
    [#else]
      [#-- PulledInput --]
      [#if level == "Low" ]
        [#assign resistor = "pull-down" /]
      [#else]
        [#assign resistor = "pull-up" /]
      [/#if]
      [#assign desc = "input " + resistor /]
    [/#if]
 * P${(port?node_name[4..] + pin_index?string)?right_pad(3, " ")} - ${name?right_pad(26, " ")}(${desc?lower_case}).
  [/#list]
 */
  [#--
    -- Generating CRL/CRH register value.
    --]
  [#list port.* as pin]
    [#assign names = pin.@ID[0]?string?word_list /]
    [#if names?size == 0]
      [#assign name = pin?node_name?upper_case /]
    [#else]
      [#assign name = names[0] /]
    [/#if]
    [#assign mode = pin.@Mode[0] /]
    [#assign speed = pin.@Speed[0]?string?upper_case /]
    [#if mode == "PushPullOutput"]
      [#assign out_mode = "PIN_MODE_OUTPUT_" + speed + "(" + port_name + "_" + name + ")" /]
      [#assign out_conf = "PIN_CONF_OUTPUT_PUSHPULL(" + port_name + "_" + name + ")" /]
    [#elseif mode == "OpenDrainOutput"]
      [#assign out_mode = "PIN_MODE_OUTPUT_" + speed + "(" + port_name + "_" + name + ")" /]
      [#assign out_conf = "PIN_CONF_OUTPUT_OPENDRAIN(" + port_name + "_" + name + ")" /]
    [#elseif mode == "AlternateFunctionPushPull"]
      [#assign out_mode = "PIN_MODE_OUTPUT_" + speed + "(" + port_name + "_" + name + ")" /]
      [#assign out_conf = "PIN_CONF_ALTERNATE_PUSHPULL(" + port_name + "_" + name + ")" /]
    [#elseif mode == "AlternateFunctionOpenDrain"]
      [#assign out_mode = "PIN_MODE_OUTPUT_" + speed + "(" + port_name + "_" + name + ")" /]
      [#assign out_conf = "PIN_CONF_ALTERNATE_OPENDRAIN(" + port_name + "_" + name + ")" /]
    [#elseif mode == "AnalogInput"]
      [#assign out_mode = "PIN_MODE_INPUT(" + port_name + "_" + name + ")" /]
      [#assign out_conf = "PIN_CONF_ANALOG_INPUT(" + port_name + "_" + name + ")" /]
    [#elseif mode == "FloatingInput"]
      [#assign out_mode = "PIN_MODE_INPUT(" + port_name + "_" + name + ")" /]
      [#assign out_conf = "PIN_CONF_FLOATING_INPUT(" + port_name + "_" + name + ")" /]
    [#else]
      [#assign out_mode = "PIN_MODE_INPUT(" + port_name + "_" + name + ")" /]
      [#assign out_conf = "PIN_CONF_PULLED_INPUT(" + port_name + "_" + name + ")" /]
    [/#if]
    [#if pin_index == 0]
      [#assign line = "#define VAL_" + port_name + "_CRL               (" + out_mode + " | " + out_conf /]
    [#elseif pin_index == 8]
      [#assign line = "#define VAL_" + port_name + "_CRH               (" + out_mode + " | " + out_conf /]
    [#else]
      [#assign line = "                                     " + out_mode + " | " + out_conf /]
    [/#if]
    [#if pin_index < 7 || (pin_index > 7 && pin_index < 15) ]
${(line + " |")?right_pad(76, " ") + "\\"}
    [#else]
${line + ")"}
    [/#if]
  [/#list]
  [#--
    -- Generating ODR register value.
    --]
  [#list port.* as pin]
    [#assign names = pin.@ID[0]?string?word_list /]
    [#if names?size == 0]
      [#assign name = pin?node_name?upper_case /]
    [#else]
      [#assign name = names[0] /]
    [/#if]
    [#assign level = pin.@Level[0] /]
    [#if level == "Low" || level == "DoNotCare"]
      [#assign out = "PIN_ODR_LOW(" + port_name + "_" + name + ")" /]
    [#else]
      [#-- High --]
      [#assign out = "PIN_ODR_HIGH(" + port_name + "_" + name + ")" /]
    [/#if]
    [#if pin_index == 0]
      [#assign line = "#define VAL_" + port_name + "_ODR               (" + out /]
    [#else]
      [#assign line = "                                     " + out /]
    [/#if]
    [#if pin_index < 15]
${(line + " |")?right_pad(76, " ") + "\\"}
    [#else]
${line + ")"}
    [/#if]
  [/#list]

[/#list]
/*===========================================================================*/
/* External declarations.                                                    */
/*===========================================================================*/

#if !defined(_FROM_ASM_)
#ifdef __cplusplus
extern "C" {
#endif
  void boardInit(void);
#ifdef __cplusplus
}
#endif
#endif /* _FROM_ASM_ */

#endif /* BOARD_H */
