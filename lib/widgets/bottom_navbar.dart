import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: mainWhite,
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  FaIcon(FontAwesomeIcons.house),
                  FaIcon(FontAwesomeIcons.map),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  FaIcon(FontAwesomeIcons.heart),
                  FaIcon(FontAwesomeIcons.magnifyingGlass),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
