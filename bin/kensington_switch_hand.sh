#!/bin/bash

# Small utility to quickly switch button mapping for Kensington Expert.
#
# Background:
# Most comfortable position for me to use the trackball is by moving the ball
# using my thumb, similar to usage of Logitech Ergo MX. The natural position for
# the index finger is then set as left-click. The rest follows.
# This utility switches the mapping for when I switch the trackball position to
# be operated with my left hand.

# Default setting:
# ---------       ------------------
# | 2 | 8 |       | middle | back  |
# ---------       ------------------
# | 1 | 3 |       | left   | right |
# ---------       ------------------
#
# X11 Button numbering:
#    1 = left button
#    2 = middle button (pressing the scroll wheel)
#    3 = right button
#    4 = turn scroll wheel up
#    5 = turn scroll wheel down
#    6 = push scroll wheel left
#    7 = push scroll wheel right
#    8 = 4th button (aka browser backward button)
#    9 = 5th button (aka browser forward button)
# Ref: http://xahlee.info/linux/linux_x11_mouse_button_number.html
#
#
# Right Hand Setting:
# ---------       ------------------
# | 8 | 1 |       | back   | left  |
# ---------       ------------------
# | 2 | 3 |       | middle | right |
# ---------       ------------------
#
# Left Hand Setting:
# ---------
# | 1 | 8 |
# ---------
# | 3 | 2 |
# ---------
#

# String to search in xinput
DEV_NAME="Kensington Expert"

# Button mapping from documentation above
RIGHT_HAND_MAPPING="2 8 3 4 5 6 7 1 9"
LEFT_HAND_MAPPING="3 1 2 4 5 6 7 8 9"

# The magic
CMD="xinput set-button-map"
DEV_ID=$(xinput list | grep "${DEV_NAME}" | head -n 1 | sed -r "s/.*id=([0-9]+).*/\1/")

function set_mode_right_hand {
    echo " Setting mapping to right hand mode"
    ${CMD} ${DEV_ID} ${RIGHT_HAND_MAPPING}
}

function set_mode_left_hand {
    echo " Setting mapping to left hand mode"
    ${CMD} ${DEV_ID} ${LEFT_HAND_MAPPING}
}

function get_mapping_human {
    CURR_MODE=$(xinput get-button-map ${DEV_ID})

    echo -n " Current mode: "
    case ${CURR_MODE} in
        ${RIGHT_HAND_MAPPING}*)
            echo "Right Hand Mode"
            ;;
        ${LEFT_HAND_MAPPING}*)
            echo "Left Hand Mode"
            ;;
        *)
            echo "Unknown mapping: ${CURR_MODE}"
            ;;
    esac
}

function switch_mapping {
    CURR_MODE=$(xinput get-button-map ${DEV_ID})

    case ${CURR_MODE:0:1} in
        1)
            echo "Detected standard setting"
            set_mode_right_hand
            ;;
        2)
            echo "Detected right hand mode"
            set_mode_left_hand
            ;;
        3)
            echo "Detected left hand mode"
            set_mode_right_hand
            ;;
        *)
            echo "Unknown key mapping: ${CURR_MODE}"
            set_mode_right_hand
            ;;
    esac
}

switch_mapping
get_mapping_human
echo " Done"
