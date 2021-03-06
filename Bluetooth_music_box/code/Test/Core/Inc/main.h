/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2021 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32l4xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define IN_LEFT_Pin GPIO_PIN_0
#define IN_LEFT_GPIO_Port GPIOA
#define IN_RIGHT_Pin GPIO_PIN_1
#define IN_RIGHT_GPIO_Port GPIOA
#define LCD_RST_Pin GPIO_PIN_4
#define LCD_RST_GPIO_Port GPIOA
#define BATTERY_Pin GPIO_PIN_0
#define BATTERY_GPIO_Port GPIOB
#define TOUCH_CS_Pin GPIO_PIN_1
#define TOUCH_CS_GPIO_Port GPIOB
#define BACKLIGHT_Pin GPIO_PIN_2
#define BACKLIGHT_GPIO_Port GPIOB
#define TOUCH_IRQ_Pin GPIO_PIN_10
#define TOUCH_IRQ_GPIO_Port GPIOB
#define LCD_CS_Pin GPIO_PIN_11
#define LCD_CS_GPIO_Port GPIOB
#define LCD_DC_Pin GPIO_PIN_12
#define LCD_DC_GPIO_Port GPIOB
#define EVENT_Pin GPIO_PIN_14
#define EVENT_GPIO_Port GPIOB
#define WAKE_Pin GPIO_PIN_15
#define WAKE_GPIO_Port GPIOB
#define MODE_Pin GPIO_PIN_8
#define MODE_GPIO_Port GPIOA
/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
