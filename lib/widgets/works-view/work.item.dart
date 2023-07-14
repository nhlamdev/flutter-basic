import 'package:flutter/material.dart';
import 'package:test/models/work.model.dart';
import 'package:test/utils/func.dart';

class WorkItemWidget extends StatelessWidget {
  final Work item;

  const WorkItemWidget(this.item, {super.key});

  bool _checkTimeExprire() {
    DateTime now = DateTime.now();
    int milliseconds = now.millisecondsSinceEpoch;
    int taskMilliseconds = item.completeTime.millisecondsSinceEpoch;

    if (taskMilliseconds <= milliseconds) {
      return true;
    } else {
      return false;
    }
  }

  _generatorBgColor() {
    bool isExprire = _checkTimeExprire();

    if (item.complete) {
      return Colors.greenAccent[300];
    } else {
      if (isExprire) {
        return const Color.fromARGB(255, 212, 123, 123);
      } else {
        return const Color.fromARGB(255, 214, 214, 214);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: _generatorBgColor(),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(0, 3),
              blurRadius: 6,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    '${formatNumber(item.completeTime.hour)}:${formatNumber(item.completeTime.minute)}:${formatNumber(item.completeTime.second)} ${formatNumber(item.completeTime.day)}/${formatNumber(item.completeTime.month)}/${formatNumber(item.completeTime.year)}')
              ],
            )),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )))
          ],
        ));
  }
}
