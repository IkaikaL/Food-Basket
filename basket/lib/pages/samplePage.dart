// ignore_for_file: file_names

import 'package:flutter/material.dart';

// This is called by the landing page and constructs a new page.
// Here Scaffold is used again to produce a basic design UI.
class SampleRoute extends StatelessWidget {
  const SampleRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SamplePage'),
      ),
      );
  }
}