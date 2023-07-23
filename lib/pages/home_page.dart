import 'dart:io';
import 'package:chicken_sense/model/result_model.dart';
import 'package:chicken_sense/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../api/api_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override
  // void initState() {
  //   super.initState();
  // }
  late File selectedImage;
  late ResultCLass results;
  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    // .pickImage(source: ImageSource.camera);

    setState(() {
      if (image != null) {
        selectedImage = File(image.path);
      }
    });
    var resultApi = await ApiHelper()
        .submitSubscription(file: selectedImage, filename: selectedImage.path);
    setState(() {
      results = resultApi;
    });

    //return image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Image.asset('assets/upper_logo.png')],
          ),
          const Text(
            "SAVE THE LIFE",
            style: TextStyle(
                color: Colors.red, fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Column(
            children: [
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.blue[100]),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Text(
                      "Ketahui Kesehatan ayam \n dengan satu sentuhan",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 7,
                  right: MediaQuery.of(context).size.width / 7,
                  left: MediaQuery.of(context).size.width / 7,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                ),
              ]),
              // SizedBox(height: 25),

              SizedBox(
                height: 50,
                width: 200,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                      onPressed: () async {
                        await getImage();
                        if (context.mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultPage(
                                      result: results,
                                    )),
                          );
                        }
                      },
                      icon: const Icon(Icons.image),
                      label: const Text('Upload')),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
