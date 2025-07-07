import 'package:flutter/material.dart';
import 'package:cstech_test/widget/dashboardDrawer.dart';
import 'chart_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, this.showAnalysis=false});
  final showAnalysis;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _showPopup = false;

  Drawer buildSideDrawer() {
    return Drawer(
      backgroundColor: Color.fromRGBO(235, 243, 248, 1.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/icons/profile.png'), // your image
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Swati", style: TextStyle(color: Colors.white, fontSize: 16)),
                        SizedBox(width: 6,),
                        Icon(Icons.brightness_1_rounded,size: 6,color: Colors.orange,),
                        SizedBox(width: 6,),
                        Text("Personal", style: TextStyle(color: Colors.orange, fontSize: 14,fontWeight: FontWeight.bold)),

                      ],
                    ),
                    Text("swati@gctech.in", style: TextStyle(color: Colors.white70, fontSize: 12)),
                  ],
                )
              ],
            ),
          ),
          _buildDrawerItem("assets/icons/navigations/gettingstart.png", "Getting Started"),
           _buildDrawerItem("assets/icons/navigations/sync.png", "Sync Data"),
          _buildDrawerItem("assets/icons/navigations/gamifications.png", "Gamification"),
          _buildDrawerItem("assets/icons/navigations/send_logs.png", "Send Logs"),
          _buildDrawerItem('assets/icons/navigations/setting.png', "Settings"),
          _buildDrawerItem('assets/icons/navigations/help.png', "Help?"),
          _buildDrawerItem("assets/icons/navigations/cancel_sub.png", "Cancel Subscription"),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("App Info", style: TextStyle(color: Colors.blue)),
          ),
          _buildDrawerItem('assets/icons/navigations/aboutus.png', "About Us"),
          _buildDrawerItem("assets/icons/navigations/privacypolicy.png", "Privacy Policy"),
          _buildDrawerItem("assets/icons/navigations/version.png", "Version 1.01.52"),
          _buildDrawerItem("assets/icons/navigations/shareapp.png", "Share App"),
          _buildDrawerItem("assets/icons/navigations/logout.png", "Logout"),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(String path, String title) {
    return ListTile(
      leading: ClipRRect(

        borderRadius: BorderRadiusGeometry.circular(20),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14.0,horizontal: 24),
          child: Image.asset(path),
        ) ,
      ),
      title: Text(title),
      onTap: () {
        // Implement your action here
      },
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: buildSideDrawer(),
      backgroundColor: Color.fromRGBO(235, 243, 248, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(235, 243, 248, 1.0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset("assets/icons/callSupport.png"),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset("assets/icons/notification.png"),
            onPressed: () {},
          ),
        ],
      ),
      body: widget.showAnalysis?DashboardBody(): InkWell(
        onTap: (){

          setState(() {
            _showPopup = !_showPopup;
          });
        },
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Greeting Card
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: const Color(0xFF247CFE),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.yellow.shade700,
                        child: Image.asset("assets/icons/profile.png"),
                      ),
                      title: const Text(
                        "Hello Swati",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      subtitle: const Text(
                        "Welcome to Calley!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF092E6E),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.zero,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 18.0),
                            child: Center(
                              child: Text(
                                'LOAD NUMBER TO CALL',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 15, top: 15),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 12),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Visit https://app.getcalley.com to upload\nnumbers that you wish to call using Calley Mobile App.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    Image.asset(
                                      alignment: Alignment.bottomLeft,
                                      'assets/icons/home_image.png',
                                      height: 200,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.green, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset("assets/icons/whatsaap_color.png"),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF247CFE),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: ()=>_showBottomSheet(context),

                          child: const Text(
                            "Start Calling Now",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 120), // leave space for popup
                ],
              ),
            ),


            if (_showPopup) _buildPopupDrawer(context),
          ],
        ),
      ),

       bottomNavigationBar:widget.showAnalysis?null: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F8FF),
              border: Border.all(color: const Color(0xFF247CFE), width: 1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
          ),
          Positioned(
            bottom: 1,
            left: 0,
            right: 0,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              selectedItemColor: const Color(0xFF247CFE),
              unselectedItemColor: Colors.black,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset("assets/icons/home.png", height: 24),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/icons/profile_.png", height: 24),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF247CFE),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset("assets/icons/playbutton.png",
                        height: 24, color: Colors.white),
                  ),
                  label: 'Play',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/icons/call.png", height: 24),
                  label: 'Call',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/icons/calender.png", height: 24),
                  label: 'Calendar',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // allows rounded corners
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.25,
          minChildSize: 0.1,
          maxChildSize: 0.4,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F0FE),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Select Calling List",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                          ),
                          onPressed: () {

                          },
                          icon: const Icon(Icons.refresh),
                          label: const Text("Refresh"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F0FE),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: const Text("Test List"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => DashboardScreen(showAnalysis: true,)),
                        );

                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildPopupDrawer(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Material(
        color: Colors.white,
        elevation: 10,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F7FE),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F0FE),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Select Calling List",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      onPressed: () {
                        // refresh logic
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text("Refresh"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F0FE),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: const Text("Test List"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // handle list tap
                  },
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
