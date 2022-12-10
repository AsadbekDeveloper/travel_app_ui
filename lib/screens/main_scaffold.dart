import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app_ui/screens/home_page.dart';
import '../constants.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.barsStaggered,
              color: mainAccent,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        toolbarHeight: 80,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/60?img=8'),
              radius: 20,
            ),
          ),
        ],
      ),
      body: HomePage(),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: mainAccent,
        unselectedItemColor: mainAccent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              (selectedIndex == 0) ? Icons.home : Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              (selectedIndex == 1)
                  ? Icons.favorite
                  : Icons.favorite_outline_outlined,
            ),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              (selectedIndex == 2) ? Icons.search : Icons.search_outlined,
            ),
            label: 'Search',
          ),
        ],
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
      drawer: const Drawer(
        child: Center(
          child: Text('Salom'),
        ),
      ),
    );
  }
}
