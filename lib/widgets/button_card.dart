import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  final String title;
  final String description;
  final Widget child;

  const ButtonCard({
    super.key,
    required this.title,
    required this.description,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall
                  ?.copyWith(color: Colors.grey[600]),
            ),
            const Divider(height: 24),
            Center(child: child),
          ],
        ),
      ),
    );
  }
}
