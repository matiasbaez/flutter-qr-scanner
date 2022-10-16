

import 'package:flutter/material.dart';

import 'package:qr_reader/models/models.dart';
import 'package:qr_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {

  List<ScanModel> scans = [];
  String selectedType = 'http';

  Future<ScanModel> newScan( String value ) async {
    final scan = new ScanModel(value: value);
    final id = await DBProvider.dbi.newScan(scan);
    scan.id = id;

    if (selectedType == scan.type) {
      scans.add(scan);
      notifyListeners();
    }

    return scan;
  }

  listScans() async {
    final scans = await DBProvider.dbi.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  scansByType( String type ) async {
    final scans = await DBProvider.dbi.getScanByType(type);
    this.scans = [...scans];
    selectedType = type;
    notifyListeners();
  }

  deleteScanById( int id ) async {
    await DBProvider.dbi.deleteScan(id);
    // scansByType(selectedType);
  }

  deleteAll() async {
    await DBProvider.dbi.deleteAllScans();
    scans = [];
    notifyListeners();
  }

}