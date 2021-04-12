#define LED_CFG_USE_RGBW 0 // 1=RGBW leds ----  0=ws2812 leds
#define LED_CFG_LEDS_CNT 24 // aantal leds in een strip
#define LED_CFG_BYTES_PER_LED 3
#define LED_CFG_RAW_BYTES_PER_LED (LED_CFG_BYTES_PER_LED * 8)

static uint8_t leds_colors[LED_CFG_BYTES_PER_LED * LED_CFG_LEDS_CNT];
static uint32_t tmp_led_data[2 * LED_CFG_RAW_BYTES_PER_LED]; // temp array

static uint8_t is_reset_pulse;     /*!< Status if we are sending reset pulse or led data */
static volatile uint8_t is_updating;        /*!< Is updating in progress? */
static uint32_t current_led;        /*!< Current LED number we are sending */

void led_init(void);
uint8_t led_update(uint8_t block);
uint8_t led_set_color(size_t index, uint8_t r, uint8_t g, uint8_t b);
uint8_t led_set_color_all(uint8_t r, uint8_t g, uint8_t b);
uint8_t led_set_color_rgb(size_t index, uint32_t rgb);
uint8_t led_set_color_all_rgb(uint32_t rgb);

uint8_t led_is_update_finished(void);
uint8_t led_start_reset_pulse(uint8_t num);
