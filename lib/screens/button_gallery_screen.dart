import 'package:flutter/material.dart';

import '../widgets/section_heading.dart';
import '../widgets/button_card.dart';

class ButtonGalleryScreen extends StatelessWidget {
  const ButtonGalleryScreen({super.key});

  void _showAddItemDialog(BuildContext context) {
    final itemController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Item'),
          content: TextField(
            controller: itemController,
            decoration: const InputDecoration(
              labelText: 'Item Name',
              hintText: 'Enter item title',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                final name = itemController.text.trim();
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      name.isEmpty ? 'Item added!' : 'Added item: $name',
                    ),
                  ),
                );
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Buttons & Navigation'),
        backgroundColor: theme.colorScheme.inversePrimary,
        actions: [
          // Visible Navigation Button for Profile
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Profile',
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
          // Visible Navigation Button for Settings
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
          // Logout Button using pushReplacement
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          16,
          16,
          16,
          80,
        ), // bottom padding for FAB
        children: [
          // Quick Navigation Bar Card
          Card(
            color: theme.colorScheme.primaryContainer,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Navigation Hub',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Navigate to other screens built for this assignment:',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer.withValues(
                        alpha: 0.8,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ActionChip(
                        avatar: const Icon(Icons.person_outline),
                        label: const Text('Profile'),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/profile'),
                      ),
                      ActionChip(
                        avatar: const Icon(Icons.info_outline),
                        label: const Text('Details'),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/details'),
                      ),
                      ActionChip(
                        avatar: const Icon(Icons.settings_outlined),
                        label: const Text('Settings'),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/settings'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          const SectionHeading(
            title: 'Material 3 Button Gallery',
            subtitle:
                'Explore all standard and custom button types in Flutter.',
          ),

          // 1. ElevatedButton
          ButtonCard(
            title: '1. ElevatedButton',
            description:
                'A elevated button that displays a SnackBar when pressed.',
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'ElevatedButton pressed: SnackBar displayed!',
                    ),
                  ),
                );
              },
              child: const Text('Click Elevated'),
            ),
          ),

          // 2. FilledButton
          ButtonCard(
            title: '2. FilledButton',
            description:
                'A primary-filled button that opens the Details screen.',
            child: FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, '/details');
              },
              child: const Text('Open Details Screen'),
            ),
          ),

          // 3. FilledButton.tonal
          ButtonCard(
            title: '3. FilledButton.tonal',
            description:
                'A tonal filled button that opens the Settings screen.',
            child: FilledButton.tonal(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: const Text('Open Settings Screen'),
            ),
          ),

          // 4. OutlinedButton
          ButtonCard(
            title: '4. OutlinedButton',
            description:
                'An outlined border button that opens the Profile screen.',
            child: OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: const Text('Open Profile Screen'),
            ),
          ),

          // 5. TextButton
          ButtonCard(
            title: '5. TextButton',
            description:
                'A flat text button that displays an informational message.',
            child: TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Informational Message: TextButtons are great for low emphasis actions!',
                    ),
                  ),
                );
              },
              child: const Text('Show Info Message'),
            ),
          ),

          // 6. IconButton
          ButtonCard(
            title: '6. IconButton',
            description:
                'An icon-only button that navigates to the Profile screen.',
            child: IconButton(
              icon: const Icon(Icons.account_circle, size: 36),
              color: theme.colorScheme.primary,
              tooltip: 'Go to Profile',
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ),

          // 7. FloatingActionButton (Demonstration Card)
          ButtonCard(
            title: '7. FloatingActionButton',
            description: 'A circular action button (also shown at bottom right of screen).',
            child: FloatingActionButton.extended(
              heroTag: 'fab_demo',
              onPressed: () => _showAddItemDialog(context),
              icon: const Icon(Icons.add),
              label: const Text('Add Item Dialog'),
            ),
          ),

          // 8. FilledButton.icon (Button with Icon)
          ButtonCard(
            title: '8. Button with Icon (FilledButton.icon)',
            description:
                'A button combining an icon and label that opens Details.',
            child: FilledButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/details');
              },
              icon: const Icon(Icons.info),
              label: const Text('View Details'),
            ),
          ),

          // 9. Custom Styled Button
          ButtonCard(
            title: '9. Custom-Styled Button',
            description: 'Styled using styleFrom() with custom colors, padding, and rounded corners.',
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 6,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Custom Button clicked! Styled with custom rounded corners & elevation.',
                    ),
                  ),
                );
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  SizedBox(width: 8),
                  Text('Custom Styled Button', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Logout bottom button
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
              minimumSize: const Size.fromHeight(48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: const Icon(Icons.logout),
            label: const Text('Logout (Return to Login)'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddItemDialog(context),
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}
