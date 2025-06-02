import 'package:blue_only_view/WINlistview_page.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'listview_page.dart';

///starting point of the app
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
      ),
      home: Platform.isAndroid ? const PairedDevicesScreen() : const WinPairedDevicesScreen(),

    
      
    
      
    );
  }
}

