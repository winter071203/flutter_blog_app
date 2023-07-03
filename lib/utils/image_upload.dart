
import 'dart:io';

import 'package:cloudinary_flutter/cloudinary_context.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> imageUpload(dynamic file) async{
  CloudinaryContext.cloudinary = Cloudinary.fromCloudName(cloudName: 'noze-blog');
  var data = await upload(file);
  return data['url'];
}

upload(dynamic file) async{
  final base64Img = base64Encode(file.readAsBytesSync());
  final res = await http.post(Uri.parse('https://api.cloudinary.com/v1_1/noze-blog/upload')
    , body: {
      'file': 'data:image/png;base64,$base64Img',
      'cloud_name': 'noze-blog',
      'upload_preset': 'wi5uwxua',
    }
  );
  print('res: ${res.body}');
  return jsonDecode(res.body);
}