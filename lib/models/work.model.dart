class Works {
  late String id;
  late String title;
  late String summary;
  late DateTime completeTime;
  late bool complete;
  late String importance;

  Works(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
    summary = element['summary'];
    completeTime = DateTime.parse(element['completeTime']);
    complete = element['complete'] != 0;
    importance = element['importance'];
  }
}
