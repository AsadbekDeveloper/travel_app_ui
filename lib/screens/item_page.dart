import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_ui/providers/data_provider.dart';
import '../constants.dart';

class CardItemPage extends StatelessWidget {
  final int index;
  final dataTypes type;
  const CardItemPage({
    super.key,
    required this.index,
    required this.type,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                      tag: data.name,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(80),
                        ),
                        child: Image.asset('assets/${data.image}.jpg',
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
                        backgroundColor: mainAccent.withAlpha(50),
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
                      data.name,
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
                            desc,
                            style: bodyDark,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      data.description,
                      style: descText,
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
