import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pata/pages/login.dart';
import 'package:pata/widgets/custom_text_feild.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullnameContorller=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController password2Controller=TextEditingController();
  @override
  void dispose() {
    fullnameContorller.dispose();
    emailController.dispose();
    passwordController.dispose();
    password2Controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/auth.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Create Account',
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                signUpFeild('Full Name',fullnameContorller),
                signUpFeild('Email',emailController),
                signUpFeild('Password',passwordController),
                signUpFeild('Confirm Password',password2Controller),
                Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => const Login()));
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.green)),
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) =>const Login()));
                      },
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: "Already have an account ?",
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 30)),
                            TextSpan(
                                text: 'sign in',
                                style: GoogleFonts.lato(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 30))
                          ],
                        ),
                        textScaleFactor: 0.5,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column signUpFeild(String title,TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: Text(
            "$title:",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        customTextFeild('',controller)
      ],
    );
  }
}
