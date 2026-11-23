import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar: Menu & Search button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _CircleIconButton(
                    icon: Icons.menu,
                    onTap: () {
                      // TODO: aksi tombol menu
                    },
                  ),
                  _CircleIconButton(
                    icon: Icons.search,
                    onTap: () {
                      // TODO: aksi tombol search
                    },
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // Title: Settings
              const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A1A),
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 24),

              // List menu utama
              _SettingsMenuItem(
                icon: Icons.person_outline,
                title: 'Profile settings',
                subtitle: 'Settings regarding your profile',
                onTap: () {},
              ),
              _SettingsMenuItem(
                icon: Icons.newspaper,
                title: 'News settings',
                subtitle: 'Choose your favourite topics',
                onTap: () {},
              ),
              _SettingsMenuItem(
                icon: Icons.notifications_none,
                title: 'Notifications',
                subtitle: 'When would you like to be notified',
                onTap: () {},
              ),
              _SettingsMenuItem(
                icon: Icons.folder_open,
                title: 'Subscriptions',
                subtitle: 'Currently, you are in Starter Plan',
                onTap: () {},
              ),

              const SizedBox(height: 16),

              // Section: Other
              const Text(
                'Other',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 16),

              _SettingsMenuItem(
                icon: Icons.bug_report_outlined,
                title: 'Bug report',
                subtitle: 'Report bugs very easy',
                onTap: () {},
              ),
              _SettingsMenuItem(
                icon: Icons.share_outlined,
                title: 'Share the app',
                subtitle: 'Share on social media networks',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleIconButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300, width: 1.2),
        ),
        child: Icon(icon, color: Colors.black87, size: 22),
      ),
    );
  }
}

class _SettingsMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SettingsMenuItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.black87, size: 22),
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
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.arrow_forward,
              size: 18,
              color: Colors.grey.shade500,
            ),
          ],
        ),
      ),
    );
  }
}