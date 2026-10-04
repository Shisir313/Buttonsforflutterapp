import 'package:flutter/material.dart';

import '../widgets/profile_info_row.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name = 'Milan';
  final String _role = 'Student';
  String _email = 'student@example.com';

  void _showEditProfileDialog() {
    final nameController = TextEditingController(text: _name);
    final emailController = TextEditingController(text: _email);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                setState(() {
                  _name = nameController.text;
                  _email = emailController.text;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Profile updated successfully (Demo)'),
                  ),
                );
              },
              child: const Text('Save'),
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
        title: const Text('Student Profile'),
        backgroundColor: theme.colorScheme.inversePrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Circular Avatar
            CircleAvatar(
              radius: 60,
              backgroundColor: theme.colorScheme.primaryContainer,
              child: Icon(
                Icons.person,
                size: 70,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _name,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              _role,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 32),

            // Info Rows
            ProfileInfoRow(
              icon: Icons.person_outline,
              label: 'Full Name',
              value: _name,
            ),
            ProfileInfoRow(
              icon: Icons.badge_outlined,
              label: 'Role / Designation',
              value: _role,
            ),
            ProfileInfoRow(
              icon: Icons.email_outlined,
              label: 'Email Address',
              value: _email,
            ),
            ProfileInfoRow(
              icon: Icons.school_outlined,
              label: 'Institution',
              value: 'College of Engineering & Technology',
            ),
            const SizedBox(height: 32),

            // Edit Profile Button
            FilledButton.icon(
              onPressed: _showEditProfileDialog,
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profile'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Back Button using Navigator.pop
            OutlinedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back to Gallery'),
              style: OutlinedButton.styleFrom(
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
}
