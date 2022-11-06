import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/category_item.dart';
import '../widgets/place_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Discover new places',
              style: mainHeader,
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: (() => setState(() {
                        selectedIndex = index;
                      })),
                  child: CategoryItem(
                      title: categoryList[index],
                      isSelected: index == selectedIndex),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 3 / 5,
              child: ListView.builder(
                  clipBehavior: Clip.antiAlias,
                  scrollDirection: Axis.horizontal,
                  itemCount: placesList.length,
                  itemBuilder: ((context, index) => PlaceCard(index: index))),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          child: const FaIcon(
            FontAwesomeIcons.plus,
            size: 40,
          ),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: const Drawer(
        child: Center(
          child: Text('Hello'),
        ),
      ),
    );
  }
}
