import 'package:flutter/material.dart';

class TrafficLawPage extends StatelessWidget {
  const TrafficLawPage({super.key});
  static const String routeName = '/traffic_law';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Traffic Law'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Detailed content on Traffic Law will be displayed here. This section will cover various aspects of traffic regulations, violations, and rights relevant to Indian citizens and students.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
