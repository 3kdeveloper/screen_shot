import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_widget_screenshot/nextScreenPass.dart';
import 'package:flutter_widget_screenshot/screenImage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _screenkey = GlobalKey();

  Uint8List bytes;
  //todo Uncomment if your using files list
  // File file;

  List images = [];
  //todo Uncomment if your using files list
  // List files = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Take Screen Shot'),
      ),
      body: Column(
        children: [
          RepaintBoundary(
            key: _screenkey,
            child: Column(
              children: [
                //! if Screen overflowed in testing then decrease this size of Container
                Container(height: 100, color: Colors.red),
                Container(height: 100, color: Colors.green),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    //todo Add ScreenShot Functionallity Here
                    final bytesDa =
                        await ScreenImage.convertWidgetToImage(_screenkey);
                    setState(() {
                      bytes = bytesDa;
                      //todo Uncomment if your using files list
                      // File convert = File.fromRawPath(bytes);
                      images.add(bytes);
                      //todo Uncomment if your using files list
                      // files.add(convert);
                    });
                  },
                  child: Text('Take Screen Shot')),
              SizedBox(width: 40),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          //todo Uncomment if your using files list
                          // Pass files list to PassToList
                          builder: (context) => PassToList(
                            images, //files
                          ),
                        ));
                  },
                  child: Text('See Screen Shots')),
            ],
          ),

          Container(
            //todo if you Uncomment files list then change height to 150
            //! if Screen overflowed in testing then decrease this size
            height: 300,
            // color: Colors.yellow,
            child: images.length != null
                ? ListView.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      // return Image.file(images[index]);
                      return Image.memory(images[index]);
                    })
                : Container(
                    height: 30,
                    color: Colors.black,
                  ),
          ),

          //todo Uncomment if your using files list
          // Container(
          //   height: 150,
          //   // color: Colors.yellow,
          //   child: files.length != null
          //       ? ListView.builder(
          //           itemCount: files.length,
          //           itemBuilder: (context, index) {
          //             return Image.file(files[index]);
          //             // return Image.memory(images[index]);
          //           })
          //       : Container(
          //           height: 30,
          //           color: Colors.black,
          //         ),
          // ),
        ],
      ),
    );
  }
}
