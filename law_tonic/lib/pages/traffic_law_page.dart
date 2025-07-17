import 'package:flutter/material.dart';

class TrafficLawPage extends StatelessWidget {
  const TrafficLawPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Traffic Law'),
      ),
      body: const Center(
        child: Text('Traffic Law Content'),
      ),
    );
  }
}
