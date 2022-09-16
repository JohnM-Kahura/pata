import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Column(
        children: [
          // Container(
          //   height: double.infinity,
          //   width: double.infinity,
          //   color: Colors.black.withOpacity(0.7),
          // ),
          Column(
            children: [
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Text('Shikisha loan with Goods',style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold),),
                     Text(
                        'We solve your financial problemsby giving you a loan after offering an item as colateral')
                  ],
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
