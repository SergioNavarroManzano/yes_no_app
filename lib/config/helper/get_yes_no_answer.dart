import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/massage.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesnoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}
