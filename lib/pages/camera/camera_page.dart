import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pata/pages/LoanApplication/student_id_upload.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const CameraPage({super.key, this.cameras});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;
  XFile? pictureFile;
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
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 200,
              width: double.infinity,
              child: CameraPreview(controller),
            ),
          ),
          if (pictureFile == null)
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: captureImageButton("Capture Image")),

          if (pictureFile != null)
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.file(
                File(pictureFile!.path),
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
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>const StudentIDUpload() ));
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
            )
        ],
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
}
