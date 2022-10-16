

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/screens/screens.dart';
import 'package:qr_reader/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
            onPressed: () => scanListProvider.deleteAll(),
            icon: Icon(Icons.delete_forever)
          )
        ],
      ),
      body: const HomaPageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }
}

class HomaPageBody extends StatelessWidget {
  const HomaPageBody({super.key});

  @override
  Widget build(BuildContext context) {

    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
    final uiProvider = Provider.of<UIProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        scanListProvider.scansByType('geo');
        return MapHistoryScreen();

      case 1:
        scanListProvider.scansByType('http');
        return const DirectionsScreen();

      default:
        return const MapHistoryScreen();
    }
  }
}