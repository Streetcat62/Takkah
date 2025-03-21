import 'dart:io';
import 'dart:math';
import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../presentation/styles/style.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'app_constants.dart';

class ImageCropperMarker {
  Future<BitmapDescriptor> resizeAndCircle(String? imageURL, int size) async {
    final File imageFile = await _urlToFile(imageURL);
    final Uint8List byteData = imageFile.readAsBytesSync();
    final ui.Image image = await _resizeAndConvertImage(byteData, size, size);
    return _paintToCanvas(image, ui.Size.zero);
  }

  Future<File> _urlToFile(String? imageUrl) async {
    final rd = Random();
    final Directory tempDir = await getTemporaryDirectory();
    final String tempPath = tempDir.path;
    final File file = File('$tempPath${rd.nextInt(100)}.png');
    final http.Response response =
        await http.get(Uri.parse('${AppConstants.imageBaseUrl}/$imageUrl'));
    await file.writeAsBytes(response.bodyBytes);
    return file;
  }

  Future<ui.Image> _resizeAndConvertImage(
    Uint8List? data,
    int height,
    int width,
  ) async {
    ByteData bytes = await rootBundle.load('assets/image/sundaymart_logo.png');
    final img.Image? baseSizeImage =
        img.decodeImage(data ?? bytes.buffer.asUint8List());
    final img.Image? newSizeImage = img.decodeImage(bytes.buffer.asUint8List());
    final img.Image resizeImage = img.copyResize(baseSizeImage ?? newSizeImage!,
        height: height, width: width);
    final ui.Codec codec = await ui
        .instantiateImageCodec(Uint8List.fromList(img.encodePng(resizeImage)));
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }

  Future<BitmapDescriptor> _paintToCanvas(ui.Image image, ui.Size size) async {
    final pictureRecorder = ui.PictureRecorder();
    final canvas = ui.Canvas(pictureRecorder);
    final paint = ui.Paint();
    paint.isAntiAlias = true;

    _performCircleCrop(image, size, canvas);

    final recordedPicture = pictureRecorder.endRecording();
    ui.Image img = await recordedPicture.toImage(image.width, image.height);
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    final buffer = byteData?.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(buffer!);
  }

  ui.Canvas _performCircleCrop(ui.Image image, ui.Size size, ui.Canvas canvas) {
    ui.Paint paint = ui.Paint();
    canvas.drawCircle(const ui.Offset(0, 0), 0, paint);

    double drawImageWidth = 0;
    double drawImageHeight = 0;
    double imageW = image.width.toDouble();
    double imageH = image.height.toDouble();
    final ui.Path path = ui.Path()
      ..addOval(
        ui.Rect.fromLTRB(
          drawImageWidth + imageW / 8,
          drawImageHeight + imageH / 8,
          imageW - imageW / 8,
          imageH - imageH / 8,
        ),
      );
    canvas.drawRRect(
      ui.RRect.fromRectAndRadius(
        ui.Rect.fromLTRB(
          drawImageWidth,
          drawImageHeight,
          imageW,
          imageH,
        ),
        ui.Radius.circular(imageW / 4),
      ),
      ui.Paint()
        ..color = Style.white.withOpacity(0.75)
        ..imageFilter = ui.ImageFilter.blur(sigmaX: 7, sigmaY: 7),
    );
    canvas.clipPath(path);
    canvas.drawImage(
        image, ui.Offset(drawImageWidth, drawImageHeight), ui.Paint());
    return canvas;
  }
}
