import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pata/widgets/customTextFeild.dart';


class LoanApplication extends StatefulWidget {
  const LoanApplication({super.key});

  @override
  State<LoanApplication> createState() => _LoanApplicationState();
}

class _LoanApplicationState extends State<LoanApplication> {
  String dropdownValue = 'One week';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
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
          child: Text('John Doe',style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w700),),
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
          child: customTextFeild('')),
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.green)),
          child: DropdownButton<String>(
      value: dropdownValue,
      icon:const  Icon(Icons.arrow_drop_down_circle),
      iconSize: 30,
      elevation: 16,
      style: const TextStyle(color: Colors.teal),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Three', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    )),

      ],
    ),
 
      ]),
    );
  }
}
