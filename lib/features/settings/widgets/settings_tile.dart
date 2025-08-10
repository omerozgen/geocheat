import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingsTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.blueAccent, size: 24),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey[600], fontSize: 14),
      ),
      trailing: trailing,
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}
