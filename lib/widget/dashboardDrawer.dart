import 'package:flutter/material.dart';

class DashboardDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280,
      child: Column(
        children: [
          Container(
            color: Colors.blueAccent,
            padding: const EdgeInsets.only(top: 40, bottom: 20, left: 16, right: 16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.png'), // Replace with your image
                  radius: 24,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Swati', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      Text('swati@gcstech.in', style: TextStyle(color: Colors.white70, fontSize: 12)),
                      Text('• Personal', style: TextStyle(color: Colors.orangeAccent, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(Icons.rocket_launch, 'Getting Started'),
                _buildDrawerItem(Icons.sync, 'Sync Data'),
                _buildDrawerItem(Icons.videogame_asset, 'Gamification'),
                _buildDrawerItem(Icons.send, 'Send Logs'),
                _buildDrawerItem(Icons.settings, 'Settings'),
                _buildDrawerItem(Icons.help_outline, 'Help?'),
                _buildDrawerItem(Icons.cancel, 'Cancel Subscription'),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 10, bottom: 5),
                  child: Text('App Info', style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
                ),
                _buildDrawerItem(Icons.info_outline, 'About Us'),
                _buildDrawerItem(Icons.policy_outlined, 'Privacy Policy'),
                _buildDrawerItem(Icons.verified, 'Version 1.01.52'),
                _buildDrawerItem(Icons.share, 'Share App'),
                _buildDrawerItem(Icons.logout, 'Logout'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        child: Icon(icon, size: 20, color: Colors.black87),
      ),
      title: Text(title, style: TextStyle(fontSize: 14)),
      onTap: () {
        // Add navigation logic
      },
    );
  }
}
