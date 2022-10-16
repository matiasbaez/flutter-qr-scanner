import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/screens/screens.dart';
import 'package:qr_reader/providers/providers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UIProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home':( _ ) => const HomeScreen(),
          'map':( _ ) => const MapScreen(),
        },
        theme: ThemeData(
          primarySwatch: Colors.teal,
          // primaryColor: Colors.deepPurple,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.teal
          )
        ),
      ),
    );
  }
}
