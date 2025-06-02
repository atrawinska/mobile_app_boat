import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'elements.dart';
import 'navigation_bar.dart';
import 'readings_page.dart';

///this is the first screen with displayed read data




class PairedDevicesScreen extends StatefulWidget {
  const PairedDevicesScreen({super.key});

  @override
  _PairedDevicesScreenState createState() => _PairedDevicesScreenState();
}

class _PairedDevicesScreenState extends State<PairedDevicesScreen> {
  List<BluetoothDevice> _pairedDevices = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPairedDevices();
  }

  /// Fetch paired devices and update the UI
  Future<void> _fetchPairedDevices() async {
    try {
      // Ensure Bluetooth is supported
      if (await FlutterBluePlus.isSupported == false) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text("Bluetooth is not supported on this device.")),
        );
        return;
      }

      // Wait for Bluetooth to be turned on
      await FlutterBluePlus.adapterState
          .where((state) => state == BluetoothAdapterState.on)
          .first;

      // Retrieve bonded (paired) devices
      List<BluetoothDevice> bondedDevices = await FlutterBluePlus.bondedDevices;

      setState(() {
        _pairedDevices = bondedDevices;
        _isLoading = false;
      });
    } catch (e) {
      print("Error fetching paired devices: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// Navigate to the device details screen
  void _connectToDevice(BluetoothDevice device) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeviceDetailsScreen(device: device),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
       
      appBar: AppBar(title: CustomText("Paired Bluetooth Devices", size: 23, ownColor: customBlack,), backgroundColor: customWhite,  centerTitle: true, ),
      body: Container( child: 
      
      
      
      _isLoading
          ? Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            CircularProgressIndicator(color: customPink,),
              const SizedBox(height: 20),            
             CustomText("Remember to pair with a desired device through your phone's settings.", size: 15, ownColor: customPink, ownFontWeight: FontWeight.bold,),


          ],)) 
          : _pairedDevices.isEmpty
              ? const Center(child: Text("No paired devices found."))
              : ListView.builder(
                  itemCount: _pairedDevices.length,
                  itemBuilder: (context, index) {
                    BluetoothDevice device = _pairedDevices[index];
                     return Card(
                    elevation: 4, // Adds shadow for box effect
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8), // Margin between cards
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Rounded corners
                    ),
                    child: ListTile(
                      tileColor: customPink,
                      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12), // Rounded corners
  ),
                      title: CustomText(
                        (device.platformName.isNotEmpty? device.platformName : "Unknown Device"), size: 15,
                            ownColor: const Color.fromARGB(255, 255, 255, 255),
                          
                      ),
                     
                      trailing: const Icon(Icons.bluetooth_connected, color: Color.fromARGB(255, 255, 255, 255) ),
                      onTap: () => _connectToDevice(device),
                    ),
                  );      

                  },
                ),),
                bottomNavigationBar:  CustomNavigationBar("1. First ensure if you have paired with the autonomous vehicle in your device's settings.\n2.Now, it should be visible in the list of paired devices.\n3.Click the autonomous vehicle.\n4.Control and see its readings! "),
    );
  }
}




