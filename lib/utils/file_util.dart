import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:heic_to_jpg/heic_to_jpg.dart';
import 'package:path_provider/path_provider.dart';

class FileUtil {
  static String getFilename(String path) {
    return path.split('/').last;
  }

  static Future<File> downloadFile(String url, String filename) async {
    imageCache!.clear();
    var httpClient = new HttpClient();
    print("Util-downloadFile Uri.parse(${url})");
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    try {
      // if (await file.exists()) {
      //   await file.delete();
      // }
      await file.writeAsBytes(bytes);
      print("Util-downloadFile DONE");
    } catch (e) {
      print("Util-downloadFile ERROR: ${e.toString()}");
    }
    return file;
  }

  static Future<String> checkingFileFormat(String path) async {
    debugPrint("param-path: ${path}");
    String fileResult = "";

    String fileName = path.split('/').last;
    switch (fileName.split('.').last.toLowerCase()) {
      case 'jpg':
      case 'jpeg':
      case 'png':
        final Directory extDir = await getApplicationDocumentsDirectory();
        final String dirPath = '${extDir.path}/temp/job2go_files';
        await Directory(dirPath).create(recursive: true);
        final String filePath = '$dirPath/${DateTime.now().millisecondsSinceEpoch.toString()}.jpg';
        var result = await FlutterImageCompress.compressAndGetFile(path, filePath,
            quality: 50);
        fileResult = result!.path;
        break;
      case 'hevc':
      case 'heif':
      case 'heic':
        String? jpegPath = await HeicToJpg.convert(path);
        final Directory extDir = await getApplicationDocumentsDirectory();
        final String dirPath = '${extDir.path}/temp/job2go_files';
        await Directory(dirPath).create(recursive: true);
        final String filePath = '$dirPath/${DateTime.now().millisecondsSinceEpoch.toString()}.jpg';
        var result = await FlutterImageCompress.compressAndGetFile(jpegPath!, filePath,
            quality: 50);
        fileResult = result!.path;
        break;
      case 'doc':
      case 'docx':
      case 'pdf':
      fileResult = path;
        break;
      default:
    }
    return fileResult;
  }

  static Future<double> getFileSizeMB(String filepath) async {
    var file = File(filepath);
    final bytes = file.readAsBytesSync().lengthInBytes;
    double kb = bytes / 1024;
    double mb = kb / 1024;
    return mb;
  }

  static Future<double> getFileSizeKB(String filepath) async {
    var file = File(filepath);
    final bytes = file.readAsBytesSync().lengthInBytes;
    double kb = bytes / 1024;
    double mb = kb / 1024;
    return kb;
  }


}
