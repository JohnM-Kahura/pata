import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pata/auth/login.dart';
import 'package:pata/utils/utils.dart';
import 'package:pata/widgets/custom_text_feild.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullnameContorller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  Utils utils=Utils();
  Future signup() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text);
           return 1;
    } on FirebaseAuthException catch (e) {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          e.message ?? 'An error occured please try agin later',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ));
      return 0;
    }
  }

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height:MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/auth.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 50,),
              Text(
                'Create Account',
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
              // signUpFeild('Full Name', fullnameContorller),
              signUpFeild('Email', emailController),
              signUpFeild('Password', passwordController),
              
              Column(
                children: [
                  TextButton(
                      onPressed: ()async {
                          if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          
                          content: Text(
                            'Fill all of the feilds above',
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ));
                      } else {
                       var success=await signup();
                        if(success==1){
                          Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(
                                builder: (context) => const Login()));
                        }else{
ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'Something Went Wrong Check your credentials and try again',
        style: GoogleFonts.poppins(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    ));
                        }
                      }
                        
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
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const Login()));
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
    );
  }

  Column signUpFeild(String title, TextEditingController controller) {
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
        customTextFeild('', controller)
      ],
    );
  }
}
