import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pata/pages/search.dart';
import 'package:pata/pages/signup.dart';

import '../widgets/customTextFeild.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            loginContainer(),
            Column(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Searchpage()));
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
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => SignUp()));
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
              ],
            )
          ],
        ),
      ),
    );
  }

  Container loginContainer() {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'User Login',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 22),
              ),
              customTextFeild("Email",emailController),
              customTextFeild("password",passwordController),
            ],
          )
        ],
      ),
    );
  }
}
