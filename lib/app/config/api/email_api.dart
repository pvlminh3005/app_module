import 'package:app_module/app/data/model/email_model.dart';
import 'package:dio/dio.dart';

final String mainUrl = 'https://agrichapp.herokuapp.com/mail';

class EmailApi {
  static Dio dio = Dio();

  factory EmailApi() {
    return _instance;
  }

  EmailApi._internal();
  static final EmailApi _instance = EmailApi._internal();

  static Future fetchEmails() async {
    try {
      var response = await dio.get(mainUrl);

      if (response.statusCode == 200) {
        return (response.data as List<dynamic>)
            .map((data) => EmailModel.fromJson(data));
      }
    } on DioError {
      return [];
    }
  }
}
