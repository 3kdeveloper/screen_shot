import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

class ScreenImage {
  static Future convertWidgetToImage(GlobalKey key) async {
    if (key != null) {
      RenderRepaintBoundary renderRepaintBoundary =
          key.currentContext.findRenderObject();
      ui.Image boxImage = await renderRepaintBoundary.toImage(pixelRatio: 1);
      ByteData byteData =
          await boxImage.toByteData(format: ui.ImageByteFormat.png);
      Uint8List uint8list = byteData.buffer.asUint8List();
      //todo I also try this but not working
      // File img = File.fromRawPath(uint8list);
      // return img;
      return uint8list;
    }
  }
}
