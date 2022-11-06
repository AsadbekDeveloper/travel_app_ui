import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

class CardItemPage extends StatelessWidget {
  final int index;
  const CardItemPage({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isGreen = index % 2 == 1;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: isGreen ? cardGreen : cardBlue),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: size.height * 2 / 3,
                    child: Hero(
                      tag: 'image$index',
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(80),
                        ),
                        child: Image.asset('assets/ (${index + 1}).jpg',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 50,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: CircleAvatar(
                        backgroundColor: mainWhite.withAlpha(30),
                        radius: 20,
                        child: const FaIcon(
                          FontAwesomeIcons.arrowLeft,
                          color: mainWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      placesList[index].name,
                      style: mainHeader,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
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
                    ),
                    Text(
                      Faker().lorem.sentences(30).toString(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
