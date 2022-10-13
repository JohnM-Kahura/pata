import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pata/pages/Loan%20Application/item_upload.dart';
import 'package:pata/pages/Loan%20Application/loan_appeal.dart';
import 'package:pata/auth/login.dart';
import 'package:pata/widgets/custom_container.dart';

class LoanStatus extends StatefulWidget {
  const LoanStatus({super.key});

  @override
  State<LoanStatus> createState() => _LoanStatusState();
}

class _LoanStatusState extends State<LoanStatus> {
  static const bool isaccepted = true;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  // final user=FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
        backgroundColor: Colors.white.withOpacity(0.9),
        width: MediaQuery.of(context).size.width - 100,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
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
                        // user.uid,
                        '',
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ]),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LoanStatus()));
              },
              child: ListTile(
                title: Text(
                  'Loan Status',
                  style: GoogleFonts.poppins(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoanAppeal()));
              },
              child: ListTile(
                title: Text(
                  'Loan Appeal',
                  style: GoogleFonts.poppins(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Login()));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.green)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Sign Out',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => _key.currentState?.openDrawer(),
          icon: const Icon(Icons.menu),
          color: Colors.black,
        ),
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
      body: SingleChildScrollView(
        child: Column(
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
            if (isaccepted == true)
              clientContainer("Loan Status", "Accepted", 20),
            if (isaccepted == true)
              clientContainer("LOAN", "Being Processed", 20),
            if (isaccepted == true)
              clientContainer("Amount to disbursed", "6k", 20),
            if (isaccepted == true)
              Container(
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => const LoanAppeal()));
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
                              builder: (context) => const ItemUpload()));
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
            if (isaccepted == false) clientContainer('Loan Status', "denied", 20),
            if (isaccepted == false)
              clientContainer('Reason', "Lack of confidential details", 15),
            Column(
              children: [
                if (isaccepted == false)
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const ItemUpload()));
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
                Text(
                  "welcome  back to shikisha loan",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700, color: Colors.green),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
