Vehicle control app for a device with ESP32

This is a mobile app (Android/IOS) whose main functionality is related to Bluetooth Low Energy (BLE). 
It is created to display data and control a vehicle wirelesly. 
It is entirely done in FLutter/Dart and is compatible with code: https://github.com/atrawinska/Arduino-IDE-autonomous-vehicle-w-BLE 

It contains two screens and two drawers. First page displays paired devices and a button to see the drawer with instructions. The other page provides various containers to display data (ultrasonic sensor/s, servo motor's angle, color sensor's readings, speed, battery) and a switch (turn on/off motor) as well as another drawer with user's instructions.

IMPORTANT
- app was only tested on Android phone with a standard size (Xiaomi Redmi Note 8 pro);
- app is not compatible with Web or Desktop;
- might require restarting after pairing a new device;
- uses Flutter version 3.24.4 (current for November/December 2024),
- flutter_blue_plus | Flutter package - version 1.34.5 (current for November/December 2024)

User guide:
- first turn on Bluetooth on your device
- pair the vehicle with your phone, otherwise it will not show
- click the desired device
- wait for the data to load, if it shows error retreiving data- try again,
- now you can observe the data and control the vehicle

Potential improvements
- cross-platform functionality,
- adjustable sizing of widgets or different UI for desktop/web
- more testing and troubleshooting
- dark mode
- more control over a device (virtual joystick, changing modes from self-drive to controlled via app)
- screen for turning on Bluetooth, scanning for devices and pairing
- informative drawer/screen with detailed description of each informative container
- more detailed documenetation
- Restructuring code into theme-oriented files for better organization.

Thank you!
"# mobile_app_boat" 
