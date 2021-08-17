import 'package:flutter/material.dart';

class PassToList extends StatelessWidget {
  final List images;
  //todo Uncomment if your using files list
  // final List files;

  PassToList(
    this.images,
    //todo Uncomment if your using files listthis.
    //this.files,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Data'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Take ScreenShot Again')),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: images.length,
              itemBuilder: (context, index) {
                // return Image.file(images[index]);
                return Image.memory(images[index]);
              }),

          //todo Uncomment if your using files listthis.
          // ListView.builder(
          //     shrinkWrap: true,
          //     physics: NeverScrollableScrollPhysics(),
          //     itemCount: files.length,
          //     itemBuilder: (context, index) {
          //       return Image.file(images[index]);
          //       // return Image.memory(images[index]);
          //     }),
        ],
      ),
    );
  }
}
