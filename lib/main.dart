import 'package:flutter/material.dart';
import 'package:qr_reader/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Reader',
      initialRoute: 'home',
      routes: {
        'home':( _ ) => const HomeScreen(),
        'map':( _ ) => const MapScreen(),
      },
    );
  }
}
