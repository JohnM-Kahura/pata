import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pata/pages/LoanStatus/loan_status.dart';
import 'package:pata/widgets/custom_container.dart';


class LoanApplication extends StatefulWidget {
  const LoanApplication({super.key});

  @override
  State<LoanApplication> createState() => _LoanApplicationState();
}

class _LoanApplicationState extends State<LoanApplication> {
  TextEditingController amountController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  String amountWithIntrest='';
  String dropdownValue = 'One week';
  int getAmountWithIntrest(String amount) {
    if (amount.isNotEmpty) {
      int amount_int = int.parse(amount);
      double interest_double = amount_int * 0.20;
      int interest=interest_double.truncate();
      print(interest);
      print(amount_int+interest);
      return amount_int + interest;
    } else {
      return 0;
    }
  }

  Future uploadLoanRequest(String loanAmount, String toPay) async {
    try {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('Users');
      collectionReference.doc(user!.email).collection('Loans').doc('current loan').set({
        "Loan Amount": loanAmount,
        "To pay": toPay,
        "Application Date": DateTime.now(),
        "Loan Status":'Application Sent',
        "Loan":"Pending Approval"
      });
      return  0;
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message ??
              'An Error Occured During Saving of the data please check internet connection'),
          backgroundColor: Colors.red));
          return 1;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()), backgroundColor: Colors.red));
    return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,title:const  Text('Application Form',style: TextStyle(color: Colors.black),),centerTitle: true,elevation: 0,),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
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
                      user!.email ?? 'John Doe',
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
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
                  child:TextFormField(
      validator: (value){
        if(value!.isEmpty){
              return " field Cannot be empty";
        }
      },
      onChanged: (value) {
        setState(() {
          amountWithIntrest=getAmountWithIntrest(value).toString();
        });
      },
     controller: amountController,
     keyboardType: TextInputType.number,
     textInputAction: TextInputAction.done,
      cursorColor: Colors.green,
      decoration: InputDecoration(
        hintText: '',
      
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
    ),)
            ],
          ),
          clientContainer("Loan Duration", "One Week", 15),
          clientContainer("Loan + 20% interest",
              getAmountWithIntrest(amountController.text.trim()).toString(), 25),
          TextButton(
              onPressed: ()async {
                if(amountController.text.trim().isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Fill The Amount You want to borrow'),backgroundColor:Colors.red));
                }
                var response=await uploadLoanRequest(amountController.text.trim(), getAmountWithIntrest(amountController.text.trim()).toString());
               if(response==0&&amountController.text.trim().isNotEmpty){
      
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const LoanStatus()));
               }if(response==1){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something went Wrong Please try again'),backgroundColor:Colors.red));
      
               }
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
      ),
    );
  }
}
