
import 'package:flutter/material.dart';

import 'package:qr_reader/widgets/scan_tiles.dart';

class MapHistoryScreen extends StatelessWidget {
  const MapHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanTilesWidget(type: 'geo');
  }
}