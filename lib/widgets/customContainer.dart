  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Column clientContainer(String header ,String body,double bodyFont) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
    Container(
        margin: const EdgeInsets.all(10),
        child: Text(
          header,
          style: GoogleFonts.lato(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.green)),
        child: Text(body,style: GoogleFonts.lato(fontSize: bodyFont,  fontWeight: FontWeight.w600),),
        ),
  ],);
  }