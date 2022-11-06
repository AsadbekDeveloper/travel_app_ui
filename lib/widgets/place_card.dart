import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/card_item_page.dart';

class PlaceCard extends StatelessWidget {
  final int index;
  const PlaceCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    bool isGreen = index % 2 == 1;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => CardItemPage(index: index)),
          ),
        );
      },
      child: Container(
        width: 320,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isGreen ? cardGreen : cardBlue,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(80),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 10.0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset: const Offset(
                5.0, // Move to right 10  horizontally
                5.0, // Move to bottom 10 Vertically
              ),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: size.height * 3 / 7,
                  width: double.infinity,
                  child: Hero(
                    tag: 'image$index',
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(70),
                        bottomRight: Radius.circular(15),
                      ),
                      child: Image.asset('assets/ (${index + 1}).jpg',
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: CircleAvatar(
                    backgroundColor: mainWhite.withAlpha(30),
                    radius: 20,
                    child: const FaIcon(
                      FontAwesomeIcons.heart,
                      color: mainWhite,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    placesList[index].name,
                    style: mainHeader,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.mapLocation,
                        color: mainAccent,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        placesList[index].location,
                        style: bodyDark,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
