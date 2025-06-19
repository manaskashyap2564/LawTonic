import 'package:flutter/material.dart';

class CyberLawPage extends StatelessWidget {
  const CyberLawPage({super.key});
  static const String routeName = '/cyber_law';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cyber Law'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Detailed content on Cyber Law will be displayed here. This section will cover various aspects of cyber legislation, online safety, and digital rights relevant to Indian citizens and students.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
