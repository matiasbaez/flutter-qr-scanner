
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:qr_reader/models/models.dart';

launchURL(BuildContext context, ScanModel scan) async {
  final url = scan.value;

  if (scan.type == 'http') {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not lunch $url';
    }
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }

}