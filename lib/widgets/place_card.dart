import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_ui/providers/city_model.dart';
import 'package:travel_app_ui/providers/data_provider.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/card_item_page.dart';

class PlaceCard extends StatelessWidget {
  final int index;
  final dataTypes type;
  const PlaceCard({super.key, required this.index, required this.type});

  @override
  Widget build(BuildContext context) {
    late final data;
    late final String desc;
    if (type == dataTypes.city) {
      data = Provider.of<DataProvider>(context, listen: false)
          .getCityByIndex(index);
      desc = data.region;
    } else {
      data = Provider.of<DataProvider>(context, listen: false)
          .getHolidayByIndex(index);
      desc = data.date;
    }
    final size = MediaQuery.of(context).size;

    bool isGreen = index % 2 == 1;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => CardItemPage(
                  index: index,
                  type: data.type,
                )),
          ),
        );
      },
      child: Container(
        width: 320,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colors[index % 5],
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
                    tag: data.name,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(70),
                        bottomRight: Radius.circular(15),
                      ),
                      child: Image.asset('assets/${data.image}.jpg',
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: CircleAvatar(
                    backgroundColor: mainAccent.withAlpha(50),
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
                  FittedBox(
                    child: Text(
                      data.name,
                      style: mainHeader,
                    ),
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
                        desc,
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
