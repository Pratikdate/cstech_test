import 'package:cstech_test/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:get/get.dart';

class DashboardBody extends StatelessWidget {
   DashboardBody({super.key});

  final DashboardController controller = Get.put(DashboardController());


  @override
  Widget build(BuildContext context) {



    return FutureBuilder<dynamic>(
      future: controller.fetchListId(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final data = snapshot.data;
        final total = data['pending'] + data['called'] + data['rescheduled'];

        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Test List",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        Row(
                          children: [
                            Text("$total",
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold)),
                            const Text(" calls",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                        color: Colors.blue,
                        child: const Text("S",
                            style: TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              SizedBox(
                height: 400,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 8,
                    borderData: FlBorderData(show: false),
                    centerSpaceRadius: 40,
                    sections: [
                      PieChartSectionData(
                        color: Colors.orange,
                        value: data['pending'].toDouble(),
                        title: '',
                        radius: 60,
                      ),
                      PieChartSectionData(
                        color: Colors.blue,
                        value: data['called'].toDouble(),
                        title: '',
                        radius: 80,
                      ),
                      PieChartSectionData(
                        color: Colors.purple,
                        value: data['rescheduled'].toDouble(),
                        title: '',
                        radius: 60,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatusCard(title: "Pending", count: data['pending'], color: Colors.orange),
                  StatusCard(title: "Done", count: data['called'], color: Colors.green),
                  StatusCard(title: "Schedule", count:  data['rescheduled'], color: Colors.purple),
                ],
              ),
              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Start Calling Now", style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}


class StatusCard extends StatelessWidget {
  final String title;
  final int count;
  final Color color;
  const StatusCard({
    super.key,
    required this.title,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 2,
              height: 30,
              color: color,
            ),
            SizedBox(width: 10,),
            Column(
              children: [
                Text(title,
                    style: TextStyle(fontSize: 14, color: color, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text("$count", style: const TextStyle(fontSize: 24)),
                    SizedBox(width: 4,),
                    Text("Calls", style: const TextStyle(fontSize: 13)),
                  ],
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SideNavigationDrawer extends StatelessWidget {
  const SideNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280,
      child: SafeArea(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              accountName: Text("Swati"),
              accountEmail: Text("swatik@cstech.in"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/user.png'), // or use NetworkImage
              ),
            ),
            drawerItem(Icons.flag, "Getting Started"),
            drawerItem(Icons.sync, "Sync Data"),
            drawerItem(Icons.star, "Gamification"),
            drawerItem(Icons.send, "Send Logs"),
            drawerItem(Icons.settings, "Settings"),
            drawerItem(Icons.help, "Help?"),
            drawerItem(Icons.cancel, "Cancel Subscription"),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("App Info", style: TextStyle(color: Colors.blue)),
              ),
            ),
            drawerItem(Icons.info_outline, "About Us"),
            drawerItem(Icons.privacy_tip, "Privacy Policy"),
            drawerItem(Icons.verified_user, "Version 1.01.52"),
            drawerItem(Icons.share, "Share App"),
            drawerItem(Icons.logout, "Logout"),
          ],
        ),
      ),
    );
  }

  Widget drawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {},
    );
  }
}
