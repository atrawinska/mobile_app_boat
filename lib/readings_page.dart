import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'elements.dart';
import 'switch_widget.dart';
import 'navigation_bar.dart';

//page with data monitoring and control

//data to receive
int dataType = 0;
int lowByte = 0;
int highByte = 0;
int multiplier = 0;
int speedValue = 0;
int batteryFactor = 0; //it will be initially multiplied by 10
int sign = 0;
double pitch = 0;

//handles bluetooth readings and writings
class DeviceDetailsScreen extends StatefulWidget {
  final BluetoothDevice device;

  const DeviceDetailsScreen({required this.device, super.key});

  @override
  _DeviceDetailsScreenState createState() => _DeviceDetailsScreenState();
}

class _DeviceDetailsScreenState extends State<DeviceDetailsScreen> {
  BluetoothCharacteristic? _rxCharacteristic;
  final List<String> _receivedData = [];

  var lastData = '';
  bool _isConnecting = true;
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    _connectToDevice();
  }

  /// Connect to the selected device
  Future<void> _connectToDevice() async {
    try {
      await widget.device.connect();
      setState(() => _isConnected = true);

      // Discover services and characteristics
      List<BluetoothService> services = await widget.device.discoverServices();

      // Look for a specific characteristic for receiving data (e.g., RX characteristic)
      for (var service in services) {
        for (var characteristic in service.characteristics) {
          _rxCharacteristic = characteristic;

          // Set up a listener to receive data
          _rxCharacteristic!.lastValueStream.listen((value) {
            setState(() {
              if (value.length == 5) {
                dataType = value[0];
                multiplier = value[1];
                sign = value[2];
                lowByte = value[3];
                highByte = value[4]; //sensed colour

                print(
                    "Received Data: $dataType $multiplier, $sign, $lowByte, $highByte");
              }
              List<int> data = [
                multiplier,
                sign,
                speedValue,
                lowByte,
                highByte,
              ];
              pitch = ((highByte << 8) + lowByte) / multiplier;
              if (sign == 1) {
                pitch = pitch * (-1);
              }

              for (var value in data) {
                _receivedData.add(value.toString());
              }
            });
          });

          await _rxCharacteristic!.setNotifyValue(true);
        }
      }
    } catch (e) {
      print("Error connecting to device: $e, try again");
    } finally {
      setState(() => _isConnecting = false);
    }
  }

  @override
  void dispose() {
    if (_isConnected) {
      widget.device.disconnect();
    }
    super.dispose();
  }

  Future<void> sendData(List<int> data) async {
//List<int> data = [0x00];
    if (_rxCharacteristic != null) {
      try {
        await _rxCharacteristic!.write(data);
        print("Value sent");
      } catch (e) {
        print("Error $e");
      }
    }
  }

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customWhite,
      appBar: AppBar(
        backgroundColor: customWhite,
        title: CustomText(
          "Device: ${widget.device.platformName}",
          size: 23,
          ownColor: customBlack,
        ),
        centerTitle: false,
      ),
      body: _isConnecting
          ? Center(child: CircularProgressIndicator(color: customPink))
          : !_isConnected
              ? Center(
                  child: CustomText(
                    "Failed to connect to the device. Try again",
                  ),
                )
              : Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height -
                          kToolbarHeight -
                          MediaQuery.of(context).padding.top,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 50),
                          Container(
                            margin: EdgeInsets.all(20),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: customPink,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(

                              children: [

                                CustomText("Current angle:", size: 20),
                               CustomText("${pitch.toStringAsFixed(1)}°", size: 30),

                                
                              ]
                            )
                            
                             
                          ),
                          Container(
                            margin: EdgeInsets.all(20),
                            height: 300,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: customLightPink,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  "Map for the mission",
                                  size: 18,
                                  ownColor: customBlack,
                                ),
                                SizedBox(
                                    height:
                                        10), // spacing between text and image
                                Expanded(
                                  child: Image.asset(
                                    'assets/images/Map_denmark.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {}, // currently does nothing
                            child: CustomText("Chat with Kowalsky", size: 20),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: customPink,
                              foregroundColor: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
      bottomNavigationBar: CustomNavigationBar(
          "Firstly, you can see the current angle (pitch) of your boat, below there is a map for the mission and at the very end you can go to a chat mode with Kowalsky, \nhave fun!"),
    );
  }
}

