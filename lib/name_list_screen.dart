import 'package:flutter/material.dart';

class NameListScreen extends StatelessWidget {
  const NameListScreen({super.key});

  final List<String> names = const [
    'Aisha',
    'Rahul',
    'Suman',
    'Mohammad',
    'Anita',
    'Vikram',
    'Neha',
    'Rohit',
    'Kavita',
    'Sohail'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Names List')),
      body: ListView.separated(
        itemCount: names.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final name = names[index];
          return ListTile(
            title: Text(name),
            leading: CircleAvatar(child: Text(name[0])),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => NameDetailScreen(name: name),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class NameDetailScreen extends StatelessWidget {
  final String name;
  const NameDetailScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Name Details')),
      body: Center(
        child: Card(
          elevation: 6,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.person, size: 64),
                const SizedBox(height: 12),
                Text(name,
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text('This screen shows the tapped name & an icon.'),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Back'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
