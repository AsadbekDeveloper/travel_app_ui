import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const mainAccent = Color.fromARGB(255, 13, 59, 75);
const mainWhite = Color.fromARGB(255, 240, 248, 251);
const cardGreen = Color.fromARGB(255, 220, 241, 174);
const cardBlue = Color.fromARGB(255, 177, 208, 229);
const bgWhite = Color.fromARGB(255, 219, 226, 230);

final mainHeader = GoogleFonts.bodoniModa(fontSize: 26);
final bodyDark = GoogleFonts.roboto(fontSize: 16, color: mainAccent);
final bodyWhite = GoogleFonts.roboto(fontSize: 16, color: mainWhite);

const categoryList = [
  'Suggested',
  'Touristic',
  'Authentic',
  'Arctic',
  'Tropic'
];

var placesList = [
  Place(
    name: 'Mykines Island',
    location: 'Faroe islands',
  ),
  Place(
    name: 'Bora Bora',
    location: 'French Polynesia',
  ),
  Place(
    name: 'Machu Picchu',
    location: 'Peru',
  ),
  Place(
    name: 'Great Barrier Reef',
    location: 'Australia',
  ),
  Place(
    name: 'Calton Hill',
    location: 'Scotland',
  ),
];

class Place {
  final String name;
  final String location;

  Place({required this.name, required this.location});
}
