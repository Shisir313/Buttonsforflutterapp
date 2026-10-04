import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Application Details'),
        backgroundColor: theme.colorScheme.inversePrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              'About This Application',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'This Flutter application is built as a college practical assignment demonstrating Material Design 3 buttons, navigation patterns (push, pop, pushReplacement, and named routes), state management, dialogs, and responsive UI layouts.',
              style: theme.textTheme.bodyLarge?.copyWith(
                height: 1.5,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),

            Text(
              'Key Features & Concepts',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Informational items with icons
            _buildInfoTile(
              context,
              icon: Icons.smart_button,
              title: '9+ Material 3 Buttons',
              description: 'Elevated, Filled, Tonal, Outlined, Text, Icon, FAB, and Custom buttons.',
            ),
            _buildInfoTile(
              context,
              icon: Icons.navigation_outlined,
              title: 'Robust Navigation',
              description: 'Demonstrates push, pop, pushReplacement, and named routes setup.',
            ),
            _buildInfoTile(
              context,
              icon: Icons.palette_outlined,
              title: 'Material 3 Theming',
              description: 'Modern color schemes, consistent rounded cards, and typography.',
            ),
            _buildInfoTile(
              context,
              icon: Icons.verified_user_outlined,
              title: 'Form Validation',
              description:
                  'Secure demo login screen with client-side input validation.',
            ),
            const SizedBox(height: 32),

            // Back Button
            FilledButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back to Gallery'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
