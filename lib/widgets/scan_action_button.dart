
import 'package:flutter/material.dart';

class ScanActionButton extends StatelessWidget {
  const ScanActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () => {},
      child: Icon(Icons.filter_center_focus),
    );
  }
}