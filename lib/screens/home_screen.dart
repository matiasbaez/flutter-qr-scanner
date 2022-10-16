

import 'package:flutter/material.dart';

import 'package:qr_reader/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.delete_forever)
          )
        ],
      ),
      body: Container(

      ),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }
}