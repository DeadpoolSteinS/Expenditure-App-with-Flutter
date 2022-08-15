import 'package:exp_note/models/report_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartContainer extends StatelessWidget {
  final List<ReportData> dataReport;
  const ChartContainer({
    Key? key,
    required this.dataReport,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      title: ChartTitle(text: 'Agustus 2022'),
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
      ),
      series: [
        DoughnutSeries<ReportData, String>(
          dataSource: dataReport,
          xValueMapper: (ReportData data, _) => data.type,
          yValueMapper: (ReportData data, _) => data.price,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          enableTooltip: true,
        )
      ],
    );
  }
}
