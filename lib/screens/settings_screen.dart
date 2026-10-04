import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  bool _soundEnabled = true;

  void _saveSettings() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Settings saved! (Notifications: ${_notificationsEnabled ? "On" : "Off"}, Dark Mode: ${_darkModeEnabled ? "On" : "Off"})',
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Settings'),
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
            Text(
              'Preferences',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),

            // Notifications Switch
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SwitchListTile(
                secondary: const Icon(Icons.notifications_outlined),
                title: const Text('Enable Notifications'),
                subtitle: const Text('Receive push alerts and reminders'),
                value: _notificationsEnabled,
                onChanged: (bool value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 12),

            // Dark Mode Switch (Demo)
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SwitchListTile(
                secondary: const Icon(Icons.dark_mode_outlined),
                title: const Text('Dark Mode (Demo)'),
                subtitle: const Text('Toggle dark theme appearance'),
                value: _darkModeEnabled,
                onChanged: (bool value) {
                  setState(() {
                    _darkModeEnabled = value;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        value
                            ? 'Dark Mode enabled (Demo)'
                            : 'Light Mode enabled',
                      ),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),

            // Sound Switch
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SwitchListTile(
                secondary: const Icon(Icons.volume_up_outlined),
                title: const Text('Sound Effects'),
                subtitle: const Text('Play audio feedback on actions'),
                value: _soundEnabled,
                onChanged: (bool value) {
                  setState(() {
                    _soundEnabled = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 32),

            // Save Settings Button
            FilledButton.icon(
              onPressed: _saveSettings,
              icon: const Icon(Icons.save),
              label: const Text('Save Settings'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Back Button
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
