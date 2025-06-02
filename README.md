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
