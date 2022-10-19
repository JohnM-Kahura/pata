import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pata/pages/LoanStatus/loan_status.dart';
import 'package:pata/widgets/custom_container.dart';
import 'package:pata/widgets/custom_text_feild.dart';


class LoanApplication extends StatefulWidget {
  const LoanApplication({super.key});

  @override
  State<LoanApplication> createState() => _LoanApplicationState();
}

class _LoanApplicationState extends State<LoanApplication> {
  TextEditingController amountController=TextEditingController();
  User? user= FirebaseAuth.instance.currentUser;
  String dropdownValue = 'One week';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
    Container(
      margin:const EdgeInsets.only(top: 40),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(50)),
          child:const  Icon(Icons.person, color: Colors.white, size: 40,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(user!.email??'John Doe',style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w700),),
        ),
      ]),
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: Text(
            "input the amount",
            style: GoogleFonts.lato(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.green)),
          child: customTextFeild('',amountController)),
        


      ],
    ),
    clientContainer("Loan Duration","One Week",15),
    clientContainer("20% interest","6000",25),
    TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoanStatus()));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.green)),
                    child: Text(
                      'Submit',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    )),
 
      ]),
    );
  }


}
