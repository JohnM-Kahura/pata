

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoanAppeal extends StatefulWidget {
  const LoanAppeal({super.key});

  @override
  State<LoanAppeal> createState() => _LoanAppealState();
}

class _LoanAppealState extends State<LoanAppeal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Appeal Loan',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(),
    );
  }
}