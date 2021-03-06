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
[@pp.changeOutputFile name="board.c" /]
/*
[@license.EmitLicenseAsText /]
*/

/*
 * This file has been automatically generated using ChibiStudio board
 * generator plugin. Do not edit manually.
 */

[#list doc1.board.headers.header as header]
#include "${header[0]?string?trim}"
[/#list]
#include "hal.h"

/*===========================================================================*/
/* Driver local definitions.                                                 */
/*===========================================================================*/

/*===========================================================================*/
/* Driver exported variables.                                                */
/*===========================================================================*/

/*===========================================================================*/
/* Driver local variables and types.                                         */
/*===========================================================================*/

#if HAL_USE_PAL || defined(__DOXYGEN__)
/**
 * @brief   PAL setup.
 * @details Digital I/O ports static configuration as defined in @p board.h.
 *          This variable is used by the HAL when initializing the PAL driver.
 */
const PALConfig pal_default_config = {
  {VAL_GPIOA_ODR, VAL_GPIOA_CRL, VAL_GPIOA_CRH},
  {VAL_GPIOB_ODR, VAL_GPIOB_CRL, VAL_GPIOB_CRH},
  {VAL_GPIOC_ODR, VAL_GPIOC_CRL, VAL_GPIOC_CRH},
  {VAL_GPIOD_ODR, VAL_GPIOD_CRL, VAL_GPIOD_CRH},
#if STM32_HAS_GPIOE
  {VAL_GPIOE_ODR, VAL_GPIOE_CRL, VAL_GPIOE_CRH},
#endif
#if STM32_HAS_GPIOF
  {VAL_GPIOF_ODR, VAL_GPIOF_CRL, VAL_GPIOF_CRH},
#endif
#if STM32_HAS_GPIOG
  {VAL_GPIOG_ODR, VAL_GPIOG_CRL, VAL_GPIOG_CRH},
#endif
#if STM32_HAS_GPIOH
  {VAL_GPIOH_ODR, VAL_GPIOH_CRL, VAL_GPIOH_CRH},
#endif
#if STM32_HAS_GPIOI
  {VAL_GPIOI_ODR, VAL_GPIOI_CRL, VAL_GPIOI_CRH},
#endif
#if STM32_HAS_GPIOJ
  {VAL_GPIOJ_ODR, VAL_GPIOJ_CRL, VAL_GPIOJ_CRH},
#endif
#if STM32_HAS_GPIOK
  {VAL_GPIOK_ODR, VAL_GPIOK_CRL, VAL_GPIOK_CRH}
#endif
};

#endif

/*===========================================================================*/
/* Driver local functions.                                                   */
/*===========================================================================*/

/*===========================================================================*/
/* Driver interrupt handlers.                                                */
/*===========================================================================*/

/*===========================================================================*/
/* Driver exported functions.                                                */
/*===========================================================================*/

/**
 * @brief   Early initialization code.
[#if doc1.board.configuration_settings.hal_version[0]?trim != "4.0.x"]
 * @details GPIO ports and system clocks are initialized before everything
 *          else.
[#else]
 * @details System clocks are initialized before everything else.
[/#if]
 */
void __early_init(void) {

  stm32_clock_init();
[#if doc1.board.board_functions.__early_init[0]??]
  ${doc1.board.board_functions.__early_init[0]}
[/#if]
}

#if HAL_USE_SDC || defined(__DOXYGEN__)
/**
 * @brief   SDC card detection.
 */
bool sdc_lld_is_card_inserted(SDCDriver *sdcp) {
[#if doc1.board.board_functions.sdc_lld_is_card_inserted[0]??]
${doc1.board.board_functions.sdc_lld_is_card_inserted[0]}
[#else]

  (void)sdcp;
  /* TODO: Fill the implementation.*/
  return true;
[/#if]
}

/**
 * @brief   SDC card write protection detection.
 */
bool sdc_lld_is_write_protected(SDCDriver *sdcp) {
[#if doc1.board.board_functions.sdc_lld_is_write_protected[0]??]
${doc1.board.board_functions.sdc_lld_is_write_protected[0]}
[#else]

  (void)sdcp;
  /* TODO: Fill the implementation.*/
  return false;
[/#if]
}
#endif /* HAL_USE_SDC */

#if HAL_USE_MMC_SPI || defined(__DOXYGEN__)
/**
 * @brief   MMC_SPI card detection.
 */
bool mmc_lld_is_card_inserted(MMCDriver *mmcp) {
[#if doc1.board.board_functions.mmc_lld_is_card_inserted[0]??]
${doc1.board.board_functions.mmc_lld_is_card_inserted[0]}
[#else]

  (void)mmcp;
  /* TODO: Fill the implementation.*/
  return true;
[/#if]
}

/**
 * @brief   MMC_SPI card write protection detection.
 */
bool mmc_lld_is_write_protected(MMCDriver *mmcp) {
[#if doc1.board.board_functions.mmc_lld_is_write_protected[0]??]
${doc1.board.board_functions.mmc_lld_is_write_protected[0]}
[#else]

  (void)mmcp;
  /* TODO: Fill the implementation.*/
  return false;
[/#if]
}
#endif

/**
 * @brief   Board-specific initialization code.
 * @todo    Add your board-specific code, if any.
 */
void boardInit(void) {

[#if doc1.board.board_functions.boardInit[0]??]
  ${doc1.board.board_functions.boardInit[0]}
[/#if]
}
