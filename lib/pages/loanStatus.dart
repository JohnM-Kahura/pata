import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pata/pages/itemUpload.dart';
import 'package:pata/pages/loanAppeal.dart';
import 'package:pata/widgets/customContainer.dart';

class LoanStatus extends StatefulWidget {
  const LoanStatus({super.key});

  @override
  State<LoanStatus> createState() => _LoanStatusState();
}

class _LoanStatusState extends State<LoanStatus> {
  static const bool IsAccepted = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Loan Status',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50)),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'John Doe',
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ),
                ]),
          ),
          if (IsAccepted == true)
            clientContainer("Loan Status", "Accepted", 20),
          if (IsAccepted == true)
            clientContainer("LOAN", "Being Processed", 20),
          if (IsAccepted == true)
            clientContainer("Amount to disbursed", "6k", 20),
          if (IsAccepted == true)
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoanAppeal()));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.green)),
                      child: Text(
                        'Appeal Loan',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => ItemUpload()));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.green)),
                      child: Text(
                        'New Application',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      )),
                ],
              ),
            ),
          if (IsAccepted == false) clientContainer('Loan Status', "denied", 20),
          if (IsAccepted == false)
            clientContainer('Reason', "Lack of confidential details", 15),
  
            Column(children: [
              if (IsAccepted == false)
              TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => ItemUpload()));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.white)),
              child: Text(
                'Try Again',
                style: GoogleFonts.poppins(
                    color: Colors.black, fontWeight: FontWeight.w600),
              ),
            ),
            
        Text("welcome  back to shikisha loan",style: GoogleFonts.poppins(fontWeight: FontWeight.w700,color: Colors.green),)
            ],)
        ],
        
      ),
    );
  }
}
