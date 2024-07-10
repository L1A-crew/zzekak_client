import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({required final GetIt di, super.key});

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;
    final month = DateTime.now().month;
    final day = DateTime.now().day;

    return Scaffold(
        body: Center(
      child: Text("Today is\n$month/$day/$year"),
    ));
  }
}
