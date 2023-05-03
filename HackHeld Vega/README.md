# HackHeld

A open source hackable handheld for DIY.

## Hackheld Vega

![Hackheld Vega Assembled](https://raw.githubusercontent.com/SpacehuhnTech/Hackheld/main/HackHeld%20Vega/Hackheld_Vega_Images/hackheld_vega.jpg)

The Hackheld Vega is made to be as simple as possible. Made up of just a D1 Mini, OLED, RGB LED and a couple of buttons! 
It can run the [ESP8266 Deauther](https://github.com/spacehuhntech/esp8266_deauther), but you can also write your own firmware using Arduino. 

### Hackheld Vega - PCB

[Download Gerbers](https://github.com/SpacehuhnTech/Hackheld/raw/main/HackHeld%20Vega/Hackheld_Vega_PCB/Hackheld_Vega_rev1_gerbers.zip)

### Hackheld Vega - Bill Of Materials (BOM)

| Part | Amount | Description | Link (affiliate) |
| ---- | ------ | ----------- | ---------------- |
| D1 Mini | 1 | Wemos/Lolin D1 Mini ESP8266 Dev Board | https://s.click.aliexpress.com/e/_99hh4H |
| 1.3" OLED SH1106 | 1 | I2C (4Pin) Make sure its pins are in this order (left to right): **VDD,GND,SCK,SDA** (The position of GND is important, it must be the second pin! The other pins can sometimes have slightly different labels) | https://s.click.aliexpress.com/e/_9gf1BF |
| Buttons | 6 | 6x6mm 4pin tactile push button | https://s.click.aliexpress.com/e/_9IwWtj |
| Neopixel | 1 | RGB LED WS2812B 5050 | https://s.click.aliexpress.com/e/_9fRrPj |
| PCB | 1 | [Download Gerbers](https://github.com/SpacehuhnTech/Hackheld/blob/main/HackHeld%20Vega/Hackheld_Vega_PCB/Hackheld_Vega_gerbers.zip) | - |
| 3D Printed Case | 1 | [Download STL](https://github.com/SpacehuhnTech/Hackheld/blob/main/HackHeld%20Vega/Hackheld_Vega_Case/Hackheld_Vega_Case.stl) | - |
| Case screws | 4 | M2.5 screws (I used 6mm long screws) | https://s.click.aliexpress.com/e/_9QSLrc |

![Hackheld Vega OLED pinout](https://raw.githubusercontent.com/SpacehuhnTech/Hackheld/main/HackHeld%20Vega/Hackheld_Vega_Images/hackheld_vega_oled_note.jpg)
![Hackheld Vega Parts](https://raw.githubusercontent.com/SpacehuhnTech/Hackheld/main/HackHeld%20Vega/Hackheld_Vega_Images/hackheld_vega_bom.jpg)


### Hackheld Vega - Case

[Download STL](https://www.prusaprinters.org/prints/95180-hackheld-vega-case)

Additionally, you will need 4 M2.5 screws to connect the PCB to the case.

### Hackheld Vega - Firmware

You can write your own code for it, or run the [ESP8266 Deauther V2](https://github.com/spacehuhntech/esp8266_deauther) (You can download a [bin file here](https://github.com/SpacehuhnTech/esp8266_deauther/releases/download/2.6.1/esp8266_deauther_2.6.1_HACKHELD_VEGA.bin))
