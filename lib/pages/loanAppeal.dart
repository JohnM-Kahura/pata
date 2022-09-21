import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pata/widgets/customContainer.dart';

class LoanAppeal extends StatefulWidget {
  const LoanAppeal({super.key});

  @override
  State<LoanAppeal> createState() => _LoanAppealState();
}

class _LoanAppealState extends State<LoanAppeal> {
  String appealStatus="Approved";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Loan Appeal',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
if(appealStatus=='No Appeal')
          clientContainer('Appeal Status', 'No appeal request has been sent', 15),
          if(appealStatus=='No Appeal')
          Container(margin: const EdgeInsets.all(10),child: Text('You need to send an appeal request to us',),),
          if(appealStatus=='No Appeal')
          
          SizedBox(height: MediaQuery.of(context).size.height-420,) ,
          if(appealStatus=='No Appeal')
           Container(
            margin: const EdgeInsets.all(10),
             child: TextButton(
      onPressed: () => null,
      style: ButtonStyle(
          backgroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.green)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Start Appeal',
          style: GoogleFonts.poppins(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      )),
           ),
        if(appealStatus=="Pending")
         clientContainer('Appeal Status', 'Pending Approval', 15),
         if(appealStatus=="Pending")
          Container(margin: const EdgeInsets.all(10),child: Text('Please kindly wait appproval from the admin',),),
          if(appealStatus=="Approved")
         clientContainer('Appeal Status', 'Approved', 15),
         if(appealStatus=="Approved")
          Container(margin: const EdgeInsets.all(10),child: Text('''
you appeal request  has been accepted 
kindly pay the interest  for approval
 to be verified
''',),),
 if(appealStatus=="Approved")
         clientContainer('Interest', 'ksh600', 15),
         if(appealStatus=="Approved")
Container(
            margin: const EdgeInsets.all(10),
             child: TextButton(
      onPressed: () =>null,
      style: ButtonStyle(
          backgroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.green)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Pay',
          style: GoogleFonts.poppins(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      )),
           ),
        ],
      ),
    );
  }
}