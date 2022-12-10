import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const mainAccent = Color.fromARGB(255, 13, 59, 75);
const mainWhite = Color.fromARGB(255, 240, 248, 251);
const cardPink = Color(0xfffddfdf);
const cardYellow = Color(0xfffcf7de);
const cardGreen = Color(0xffdefde0);
const cardBlue = Color(0xffdef3fd);
const cardMagenta = Color(0xfff0defd);
const bgWhite = Color.fromARGB(255, 219, 226, 230);

final mainHeader = GoogleFonts.bodoniModa(fontSize: 26);
final bodyDark = TextStyle(fontSize: 16, color: mainAccent);
final descText = TextStyle(fontSize: 16, color: mainAccent);
final bodyWhite = TextStyle(fontSize: 16, color: mainWhite);

const categoryList = [
  'Shaharlar',
  'Bayramlar',
];

const colors = [cardPink, cardYellow, cardGreen, cardBlue, cardMagenta];

enum dataTypes {
  city,
  holiday,
}
