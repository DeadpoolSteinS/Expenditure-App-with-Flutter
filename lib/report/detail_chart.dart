import 'package:exp_note/models/report_data.dart';
import 'package:exp_note/constant/global_variables.dart';
import 'package:flutter/material.dart';

class DetailChart extends StatelessWidget {
  final List<ReportData> dataReport;
  const DetailChart({
    Key? key,
    required this.dataReport,
  }) : super(key: key);

  int getSumExp() {
    int sum = 0;
    for (var data in dataReport) {
      sum += data.price;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Total'),
        const SizedBox(height: 4),
        Text(
          "Rp. ${GlobalVariables.formatter.format(getSumExp())}",
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
