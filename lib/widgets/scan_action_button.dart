
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanActionButton extends StatelessWidget {
  const ScanActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    return FloatingActionButton(
      elevation: 0,
      onPressed: () => scanQR(context, scanListProvider),
      child: Icon(Icons.filter_center_focus),
    );
  }
}

Future<void> scanQR(BuildContext context, ScanListProvider scanListProvider) async {
  String barcodeScanRes;
  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancel', false, ScanMode.QR);

    if (barcodeScanRes == '-1') return;

    final scan = await scanListProvider.newScan(barcodeScanRes);

    launchURL(context, scan);
  } on PlatformException {
    barcodeScanRes = 'Failed to get platform version.';
  }

}