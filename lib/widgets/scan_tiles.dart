

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanTilesWidget extends StatelessWidget {

  final String type;

  const ScanTilesWidget({
    super.key,
    required this.type
  });

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, index) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection direction) => {
          scanListProvider.deleteScanById(scans[index].id!)
        },
        child: ListTile(
          leading: Icon(type == 'http' ? Icons.directions : Icons.map, color: Theme.of(context).primaryColor),
          title: Text(scans[index].value),
          subtitle: Text(scans[index].id.toString()),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () => launchURL(context, scans[index]),
        ),
      ),
    );
  }
}