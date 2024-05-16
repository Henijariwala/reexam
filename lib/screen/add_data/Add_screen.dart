import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marking_flutter/utils/global.dart';
import 'package:marking_flutter/utils/studModel.dart';


class AddStudScreen extends StatefulWidget {
  const AddStudScreen({super.key});

  @override
  State<AddStudScreen> createState() => _AddStudScreenState();
}

class _AddStudScreenState extends State<AddStudScreen> {

  TextEditingController txtName =TextEditingController();
  TextEditingController txtStd =TextEditingController();
  TextEditingController txtGrid =TextEditingController();

  GlobalKey<FormState> formKey =GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Detail"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Container(
            height: 550,
            width: 320,
            decoration: const BoxDecoration(
               color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  spreadRadius: 2
                )
              ]
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundImage: FileImage(File('$path')),
                        backgroundColor: Colors.grey,
                        radius: 70,
                        child: Align(
                          alignment: Alignment(0.9,0.9),
                          child: IconButton(onPressed: () async{
                            ImagePicker picker =ImagePicker();
                            XFile? image = await picker.pickImage(source: ImageSource.gallery);
                            setState(() {
                              path=image?.path;
                            });
                          }, icon: const Icon(Icons.camera_enhance_rounded),style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.blue),
                            foregroundColor: MaterialStatePropertyAll(Colors.white)
                          ),),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text("Name :",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter your name",
                        border: OutlineInputBorder(),
                      ),
                      controller: txtName,
                      textInputAction: TextInputAction.next,
                    ),
                    const Text("Standard :",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter your standard",
                        border: OutlineInputBorder(),
                      ),
                      controller: txtStd,
                      textInputAction: TextInputAction.next,
                    ),
                    const Text("Grid :",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter your grid",
                        border: OutlineInputBorder(),
                      ),
                      controller: txtGrid,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 10,),
                    Center(
                      child: FloatingActionButton(onPressed: () {
                        setState(() {
                              String? pname=txtName.text;
                              String? pstd=txtStd.text;
                              String? pgrid=txtGrid.text;
                              String? pPath=path;

                          StudentModel s1 =StudentModel(pname,pgrid, pstd, pPath);
                          studList.add(s1);
                          Navigator.pop(context);
                        });
                      },child: const Text("Save"),),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
