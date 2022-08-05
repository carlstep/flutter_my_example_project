import 'package:flutter/material.dart';
import 'package:flutter_my_example_project/defaults/defaults.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

var contentPageIndex = 0;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final contentPage = [
    //TODO - create content for each of the pages
    const Center(
      child: Text('Personal Data'),
    ),
    const Center(
      child: Text('Contact Info'),
    ),
    const Center(
      child: Text('Skill Set'),
    ),
    const Center(
      child: Text('Interests'),
    ),
  ];

  VoidCallback updateState(int index) {
    return () {
      setState(() {
        contentPageIndex = index;
      });
      Navigator.pop(context);
    };
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.grey[600],
        appBar: AppBar(
          bottom: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.amber[300],
            ),
            tabs: [
              //TODO - create functionality for each of the tabs
              Tab(
                icon: Icon(
                  Defaults.drawerItemIcon[0],
                  color: Colors.grey[700],
                ),
              ),
              Tab(
                icon: Icon(
                  Defaults.drawerItemIcon[1],
                  color: Colors.grey[700],
                ),
              ),
              Tab(
                icon: Icon(
                  Defaults.drawerItemIcon[2],
                  color: Colors.grey[700],
                ),
              ),
              Tab(
                icon: Icon(
                  Defaults.drawerItemIcon[3],
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          title: const Text('My Flutter Project'),
        ),
        body: contentPage[contentPageIndex],
        endDrawer: Drawer(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: DrawerHeader(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                      ),
                      Text(
                        'My Name',
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'email@gmail.com',
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    AppDrawerListTile(
                      index: 0,
                      onTap: updateState(0),
                    ),
                    AppDrawerListTile(
                      index: 1,
                      onTap: updateState(1),
                    ),
                    AppDrawerListTile(
                      index: 2,
                      onTap: updateState(2),
                    ),
                    AppDrawerListTile(
                      index: 3,
                      onTap: updateState(3),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: contentPageIndex,
          onTap: updateState,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Defaults.drawerItemIcon[0],
              ),
              label: Defaults.drawerItemText[0],
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Defaults.drawerItemIcon[1],
              ),
              label: Defaults.drawerItemText[1],
            ),
          ],
        ),
        //TODO - update FAB to do something - change TabBarView or change Page color
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState() {}
            ;
          },
          label: const Text('Save'),
        ),
      ),
    );
  }
}

class AppDrawerListTile extends StatelessWidget {
  const AppDrawerListTile({
    Key? key,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: ListTile(
        onTap: onTap,
        selected: contentPageIndex == index,
        leading: Icon(Defaults.drawerItemIcon[index]),
        title: Text(Defaults.drawerItemText[index]),
      ),
    );
  }
}
