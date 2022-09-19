import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextButton customButton(String title) {
  return TextButton(
      onPressed: () => null,
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => Colors.green)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ));
}
