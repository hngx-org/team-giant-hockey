import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_giant_hockey/widgets/size_config.dart';

Text customJustifiedText({
  required String inputText,
  required double fontSize,
  required FontWeight weight,
  required Color colorName,
}) {
  return Text(
    inputText,
    textAlign: TextAlign.justify,
    style: GoogleFonts.abhayaLibre(
        fontSize: getProportionateScreenWidth(fontSize),
        fontWeight: weight,
        color: colorName),
  );
}

Text customNormalText({
  required String inputText,
  required double fontSize,
  required FontWeight weight,
  required Color colorName,
}) {
  return Text(
    inputText,
    style: GoogleFonts.abhayaLibre(
        fontSize: getProportionateScreenWidth(fontSize),
        fontWeight: weight,
        color: colorName),
  );
}

Text customCentreText({
  required String inputText,
  required double fontSize,
  required FontWeight weight,
  required Color colorName,
}) {
  return Text(
    inputText,
    textAlign: TextAlign.center,
    style: GoogleFonts.abhayaLibre(
        fontSize: getProportionateScreenWidth(fontSize),
        fontWeight: weight,
        color: colorName),
  );
}
