import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:play_around_flutter/personModel.dart';
import 'package:rxdart/rxdart.dart';
import 'newApi.dart' as newApi;

class PersonBloc {
  final _newController = PublishSubject<List<New>>();

  Observable<List<New>> get person {
    return _newController.stream;
  }

  Future<List<New>> fetchAndRefreshPerson() async {
    List<New> result = await newApi.getNews();
    _newController.sink.add(result);
    return result;
  }

  @override
  void dispose() {
    _newController.close();
  }
}

final personBloc = new PersonBloc();