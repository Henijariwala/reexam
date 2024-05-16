import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marking_flutter/utils/global.dart';
import 'package:marking_flutter/utils/studModel.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txName =TextEditingController();
  TextEditingController txStd =TextEditingController();
  TextEditingController txGrid =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, 'add').then((value) {
              setState(() {});
            },);
          }, icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: studList.length,
          itemBuilder: (context, index) {
            return title(index);
          },),
    );
  }
  Widget title(index)
  {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'data', arguments: studList[index]);
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 5
            ),
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: FileImage(File('${studList[index].image}')),
              ),
              const SizedBox(width: 10,),
              Column(
                children: [
                  Text("Name: ${studList[index].name}"),
                  Text("Standard: ${studList[index].std}"),
                  Text("Grid: ${studList[index].grid}"),
                ],
              ),
              const Spacer(),
              IconButton(onPressed: () {
                setState(() {
                  showDialog(context: context,
                      builder: (context) {
                       return  AlertDialog(
                          title: SingleChildScrollView(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 80,
                                  backgroundImage: FileImage(File('${studList[index].image}')),
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
                                const SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: 'Enter your name',
                                          border: OutlineInputBorder(),
                                        ),
                                        textInputAction: TextInputAction.next,
                                        controller: txName,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: 'Enter your name',
                                          border: OutlineInputBorder(),
                                        ),
                                        textInputAction: TextInputAction.next,
                                        controller: txStd,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: 'Enter your name',
                                          border: OutlineInputBorder(),
                                        ),
                                        textInputAction: TextInputAction.next,
                                        controller: txGrid,
                                      ),
                                    ),
                                  ],
                                ),
                                ElevatedButton(onPressed: () {
                                  String? sname=txName.text;
                                  String? sStd=txStd.text;
                                  String? sgrid=txGrid.text;
                                  String? sPath=path;
                            
                                  StudentModel s2 = StudentModel(sname, sStd, sgrid, sPath);
                            
                                  studList[index]=s2;
                                  Navigator.pop(context);
                                }, child: const Text("Save"))
                              ],
                            ),
                          ),
                        );
                      },);
                });
              }, icon: const Icon(Icons.update)),
              IconButton(onPressed: () {
                setState(() {
                  studList.removeAt(index);
                });
              }, icon: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
