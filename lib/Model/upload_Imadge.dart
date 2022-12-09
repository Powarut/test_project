import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/constants/color.dart';

class uploadImage extends StatefulWidget {
  const uploadImage({Key? key}) : super(key: key);

  @override
  State<uploadImage> createState() => _uploadImageState();
}

class _uploadImageState extends State<uploadImage> {
  PlatformFile? pickedFile;

  Future selectFile() async{
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }
  Future uploadFile() async{
    final path = 'menu/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref =FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ownerColor,
        title: Text("อัพโหลดรูปภาพ"),
      ),
      body: Center(
        child: Column(
          children: [
            if (pickedFile != null)
              Expanded(
                child: Container(
                  color: Colors.blue[200],
                  child: Center(
                    child: Image.file(
                      File(pickedFile!.path!),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 32),
            ElevatedButton(
                onPressed: selectFile,
                child: const Text('Select File'),
            ),
            SizedBox(
              height: 32,
            ),
            ElevatedButton(
                onPressed: uploadFile,
                child: const Text('Upload File')
            ),
          ],
        ),
      ),
    );
  }
}
