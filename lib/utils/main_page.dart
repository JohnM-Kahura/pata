import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pata/pages/loan_status.dart';
import 'package:pata/pages/login.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const LoanStatus();
          } else if (snapshot.hasError){
            // TODO:show better error messege to user
            const Center(
              child: Text('An Error occured please start the app again'));
          }else {
            return const Login();
          }
         return Text('eroor');
        },
      ),
    );
  }
