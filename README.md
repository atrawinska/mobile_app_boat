# 🚤 Vehicle Control App for ESP32 Device

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
# 🚤 Vehicle Control App for ESP32 Device

This is a cross-platform mobile application (Android/iOS) built using **Flutter/Dart**, designed to interact with an ESP32-based boat over **Bluetooth Low Energy (BLE)**.

Its core functionality is to **display live data and enable basic control** of the boat. While currently focused on Android, this project lays the groundwork for further multi-platform support.

---

## 📱 Features

- ✅ Bluetooth Low Energy (BLE) communication with ESP32
- 📋 Device pairing and selection screen
- 🌍 Real-time pitch display and basic mapping screen
- 🧭 Instruction drawer for user guidance
- ✨ Built entirely in Flutter/Dart

---

## 📷 Screens Overview

### 1. Device Screen
- Displays paired BLE devices
- Connect button for selected device
- Drawer with simple user instructions

### 2. Data Screen
- Pitch display in real-time
- Embedded map view (position tracking or simulation-ready)

---

## ⚙️ Technical Details

- ✅ **Tested On**: Android (Xiaomi Redmi Note 8 Pro)
- ❌ **Not Supported**: Web or Desktop platforms (for now)
- 🔁 May require **app restart after pairing a new device**
- 🧱 **Flutter Version**: `3.24.4` (as of Nov–Dec 2024)
- 🔌 **BLE Package**: [`flutter_blue_plus`](https://pub.dev/packages/flutter_blue_plus) v1.34.5 (as of May–June 2025)
  
> 🔄 **Developed based on my previous application**:  
> [BLE_final_app_esp32_autonomous_vehicle](https://github.com/atrawinska/BLE_final_app_esp32_autonomous_vehicle)


---

## 🧑‍💻 User Guide

1. Turn on **Bluetooth** on your device.
2. **Pair** the ESP32-based vehicle in system Bluetooth settings.
3. Launch the app and **select your paired device**.
4. Wait for data to load.
   - If an error appears ("error retrieving data"), try again.
5. Once connected, monitor pitch and position on the second screen.

---

## 🚀 Potential Improvements

- 🖥️ Cross-platform support (Web/Desktop)
- 📐 Responsive UI or adjustable widget sizing
- 🧪 Enhanced testing and error handling
- 🌙 Dark mode theme
- 🎮 Advanced control features (virtual joystick, mode switching)
- 🔍 Dedicated Bluetooth pairing and scanning screen
- ℹ️ Detailed info screen or drawer for container explanations
- 📚 Comprehensive documentation and in-app tooltips
- 🗂️ Code restructuring (e.g., views, models, themes folders)

---

## 🙏 Acknowledgments

Thanks for checking out this project! Feedback, feature requests, and contributions are always welcome.

---

**Repository Name:** `mobile_app_boat`