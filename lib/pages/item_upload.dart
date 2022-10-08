import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pata/pages/camera_page.dart';
import 'package:pata/pages/national_id_upload.dart';
import 'package:pata/widgets/custom_button.dart';

class ItemUpload extends StatefulWidget {
  const ItemUpload({super.key});

  @override
  State<ItemUpload> createState() => _ItemUploadState();
}

class _ItemUploadState extends State<ItemUpload> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              customButton("Welcome"),
              customButton("Upload image of the item for collateral"),
              GestureDetector(
                onTap: () async {
                  await availableCameras().then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CameraPage(cameras: value))));
                },
                child: SizedBox(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.camera_alt,
                        size: 30,
                        color: Colors.green,
                      ),
                      Text(
                        "Take Picture",
                        style: GoogleFonts.poppins(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              TextButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>const NationalIDUpload())),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.green)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Proceed",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
