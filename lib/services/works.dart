import 'package:test/database/index.dart';
import 'package:uuid/uuid.dart';

import '../models/work.model.dart';

class WorkService {
  CustomDatabase customDatabase = CustomDatabase();
  final Uuid _uuid = const Uuid();

  Future<List<Work>> get() async {
    List<Work> result = [];

    List<Map<String, dynamic>> query = await customDatabase.query('works');

    for (var element in query) {
      Work work = Work(element);

      result.add(work);
    }

    return result;
  }

  add(String title, String summary, String completeTime, String importance,
      isComplete) async {
    final uuid = _uuid.v4();

    final payload = {
      'id': uuid,
      'title': title,
      'summary': summary,
      'completeTime': completeTime,
      'importance': importance,
      'complete': isComplete
    };

    await customDatabase.insert('works', payload);
  }

  delete(String id) async {
    await customDatabase.delete('works', id);
  }
}
