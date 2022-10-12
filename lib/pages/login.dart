import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pata/pages/loan_status.dart';
import 'package:pata/pages/search.dart';
import 'package:pata/pages/signup.dart';

import '../widgets/custom_text_feild.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey=GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isemailempty = false;
  bool ispasswordempty = false;

  Future signIn() async {
    if (emailController.text.isEmpty) {
      setState(() {
        isemailempty = true;
      });
      if (passwordController.text.isEmpty) {
        setState(() {
          ispasswordempty = true;
        });
      try{
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());
      }on FirebaseAuth catch(e) {
        print('*******************');
        print('The error is');
print(e);
      }
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/auth.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              loginContainer(formKey),
              Column(
                children: [
                  TextButton(
                      onPressed: () async {
                        await signIn();
                        print(emailController.text);
                        print(passwordController.text);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const LoanStatus()));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.green)),
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const SignUp()));
                    },
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: "Don't have an account ?",
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30)),
                          TextSpan(
                              text: 'sign up',
                              style: GoogleFonts.lato(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30))
                        ],
                      ),
                      textScaleFactor: 0.5,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const SignUp()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: "Forgot password ?",
                                style: GoogleFonts.lato(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 30)),
                            TextSpan(
                                text: '',
                                style: GoogleFonts.lato(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 30))
                          ],
                        ),
                        textScaleFactor: 0.5,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container loginContainer(GlobalKey formKey) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Form(
            key: formKey ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'User Login',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 22),
                ),
                customTextFeild("Email", emailController),
                customTextFeild("password", passwordController),
              ],
            ),
          )
        ],
      ),
    );
  }
}
