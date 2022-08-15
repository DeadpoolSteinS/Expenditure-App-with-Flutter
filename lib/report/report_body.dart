import 'package:exp_note/models/report_data.dart';
import 'package:exp_note/report/chart_container.dart';
import 'package:exp_note/report/detail_chart.dart';
import 'package:exp_note/report/report_services.dart';
import 'package:flutter/material.dart';

class ReportBody extends StatefulWidget {
  const ReportBody({Key? key}) : super(key: key);

  @override
  State<ReportBody> createState() => _ReportBodyState();
}

class _ReportBodyState extends State<ReportBody> {
  final ReportServices reportServices = ReportServices();

  Future<List<ReportData>> takeDataReport() async {
    return await reportServices.getReport("08-2022");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: takeDataReport(),
        builder: (context, AsyncSnapshot<List<ReportData>> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ChartContainer(dataReport: snapshot.data!),
                  DetailChart(dataReport: snapshot.data!),
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
