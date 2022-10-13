import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pata/auth/forgot_password.dart';
import 'package:pata/pages/LoanStatus/loan_status.dart';
import 'package:pata/auth/signup.dart';
import 'package:pata/utils/utils.dart';

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
  Utils utils=Utils();
  Future signIn() async {
  
     try{
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());
      }on FirebaseAuthException catch(e) {
        print('*******************');
        print('The error is');
        print(e);
utils.showSnackBar(e.message);
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
        height: MediaQuery.of(context).size.height,
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
             const  SizedBox(height: 50,),
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
                  const SizedBox(height: 50,),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ForgotPassword()));
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
