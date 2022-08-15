import 'package:exp_note/home/body.dart';
import 'package:exp_note/models/expenditure.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:preload_page_view/preload_page_view.dart';

class ContainerHomeBody extends StatefulWidget {
  final RxList<Expenditure> dataToday;
  const ContainerHomeBody({
    Key? key,
    required this.dataToday,
  }) : super(key: key);

  @override
  State<ContainerHomeBody> createState() => _ContainerHomeBodyState();
}

class _ContainerHomeBodyState extends State<ContainerHomeBody> {
  late PreloadPageController pageController;

  final DateTime startDate = DateTime(2022, 8, 1);
  DateTime today = DateTime.now();

  @override
  void initState() {
    super.initState();
    pageController =
        PreloadPageController(initialPage: today.difference(startDate).inDays);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PreloadPageView.builder(
      controller: pageController,
      // itemCount: 3,
      itemBuilder: (context, i) {
        String yesterday =
            DateFormat('dd-MM-yyyy').format(startDate.add(Duration(days: i)));
        return Body(
          dateMonthYear: yesterday,
          dataToday: widget.dataToday,
        );
        // Body(dateMonthYear: "13-08-2022"),
      },
    );
  }
}
