import 'package:flutter/material.dart';
import 'package:pata/widgets/customButtom.dart';

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
              customButton("Verify"),
            ],
          ),
        ),
      ),
    );
  }
}
