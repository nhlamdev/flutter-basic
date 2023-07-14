import 'package:flutter/material.dart';
import 'package:test/models/work.model.dart';
import 'package:test/widgets/works-view/work.item.dart';

class WorksList extends StatelessWidget {
  final List<Works> data;

  const WorksList(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
            child:
                Column(children: data.map((e) => WorkItemWidget(e)).toList())));
  }
}
