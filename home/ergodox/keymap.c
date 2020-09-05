#include QMK_KEYBOARD_H
#include "version.h"
#include "config.h"
#include "risset.c"

enum custom_keycodes
{
    VRSN = SAFE_RANGE,
    RGB_SLD
};

bool process_record_user(uint16_t keycode, keyrecord_t *record)
{
    if (record->event.pressed)
    {
	switch (keycode)
	{
	case VRSN:
	    SEND_STRING (QMK_KEYBOARD "/" QMK_KEYMAP " @ " QMK_VERSION);
	    return false;

	case RGB_SLD:
	    rgblight_mode(1);
	    return false;
	}
    }

    return true;
}

// Runs just one time when the keyboard initializes.
void keyboard_post_init_user(void)
{
    rgblight_setrgb(RGBLIGHT_COLOR_LAYER_0);
};

// Runs whenever there is a layer state change.
layer_state_t layer_state_set_user(layer_state_t state)
{
    uint8_t layer = get_highest_layer(state);

    ergodox_board_led_off();
    ergodox_right_led_1_off();
    ergodox_right_led_2_off();
    ergodox_right_led_3_off();

    switch (layer)
    {
    case 0:
	break;

    case 1:
	ergodox_right_led_1_on();
	break;

    case 2:
	ergodox_right_led_2_on();
	break;

    case 3:
	ergodox_right_led_3_on();
	break;

    default:
	break;
    }

    return state;
};
