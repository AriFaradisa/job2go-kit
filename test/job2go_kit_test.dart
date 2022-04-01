import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job2go_kit/job2go_kit.dart';

void main() {
  testWidgets('ListView has data', (WidgetTester tester) async {
    await tester.pumpWidget(Job2GoScrollView(
        controller: Job2GoScrollController(limit: 5),
        onRefreshed: () {
          debugPrint("refresh");
          return Future.value();
        },
        itemBuilder: () {},
        onLoadMore: () {
          debugPrint("load more");
        }));
  });
}
