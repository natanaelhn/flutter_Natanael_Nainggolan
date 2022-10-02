import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

class MyFile{
  final String fileName;
  final File? file;
  final Uint8List? fileStream;

  MyFile({required this.fileName, this.file, this.fileStream});

  //This is recommended for Web
  //Cant be used for Web platform
  static Future<MyFile?> pickFileForWeb() async{
    final FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null) return null;
    final var1 = result.files.first.name;
    final var2 = result.files.first.bytes;

    return MyFile(fileName: var1, fileStream: var2);

  }
  //This is recommended for Android, iOS, Windows, Linux, macOS
  //Can't be used for Web platform
  static Future<MyFile?> pickFile() async{
    final FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null) return null;
    
    final var1 = result.files.first;
    final File var2 = File(var1.path!);

    return MyFile(fileName: var1.name, file: var2);
    
  }
}