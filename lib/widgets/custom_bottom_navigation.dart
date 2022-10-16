

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/providers/providers.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UIProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentIndex,
      onTap: ( int index ) => uiProvider.selectedMenuOpt = index,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapa',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.directions),
          label: 'Direcciones'
        )
      ],
    );
  }
}