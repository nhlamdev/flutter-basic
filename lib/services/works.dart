import 'package:test/database/index.dart';
import 'package:uuid/uuid.dart';

import '../models/work.model.dart';

class WorkService {
  CustomDatabase customDatabase = CustomDatabase();
  final Uuid _uuid = const Uuid();

  Future<List<Works>> get() async {
    List<Works> result = [];

    List<Map<String, dynamic>> query = await customDatabase.query('works');

    for (var element in query) {
      Works work = Works(element);

      result.add(work);
    }

    return result;
  }

  add(String title, String summary, String dateCompelete,
      String importance) async {
    final uuid = _uuid.v4();

    final payload = {
      'id': uuid,
      'title': title,
      'summary': summary,
      'dateCompelete': dateCompelete,
      'importance': importance
    };

    await customDatabase.insert('works', payload);
  }
}
