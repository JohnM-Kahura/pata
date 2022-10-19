import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pata/pages/LoanApplication/item_upload.dart';
import 'package:pata/widgets/custom_text_feild.dart';


class MoreUserInfo extends StatefulWidget {
  const MoreUserInfo({super.key});

  @override
  State<MoreUserInfo> createState() => _MoreUserInfoState();
}

class _MoreUserInfoState extends State<MoreUserInfo> {
  TextEditingController fullnameController=TextEditingController();
  TextEditingController schoolIDController= TextEditingController();
  TextEditingController nationalIDController=TextEditingController();
  TextEditingController mobileController=TextEditingController();
  Future uploadData(String name,String schoolID,String nationalID,String mobileNumber)async{
   try{
     User? user =FirebaseAuth.instance.currentUser;
    CollectionReference collectionReference=FirebaseFirestore.instance.collection('Users');
    collectionReference.doc(user!.email).collection('User Info').add({"name":name,"School_ID":schoolID,"National_ID":nationalID,"Phone":mobileNumber});
   return 0;
   }on FirebaseException catch(e){
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message??'An Error Occured During Saving of the data please check internet connection'),backgroundColor:Colors.red));
   return 1;
   }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const  Text('More User Info'),centerTitle: true,elevation: 0,),
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: SizedBox(
   
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
            
                signUpFeild('Full Name', fullnameController),
                signUpFeild('Mobile Number', mobileController),
                signUpFeild('School ID', schoolIDController),
                signUpFeild('National ID', nationalIDController),
              ],),
              Column(
                children: [
                  TextButton(
          onPressed: () async {
            if(fullnameController.text.isEmpty||mobileController.text.isEmpty||schoolIDController.text.isEmpty
            ||nationalIDController.text.isEmpty){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Ensure all the text feilds have been feild"),backgroundColor:Colors.red));
            }
            var response=await uploadData(fullnameController.text.trim(), schoolIDController.text.trim(), nationalIDController.text.trim(), mobileController.text.trim());
            if(response==0){

            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ItemUpload()));
            }if(response==1){
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something went wrong please try again"),backgroundColor:Colors.red)); 
            }
          },
          style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.resolveWith((states) => Colors.green)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                  'Continue',
                  style: GoogleFonts.poppins(
                      fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),),
                ],
              ),
            ],
          ),
        ),
      ) ,
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
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(20),
          ),
          child: customTextFeild('', controller))
      ],
    );
  }
}
