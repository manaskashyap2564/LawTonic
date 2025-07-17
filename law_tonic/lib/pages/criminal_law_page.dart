import 'package:flutter/material.dart';

class CriminalLawPage extends StatelessWidget {
  const CriminalLawPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criminal Law'),
      ),
      body: const Center(
        child: Text('Criminal Law Content'),
      ),
    );
  }
}
