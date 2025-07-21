import 'package:flutter/material.dart';

class CivilLawPage extends StatelessWidget {
  const CivilLawPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Civil Law'),
      ),
      body: const Center(
        child: Text('Civil Law Content'),
      ),
    );
  }
}
