import 'dart:convert';
import 'dart:io';
import 'package:chicken_sense/model/result_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ApiHelper {
  Future<ResultCLass> submitSubscription({
    required File file,
    required String filename,
  }) async {
    ///MultiPart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://192.168.1.47:8080/predict_image"),
    );

    request.files.add(
      http.MultipartFile(
        'uploaded_file',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: filename,
        contentType: MediaType('image', 'jpeg'),
      ),
    );

    var res = await request.send();
    String resBody = await res.stream.bytesToString();
    Map<String, dynamic> jsonData = json.decode(resBody);
    return ResultCLass.fromJson(jsonData);
  }
}
