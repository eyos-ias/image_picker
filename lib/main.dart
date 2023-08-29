import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Artificial intellignece')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                elevation: 2,
                child: Text('Pick from Gallery'),
                onPressed: () {
                  _pickImageFromGallery();
                },
                color: Colors.green,
              ),
              MaterialButton(
                elevation: 2,
                child: Text('Pick from Camera'),
                onPressed: () {},
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              selectedImage != null
                  ? Image.file(selectedImage!)
                  : Text("please select and image")
            ],
          ),
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) {
      return;
    }
    setState(() {
      selectedImage = File(returnedImage!.path);
    });
  }
}
