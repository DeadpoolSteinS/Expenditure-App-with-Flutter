import 'package:exp_note/db/db_helper.dart';
import 'package:exp_note/models/report_data.dart';
import 'package:get/get.dart';

class ReportServices extends GetxController {
  Future<List<ReportData>> getReport(String monthYear) async {
    List<Map<String, dynamic>> exps =
        await DBHelper.findQuery("%$monthYear", "createdAt");
    List<ReportData> reportData = [];
    for (var exp in exps) {
      if (reportData
          .where((element) => element.type == exp['type'])
          .isNotEmpty) {
        reportData
            .firstWhere((element) => element.type == exp['type'])
            .addPrice(exp['price']);
      } else {
        reportData.add(ReportData(type: exp['type'], price: exp['price']));
      }
    }
    return reportData;
  }
}
