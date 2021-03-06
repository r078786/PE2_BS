/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
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
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "ili9341.h"
#include "test.h"
#include "connect.h"
#include <stdio.h>
//#include "ili9341_touch.h";
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
#define PWM_HI (38)
#define PWM_LO (19)

// LED parameters
#define NUM_BPP (3)
#define NUM_PIXELS (24)
#define NUM_BYTES (NUM_BPP * NUM_PIXELS)

//led timing calculated for 80MHz clock speed
#define WSONEH	20
#define WSONEL	11
#define WSZEROH	10
#define WSZEROL	21

//led pins
#define LEDPORT	GPIOB
#define LEDPIN	GPIO_PIN_13

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */
#define SETHIGH(x,y) ((x)->BSRR = (uint32_t)(y))
#define SETLOW(x,y) ((x)->BRR = (uint32_t)(y))
#define WSONE 	do{ SETHIGH(LEDPORT,LEDPIN); waitCycles(WSONEH); SETLOW(LEDPORT,LEDPIN); waitCycles(WSONEL);}while (0);
#define WSZERO 	do{ SETHIGH(LEDPORT,LEDPIN); waitCycles(WSZEROH); SETLOW(LEDPORT,LEDPIN); waitCycles(WSZEROL);}while (0);
/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
ADC_HandleTypeDef hadc1;
DMA_HandleTypeDef hdma_adc1;

SPI_HandleTypeDef hspi1;

TIM_HandleTypeDef htim1;
TIM_HandleTypeDef htim2;

UART_HandleTypeDef huart1;
UART_HandleTypeDef huart2;

/* USER CODE BEGIN PV */
//variables for led effects
uint8_t red=130, blue, green;

//led enable, batterijbesparing
uint8_t ENABLE_LEDS=1;

//coordinates touch
uint16_t x, y;

//battery voltage
char *Ubat;
uint8_t ready=0;
//max value voor ingelezen waarde
uint16_t testValue=0;

//pointer voor adc
uint8_t pointer[80];

//led buffer
uint8_t ledBuffer[NUM_BYTES];

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_SPI1_Init(void);
static void MX_USART1_UART_Init(void);
static void MX_ADC1_Init(void);
static void MX_USART2_UART_Init(void);
static void MX_TIM1_Init(void);
static void MX_TIM2_Init(void);
/* USER CODE BEGIN PFP */
void __attribute__((naked)) waitCycles ( unsigned long ulCount ) ;
void ledClearBuffer ( void );
void setLedColor ( uint8_t ledIndex , uint8_t r , uint8_t g , uint8_t b ) ;
void updateLed ( void ) ;
void Check_ADC ( void ) ;
void Led_Effect ( void ) ;
void LCD_DrawMenu ( void ) ;
void Check_Power ( void ) ;
/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
#include <errno.h>
#include <sys/stat.h>
#include <sys/times.h>
#include <sys/unistd.h>

int _write ( int file , char *ptr , int len )
{
    HAL_StatusTypeDef xStatus ;
    switch ( file )
    {
    	case STDOUT_FILENO: /*stdout*/
    		xStatus = HAL_UART_Transmit ( &huart1 , ( uint8_t* ) ptr , len , HAL_MAX_DELAY ) ;
    		if ( xStatus != HAL_OK )
    		{
    			errno = EIO ;
    			return -1 ;
    		}
        break ;
    	case STDERR_FILENO: /* stderr */
    		xStatus = HAL_UART_Transmit ( &huart1 , ( uint8_t* ) ptr , len , HAL_MAX_DELAY ) ;
    		if ( xStatus != HAL_OK )
    		{
    			errno = EIO;
    			return -1 ;
    		}
    	break ;
    	default:
    		errno = EBADF ;
    		return -1 ;
    }
    return len ;
}
//volatile uint8_t ready = 0;
/*void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc) //functie wordt opgeroepen als conversie klaar is (callback)
{
    // Conversion Complete & DMA Transfer Complete As Well
    // So The AD_RES Is Now Updated & Let's Move IT To The PWM CCR1
    // Update The PWM Duty Cycle With Latest ADC Conversion Result

	HAL_ADC_Stop_DMA(&hadc1); //adc stond op continuous ingesteld
	//setLedColor(1, 0, 0, 0);
	//updateLed();
	ready = 1;
//	for(int i = 0; i<20; i++){
//		printf("int%d: %d \n\r",i, pointer[i]);
//	}
//	memset(pointer,'\0',20);
//	HAL_ADC_Start_DMA(&hadc3, (uint32_t*)&pointer[0], 20);
}*/
/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_DMA_Init();
  MX_SPI1_Init();
  MX_USART1_UART_Init();
  MX_ADC1_Init();
  MX_USART2_UART_Init();
  MX_TIM1_Init();
  MX_TIM2_Init();
  /* USER CODE BEGIN 2 */
  //HAL_ADC_Start( &hadc1 );
  HAL_StatusTypeDef stat ;
  stat = HAL_ADC_Start_DMA ( &hadc1 , ( uint32_t* ) &pointer[0] , 80 ) ;
      if ( stat != HAL_OK )
      {
    	  //setLedColor ( 1 , 0 , 0 , 0 ) ; // (index, r, g, b)
    	  //updateLed ( ) ; //kleur op ledje(s) zetten
      }

      stat = HAL_TIM_Base_Start_IT ( &htim2 ) ;
      if ( stat != HAL_OK )
      {
    	  //setLedColor ( 1 , 0 , 0 , 0 ) ; // (index, g, r, b)
    	  //updateLed ( ) ; //kleur op ledje(s) zetten
      }

	  //alles initialiseren
	  ILI9341_Unselect ( ) ;
	  ILI9341_TouchUnselect ( ) ;
	  ILI9341_LCD_Init ( ) ;
	  //ILI9341_TouchSelect();

	  HAL_GPIO_WritePin ( BACKLIGHT_GPIO_Port , BACKLIGHT_Pin , GPIO_PIN_SET ) ;
	  HAL_GPIO_WritePin ( MODE_GPIO_Port , MODE_Pin , GPIO_PIN_RESET ) ;

	  LCD_FillScreen ( LCD_BLACK ) ; //"clear" screen
	  ledClearBuffer ( ) ; //inhoud buffer = cleared
	  //alle leds uit
	  for ( uint8_t i = 1 ; i<25 ; i++ )
	  {
	  		setLedColor ( i , 0 , 0 , 0 ) ;
	  		updateLed ( ) ;
	  }
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */

	//Check_ADC();
	LCD_DrawMenu ( ) ;
	Check_Power ( ) ;
	Led_Effect ( ) ;

	//Even wachten
	HAL_Delay ( 100 ) ;
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = 1;
  RCC_OscInitStruct.PLL.PLLN = 10;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV7;
  RCC_OscInitStruct.PLL.PLLQ = RCC_PLLQ_DIV2;
  RCC_OscInitStruct.PLL.PLLR = RCC_PLLR_DIV2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_4) != HAL_OK)
  {
    Error_Handler();
  }
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_USART1|RCC_PERIPHCLK_USART2
                              |RCC_PERIPHCLK_ADC;
  PeriphClkInit.Usart1ClockSelection = RCC_USART1CLKSOURCE_PCLK2;
  PeriphClkInit.Usart2ClockSelection = RCC_USART2CLKSOURCE_PCLK1;
  PeriphClkInit.AdcClockSelection = RCC_ADCCLKSOURCE_PLLSAI1;
  PeriphClkInit.PLLSAI1.PLLSAI1Source = RCC_PLLSOURCE_HSI;
  PeriphClkInit.PLLSAI1.PLLSAI1M = 1;
  PeriphClkInit.PLLSAI1.PLLSAI1N = 8;
  PeriphClkInit.PLLSAI1.PLLSAI1P = RCC_PLLP_DIV7;
  PeriphClkInit.PLLSAI1.PLLSAI1Q = RCC_PLLQ_DIV2;
  PeriphClkInit.PLLSAI1.PLLSAI1R = RCC_PLLR_DIV2;
  PeriphClkInit.PLLSAI1.PLLSAI1ClockOut = RCC_PLLSAI1_ADC1CLK;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure the main internal regulator output voltage
  */
  if (HAL_PWREx_ControlVoltageScaling(PWR_REGULATOR_VOLTAGE_SCALE1) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief ADC1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_ADC1_Init(void)
{

  /* USER CODE BEGIN ADC1_Init 0 */

  /* USER CODE END ADC1_Init 0 */

  ADC_ChannelConfTypeDef sConfig = {0};

  /* USER CODE BEGIN ADC1_Init 1 */

  /* USER CODE END ADC1_Init 1 */
  /** Common config
  */
  hadc1.Instance = ADC1;
  hadc1.Init.ClockPrescaler = ADC_CLOCK_ASYNC_DIV1;
  hadc1.Init.Resolution = ADC_RESOLUTION_8B;
  hadc1.Init.DataAlign = ADC_DATAALIGN_RIGHT;
  hadc1.Init.ScanConvMode = ADC_SCAN_DISABLE;
  hadc1.Init.EOCSelection = ADC_EOC_SINGLE_CONV;
  hadc1.Init.LowPowerAutoWait = DISABLE;
  hadc1.Init.ContinuousConvMode = DISABLE;
  hadc1.Init.NbrOfConversion = 1;
  hadc1.Init.DiscontinuousConvMode = DISABLE;
  hadc1.Init.ExternalTrigConv = ADC_EXTERNALTRIG_T2_TRGO;
  hadc1.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_RISING;
  hadc1.Init.DMAContinuousRequests = DISABLE;
  hadc1.Init.Overrun = ADC_OVR_DATA_PRESERVED;
  hadc1.Init.OversamplingMode = DISABLE;
  if (HAL_ADC_Init(&hadc1) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure Regular Channel
  */
  sConfig.Channel = ADC_CHANNEL_6;
  sConfig.Rank = ADC_REGULAR_RANK_1;
  sConfig.SamplingTime = ADC_SAMPLETIME_2CYCLES_5;
  sConfig.SingleDiff = ADC_SINGLE_ENDED;
  sConfig.OffsetNumber = ADC_OFFSET_NONE;
  sConfig.Offset = 0;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN ADC1_Init 2 */

  /* USER CODE END ADC1_Init 2 */

}

/**
  * @brief SPI1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_SPI1_Init(void)
{

  /* USER CODE BEGIN SPI1_Init 0 */

  /* USER CODE END SPI1_Init 0 */

  /* USER CODE BEGIN SPI1_Init 1 */

  /* USER CODE END SPI1_Init 1 */
  /* SPI1 parameter configuration*/
  hspi1.Instance = SPI1;
  hspi1.Init.Mode = SPI_MODE_MASTER;
  hspi1.Init.Direction = SPI_DIRECTION_2LINES;
  hspi1.Init.DataSize = SPI_DATASIZE_8BIT;
  hspi1.Init.CLKPolarity = SPI_POLARITY_LOW;
  hspi1.Init.CLKPhase = SPI_PHASE_1EDGE;
  hspi1.Init.NSS = SPI_NSS_SOFT;
  hspi1.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_32;
  hspi1.Init.FirstBit = SPI_FIRSTBIT_MSB;
  hspi1.Init.TIMode = SPI_TIMODE_DISABLE;
  hspi1.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;
  hspi1.Init.CRCPolynomial = 7;
  hspi1.Init.CRCLength = SPI_CRC_LENGTH_DATASIZE;
  hspi1.Init.NSSPMode = SPI_NSS_PULSE_ENABLE;
  if (HAL_SPI_Init(&hspi1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN SPI1_Init 2 */

  /* USER CODE END SPI1_Init 2 */

}

/**
  * @brief TIM1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM1_Init(void)
{

  /* USER CODE BEGIN TIM1_Init 0 */

  /* USER CODE END TIM1_Init 0 */

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};

  /* USER CODE BEGIN TIM1_Init 1 */

  /* USER CODE END TIM1_Init 1 */
  htim1.Instance = TIM1;
  htim1.Init.Prescaler = 0;
  htim1.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim1.Init.Period = 60-1;
  htim1.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim1.Init.RepetitionCounter = 0;
  htim1.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_Base_Init(&htim1) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  if (HAL_TIM_ConfigClockSource(&htim1, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterOutputTrigger2 = TIM_TRGO2_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim1, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM1_Init 2 */

  /* USER CODE END TIM1_Init 2 */

}

/**
  * @brief TIM2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM2_Init(void)
{

  /* USER CODE BEGIN TIM2_Init 0 */

  /* USER CODE END TIM2_Init 0 */

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};

  /* USER CODE BEGIN TIM2_Init 1 */

  /* USER CODE END TIM2_Init 1 */
  htim2.Instance = TIM2;
  htim2.Init.Prescaler = 10000;
  htim2.Init.CounterMode = TIM_COUNTERMODE_DOWN;
  htim2.Init.Period = 100;
  htim2.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim2.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_ENABLE;
  if (HAL_TIM_Base_Init(&htim2) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  if (HAL_TIM_ConfigClockSource(&htim2, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_UPDATE;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim2, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM2_Init 2 */

  /* USER CODE END TIM2_Init 2 */

}

/**
  * @brief USART1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART1_UART_Init(void)
{

  /* USER CODE BEGIN USART1_Init 0 */

  /* USER CODE END USART1_Init 0 */

  /* USER CODE BEGIN USART1_Init 1 */

  /* USER CODE END USART1_Init 1 */
  huart1.Instance = USART1;
  huart1.Init.BaudRate = 9600;
  huart1.Init.WordLength = UART_WORDLENGTH_8B;
  huart1.Init.StopBits = UART_STOPBITS_1;
  huart1.Init.Parity = UART_PARITY_NONE;
  huart1.Init.Mode = UART_MODE_TX_RX;
  huart1.Init.HwFlowCtl = UART_HWCONTROL_RTS_CTS;
  huart1.Init.OverSampling = UART_OVERSAMPLING_16;
  huart1.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  huart1.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
  if (HAL_UART_Init(&huart1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART1_Init 2 */

  /* USER CODE END USART1_Init 2 */

}

/**
  * @brief USART2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART2_UART_Init(void)
{

  /* USER CODE BEGIN USART2_Init 0 */

  /* USER CODE END USART2_Init 0 */

  /* USER CODE BEGIN USART2_Init 1 */

  /* USER CODE END USART2_Init 1 */
  huart2.Instance = USART2;
  huart2.Init.BaudRate = 115200;
  huart2.Init.WordLength = UART_WORDLENGTH_8B;
  huart2.Init.StopBits = UART_STOPBITS_1;
  huart2.Init.Parity = UART_PARITY_NONE;
  huart2.Init.Mode = UART_MODE_TX_RX;
  huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart2.Init.OverSampling = UART_OVERSAMPLING_16;
  huart2.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  huart2.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
  if (HAL_UART_Init(&huart2) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART2_Init 2 */

  /* USER CODE END USART2_Init 2 */

}

/**
  * Enable DMA controller clock
  */
static void MX_DMA_Init(void)
{

  /* DMA controller clock enable */
  __HAL_RCC_DMA1_CLK_ENABLE();

  /* DMA interrupt init */
  /* DMA1_Channel1_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA1_Channel1_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Channel1_IRQn);

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOA, LCD_RST_Pin|MODE_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOB, TOUCH_CS_Pin|BACKLIGHT_Pin|LCD_CS_Pin|LCD_DC_Pin
                          |GPIO_PIN_13, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(WAKE_GPIO_Port, WAKE_Pin, GPIO_PIN_SET);

  /*Configure GPIO pin : LCD_RST_Pin */
  GPIO_InitStruct.Pin = LCD_RST_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(LCD_RST_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pins : TOUCH_CS_Pin BACKLIGHT_Pin LCD_CS_Pin LCD_DC_Pin */
  GPIO_InitStruct.Pin = TOUCH_CS_Pin|BACKLIGHT_Pin|LCD_CS_Pin|LCD_DC_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  /*Configure GPIO pin : TOUCH_IRQ_Pin */
  GPIO_InitStruct.Pin = TOUCH_IRQ_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING;
  GPIO_InitStruct.Pull = GPIO_PULLUP;
  HAL_GPIO_Init(TOUCH_IRQ_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : PB13 */
  GPIO_InitStruct.Pin = GPIO_PIN_13;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  /*Configure GPIO pin : EVENT_Pin */
  GPIO_InitStruct.Pin = EVENT_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(EVENT_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : WAKE_Pin */
  GPIO_InitStruct.Pin = WAKE_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_OD;
  GPIO_InitStruct.Pull = GPIO_PULLUP;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(WAKE_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : MODE_Pin */
  GPIO_InitStruct.Pin = MODE_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_OD;
  GPIO_InitStruct.Pull = GPIO_PULLUP;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(MODE_GPIO_Port, &GPIO_InitStruct);

}

/* USER CODE BEGIN 4 */
void __attribute__((naked)) waitCycles ( unsigned long ulCount )
{
    __asm("    subs    r0, #1\n"
          "    bne     waitCycles\n"
          "    bx      lr");
}

void ledClearBuffer ( void )
{
	memset ( ledBuffer , 0 , NUM_BYTES ) ;
}

void setLedColor ( uint8_t ledIndex , uint8_t r , uint8_t g , uint8_t b )
{
	ledIndex-- ;	//for people who ignore 0 -> suckers
	ledBuffer [ ledIndex * 3 ] = g ;
	ledBuffer [ (ledIndex * 3) + 1 ] = r ;
	ledBuffer [ (ledIndex * 3) + 2 ] = b ;
}

void updateLed ( void )
{
	uint8_t tempByte = 0x00 ;
	//time sensitive code, disable incoming interrupt requests
	__disable_irq ( ) ;
	//for every led
	for ( uint8_t i = 0 ; i < NUM_PIXELS ; i++ ) // 24 keer
	{
		//for every color
		for ( uint8_t j = 0 ; j < NUM_BPP ; j++ ) // 3 keer
		{
			tempByte = ledBuffer [ ( i * 3 ) + j ] ;
			//for every bit
			for ( uint8_t q = 0 ; q < 8 ; q++ )
			{
				if ( tempByte & ( 0x80 >> q ) )
				{
					WSONE
				}
				else
				{
					WSZERO
				}
			}
		}
	}
	__enable_irq ( ) ;
	HAL_Delay ( 1 ) ;
}

void Check_ADC()
{
	if ( ready )
	{
		Check_Power ( ) ;
		testValue = 0 ;
		//40MHz is frequentie bass
		//minstens het dubbele van gewenste frequentie gebruiken => 80
		//80MHz clock / (10.000 (prescaler) * 100 (Counter Period)) = 80Hz
		//80 samples tegen 80Hz => per seconde in deze loop komen
		for ( uint8_t i = 0 ; i < 80 ; i++ )//80 waarden binnenlezen en gemiddelde berekenen
		{
			testValue = testValue + pointer [ i ] ;
		}
		testValue = testValue / 80 ;

		//LCD_WriteString(0, 20, &testValue, Font_11x18, LCD_WHITE, LCD_BLACK);
		//waarde omzetten naar string (om op lcd te zetten)
		itoa ( testValue , pointer , 10 ) ;// 10 = decimal
		/*if(ENABLE_LEDS==1)
		{
			setLedColor( 2, 0, 0, pointer);
			updateLed();
		}
		else
		{
			for(uint8_t i = 1; i<25; i++)
			{
				setLedColor( i, 0, 0, 0);
				updateLed();
			}
		}*/
		LCD_WriteString (150 , 110 , pointer , Font_11x18 , LCD_WHITE , LCD_BLACK ) ;
		ready = 0 ;
		HAL_ADC_Start_DMA ( &hadc1 , ( uint32_t* ) &pointer [ 0 ] , 80 ) ;
	}


	// Starten van de ADC Conversie
	HAL_ADC_Start ( &hadc1 ) ;
	// Wachten tot de conversie gedaan is
	// timeout=1mS maar kijken we niet na
	HAL_ADC_PollForConversion ( &hadc1 , 1 ) ;
	// ADC waarde inlezen en printen
	uint16_t result = HAL_ADC_GetValue ( &hadc1 ) ;
	//printf("result = %d\r\n", result);
	Check_Power ( ) ;
}

void Led_Effect()
{
	if ( ENABLE_LEDS == 1 )
	{
		for (/*var already declared globally*/; red >= 0 , blue < 130 ; red-- , blue++ )
		{
			for ( uint8_t led_row = 1 ; led_row <= 12 ; led_row = led_row + 2 )
			{
				if ( ENABLE_LEDS == 1 )
				{
					setLedColor ( led_row , red , 0 , blue ) ;
					setLedColor ( led_row + 1 , red , 0 , blue ) ;
					setLedColor ( led_row + 12, red , 0 , blue ) ;
					setLedColor ( led_row + 13, red , 0 , blue ) ;
					updateLed ( ) ;
					Check_Power ( ) ;
					HAL_Delay ( 1 ) ;
				}
				else
				{
					for ( uint8_t i = 1 ; i < 25 ; i++ )
					{
						setLedColor ( i , 0 , 0 , 0 ) ;
						updateLed ( ) ;
					}
				}
			}
		}
		Check_Power ( ) ;

		for (/*var already declared globally*/; blue >= 0 , green < 130 ; blue-- , green++ )
		{
			for ( uint8_t led_row = 1 ; led_row <= 12 ; led_row = led_row + 2 )
			{
				if ( ENABLE_LEDS == 1 )
				{
					setLedColor ( led_row , 0 , green , blue ) ;
					setLedColor ( led_row + 1 , 0 , green , blue ) ;
					setLedColor ( led_row + 12 , 0 , green , blue ) ;
					setLedColor ( led_row + 13 , 0 , green , blue ) ;
					updateLed ( ) ;
					Check_Power ( ) ;
					HAL_Delay ( 1 ) ;
				}
				else
				{
					Check_Power ( ) ;
					for ( uint8_t i = 1 ; i < 25 ; i++ )
					{
						setLedColor ( i , 0 , 0 , 0 ) ;
						updateLed ( ) ;
					}
				}
			}
		}
		Check_Power ( ) ;

		for (/*var already declared globally*/; green >= 0 , red < 130 ; green-- , red++ )
		{
			for ( uint8_t led_row = 1 ; led_row <= 12 ; led_row = led_row + 2 )
			{
				if( ENABLE_LEDS == 1 )
				{
					setLedColor ( led_row , red , green , 0 ) ;
					setLedColor ( led_row + 1 , red , green , 0 ) ;
					setLedColor ( led_row + 12 , red , green , 0 ) ;
					setLedColor ( led_row+13 , red , green , 0 ) ;
					updateLed ( ) ;
					Check_Power ( ) ;
					HAL_Delay ( 1 ) ;
				}
				else
				{
					Check_Power ( ) ;
					for ( uint8_t i = 1 ; i < 25 ; i++ )
					{
						setLedColor ( i , 0 , 0 , 0 ) ;
						updateLed ( ) ;
					}
				}
			}
		}
		Check_Power ( ) ;

	}
	else
	{
		Check_Power ( ) ;
		for ( uint8_t i = 1 ; i < 25 ; i++ )
		{
			setLedColor ( i , 0 , 0 , 0 ) ;
			updateLed ( ) ;
		}
	}
}

void LCD_DrawMenu()
{
	LCD_DrawVLine ( 59 , 0 , 59 , 28 , LCD_YELLOW ) ;
	LCD_DrawHLine ( 0 , 28 , 59 , 28 , LCD_YELLOW ) ;
	LCD_WriteString ( 4 , 6 , "Song:" , Font_11x18 , LCD_WHITE , LCD_BLACK ) ;
	LCD_WriteString ( 65 , 11 , "Life is a Highway - Rascal Flatts" , Font_7x10 , LCD_WHITE , LCD_BLACK ) ;
	LCD_DrawHLine ( 0 , 80 , 320 , 80 , LCD_YELLOW ) ;
	LCD_DrawVLine ( 86 , 80 , 86 , 160 , LCD_YELLOW ) ;

	Check_Power ( ) ;

	LCD_DrawHLine ( 101 , 95 , 228 , 95 , LCD_YELLOW ) ;
	LCD_DrawHLine ( 101 , 145 , 228 , 145 , LCD_YELLOW ) ;

	LCD_DrawVLine ( 101 , 95 , 101 , 144 , LCD_YELLOW ) ;
	LCD_DrawVLine ( 229 , 95 , 229 , 144 , LCD_YELLOW ) ;

	Check_Power ( ) ;

	LCD_DrawVLine ( 244 , 80 , 244 , 160 , LCD_YELLOW ) ;
	LCD_DrawHLine ( 0 , 160 , 320 , 160 , LCD_YELLOW ) ;
	LCD_WriteString ( 18 , 105 , "LED" , Font_16x26 , LCD_WHITE , LCD_BLACK ) ;
	LCD_WriteString ( 247 , 105 , "!LED" , Font_16x26 , LCD_WHITE , LCD_BLACK ) ;
	LCD_WriteString ( 35 , 190 , "+" , Font_16x26 , LCD_WHITE , LCD_BLACK ) ;
	LCD_WriteString ( 80 , 190 , "<<" , Font_16x26 , LCD_WHITE , LCD_BLACK ) ;
	LCD_WriteString ( 143 , 190 , "PP" , Font_16x26 , LCD_WHITE , LCD_BLACK ) ;
	LCD_WriteString ( 207 , 190 , ">>" , Font_16x26 , LCD_WHITE , LCD_BLACK ) ;
	LCD_WriteString ( 273 , 190 , "-" , Font_16x26 , LCD_WHITE , LCD_BLACK ) ;

	/*
	Check_Power();
	LCD_WriteString(4, 165, "Effect:", Font_11x18, LCD_WHITE, LCD_BLACK);

	LCD_DrawHLine(19,190,60,190,LCD_YELLOW);
	LCD_DrawVLine(20,190,20,225,LCD_YELLOW);
	LCD_WriteString(35, 200, "1", Font_11x18, LCD_WHITE, LCD_BLACK);
	LCD_DrawHLine(20,225,60,225,LCD_YELLOW);
	LCD_DrawVLine(60,190,60,225,LCD_YELLOW);

	LCD_DrawHLine(134,190,175,190,LCD_YELLOW);
	LCD_DrawVLine(135,190,175,225,LCD_YELLOW);
	LCD_WriteString(150, 200, "2", Font_11x18, LCD_WHITE, LCD_BLACK);
	LCD_DrawHLine(135,225,175,225,LCD_YELLOW);
	LCD_DrawVLine(175,190,175,225,LCD_YELLOW);

	Check_Power();

	LCD_DrawHLine(257,190,298,190,LCD_YELLOW);
	LCD_DrawVLine(258,190,298,225,LCD_YELLOW);
	LCD_WriteString(273, 200, "3", Font_11x18, LCD_WHITE, LCD_BLACK);
	LCD_DrawHLine(258,225,298,225,LCD_YELLOW);
	LCD_DrawVLine(298,190,298,225,LCD_YELLOW);*/
}

void Check_Power()
{
	if ( LCD_TGetC ( &x , &y ) )
	{
		if ( x > 80 && x < 160 && y > 0 && y < 80 )
		{
			//HAL_GPIO_WritePin(LEDPORT, LEDPIN, RESET);
			ENABLE_LEDS ^= 1UL << 1 ;
			HAL_Delay ( 200 ) ;
		}

		if ( x > 95 && x < 145 && y > 101 && y < 240 )
		{
			HAL_GPIO_TogglePin ( BACKLIGHT_GPIO_Port , BACKLIGHT_Pin ) ;
			HAL_Delay ( 500 ) ;
		}

		if ( x > 80 && x < 160 && y > 244 && y < 320 )
		{
			//HAL_GPIO_WritePin(LEDPORT, LEDPIN, SET);
			ENABLE_LEDS ^= 1UL << 1 ;
			HAL_Delay ( 200 ) ;
		}
	}
}
/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
