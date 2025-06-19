import 'package:flutter/material.dart';

class CivilLawPage extends StatelessWidget {
  const CivilLawPage({super.key});
  static const String routeName = '/civil_law';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Civil Law'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Detailed content on Civil Law will be displayed here. This section will cover various aspects of civil legislation, procedures, and rights relevant to Indian citizens and students.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
