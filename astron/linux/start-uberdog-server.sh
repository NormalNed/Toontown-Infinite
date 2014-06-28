#!/bin/sh
cd ../..

# Read the contents of PPYTHON_PATH into $PPYTHON_PATH:
PPYTHON_PATH=`cat PPYTHON_PATH`

# Define some constants for our AI server:
MAX_CHANNELS=999999
STATESERVER=4002
ASTRON_IP="127.0.0.1:7199"
EVENTLOGGER_IP="127.0.0.1:7197"

# Get the user input:
read -p "Base channel (DEFAULT: 401000000): " BASE_CHANNEL
BASE_CHANNEL=${BASE_CHANNEL:-401000000}

echo "==============================="
echo "Starting Toontown Infinite UberDOG server..."
echo "ppython: $PPYTHON_PATH"
echo "Base channel: $BASE_CHANNEL"
echo "Max channels: $MAX_CHANNELS"
echo "State Server: $STATESERVER"
echo "Astron IP: $ASTRON_IP"
echo "Event Logger IP: $EVENTLOGGER_IP"
echo "==============================="

$PPYTHON_PATH -m toontown.uberdog.ServiceStart --base-channel $BASE_CHANNEL \
              --max-channels $MAX_CHANNELS --stateserver $STATESERVER \
              --astron-ip $ASTRON_IP --eventlogger-ip $EVENTLOGGER_IP \
              --district-name $DISTRICT_NAME
