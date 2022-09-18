import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Container customSearchBar(String hintText, BuildContext context) {
  return Container(
      margin: const EdgeInsets.all(40),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 20,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 150,
            child: TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              cursorColor: Colors.green,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: GoogleFonts.poppins(
                    color: Colors.black, fontWeight: FontWeight.w600),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
              ),
            ),
          ),
        ],
      ));
}
