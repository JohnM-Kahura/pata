import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Utils {
  final messengerKey=GlobalKey<ScaffoldMessengerState>();
 showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(
        text,
        style: GoogleFonts.poppins(color: Colors.white),
      ),
      backgroundColor: Colors.red,
      
    );
    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
