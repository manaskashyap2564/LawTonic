import 'package:flutter/material.dart';

class CriminalLawPage extends StatelessWidget {
  const CriminalLawPage({super.key});
  static const String routeName = '/criminal_law';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criminal Law'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Detailed content on Criminal Law will be displayed here. This section will cover various aspects of criminal legislation, procedures, and rights relevant to Indian citizens and students.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
