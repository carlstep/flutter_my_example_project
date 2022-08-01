import 'package:flutter/material.dart';
import 'package:flutter_my_example_project/defaults/defaults.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

var contentPageIndex = 0;

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final contentPage = [
    Center(
      child: Text('Personal Data'),
    ),
    Center(
      child: Text('Contact Info'),
    ),
    Center(
      child: Text('Skill Set'),
    ),
    Center(
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
    return Scaffold(
      appBar: AppBar(
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
                    CircleAvatar(
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
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.abc_outlined),
            label: 'label1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc_outlined),
            label: 'label2',
          ),
        ],
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
