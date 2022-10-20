import 'dart:io';
import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pata/pages/LoanApplication/loan_application.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const CameraPage({super.key, this.cameras});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;
  XFile? pictureFile;
  UploadTask? uploadTask;
final User? _user=FirebaseAuth.instance.currentUser;
  Future upLoadImage(XFile file) async {
    if (file == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Make sure to take an image of the collateral',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red));
    }
    
   try {
      final destination='Colateral_Images/${_user!.email??DateTime.now().toString()}.jpeg';
    final ref=FirebaseStorage.instance.ref().child(destination);
setState(() {
   uploadTask= ref.putFile(File(file.path));
  
});

   final snapshot=await uploadTask!.whenComplete(() => {});
   final urlDownload=await snapshot.ref.getDownloadURL();
   print('Download Link:$urlDownload' );
   setState(() {
     uploadTask=null;
   });
   } on FirebaseException catch (e) {
     ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          content: Text(
            e.message??'Error Uploading the Image',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red));
   }on Exception catch(e){
ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          content: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red));
   }
    
  }

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras![0], ResolutionPreset.high);
    controller.initialize().then((_) => {
          if (!mounted) {},
          setState(
            () {},
          )
        });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.green,
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take picture'),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
              ),
              // margin: const EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height-300,
              width: double.infinity,
              child: CameraPreview(controller),
            ),
            if (pictureFile == null)
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: captureImageButton("Capture Image")),
      
            if (pictureFile != null)
              Container(
                color: Colors.red,
                width: MediaQuery.of(context).size.width-50,
                height: 200,
                child: Image.file(
                  
                  File(pictureFile!.path),
                  width: double.infinity,
                  fit: BoxFit.fill
                ),
              ),
            //TODO: add an if statement to add web funtionality
            if (pictureFile == null)
              Text(
                'No image has been choosen yet',
                style: GoogleFonts.poppins(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            if (pictureFile != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () async{
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => const StudentIDUpload()));
                        // Navigator.of(context).pop();
                        if(pictureFile != null){
      
                        await upLoadImage(pictureFile!).then((value) =>Navigator.of(context).pushReplacement(MaterialPageRoute(
                           builder: (context) => const LoanApplication())));
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.green)),
                      child: Text(
                        "Upload Image",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: captureImageButton("Try Again"),
                  ),
                ],
              ),
              buildProgressBar(),
          ],
        ),
      ),
    );
  }

  TextButton captureImageButton(String title) {
    return TextButton(
      onPressed: () async {
        pictureFile = await controller.takePicture();
        setState(() {});
      },
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => Colors.green)),
      child: Text(
        title,
        style: GoogleFonts.poppins(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }
  Widget buildProgressBar()=>StreamBuilder<TaskSnapshot>(
    stream: uploadTask?.snapshotEvents,
    builder: (context, snapshot){
      if(snapshot.hasData){
final data=snapshot.data!;
double progress=data.bytesTransferred/data.totalBytes;
return  SizedBox(
  height: 50,
  child: Stack(fit: StackFit.expand,children: [LinearProgressIndicator(
    value: progress,
    backgroundColor: Colors.grey,
    color: Colors.green,
    
  ),
  Center(child: Text('${(100* progress).roundToDouble()}%',style: const  TextStyle(color: Colors.white),),)
  ],),

);
      }else{
        return SizedBox(height: 50,);
      }
    } );
}
