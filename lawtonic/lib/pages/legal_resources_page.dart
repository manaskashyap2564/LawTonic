import 'package:flutter/material.dart';
import '../models/legal_resource_model.dart';

final List<LegalResource> legalResources = [
  LegalResource(
    id: '1',
    title: 'Landmark Supreme Court Case: Kesavananda Bharati v. State of Kerala',
    summary: 'This 1973 case established the Basic Structure Doctrine, limiting Parliament’s power to amend the Constitution.',
    author: 'Supreme Court of India',
    date: DateTime(1973, 4, 24),
    url: 'https://en.wikipedia.org/wiki/Kesavananda_Bharati_v._State_of_Kerala',
    tags: ['Constitution', 'Supreme Court', 'Landmark'],
  ),
  LegalResource(
    id: '2',
    title: 'Guide: How to File an FIR in India',
    summary: 'Step-by-step instructions for filing a First Information Report (FIR) with the police.',
    author: 'LawTonic Research',
    date: DateTime(2025, 7, 18),
    url: 'https://www.india.gov.in/how-file-fir',
    tags: ['Procedure', 'FIR', 'Police'],
  ),
  LegalResource(
    id: '3',
    title: 'Consumer Protection Act, 2019: Key Provisions',
    summary: 'Overview of consumer rights and dispute resolution under the 2019 Act.',
    author: 'LawTonic Research',
    date: DateTime(2019, 8, 9),
    url: 'https://consumeraffairs.nic.in/acts-and-rules/consumer-protection-act-2019',
    tags: ['Consumer', 'Rights', 'Law'],
  ),
  LegalResource(
    id: '4',
    title: 'Recent Legal Development: Digital Personal Data Protection Act, 2023',
    summary: 'India’s new data protection law and its impact on privacy and businesses.',
    author: 'LawTonic Research',
    date: DateTime(2023, 8, 11),
    url: 'https://prsindia.org/billtrack/the-digital-personal-data-protection-bill-2023',
    tags: ['Privacy', 'Data Protection', 'Recent'],
  ),
];

class LegalResourcesPage extends StatelessWidget {
  const LegalResourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Legal Resources')),
      body: ListView.builder(
        itemCount: legalResources.length,
        itemBuilder: (context, index) {
          final resource = legalResources[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(resource.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(resource.summary),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(resource.title),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Author: ${resource.author}'),
                        Text('Date: ${resource.date.toLocal().toString().split(' ')[0]}'),
                        Text('Tags: ${resource.tags.join(', ')}'),
                        const SizedBox(height: 8),
                        Text(resource.summary),
                        const SizedBox(height: 8),
                        TextButton(
                          child: const Text('Read More'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            // You can use url_launcher to open resource.url
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
