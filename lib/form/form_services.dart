import 'package:exp_note/models/expenditure.dart';
import 'package:exp_note/db/db_helper.dart';
import 'package:get/get.dart';

class FormServices extends GetxController {
  // @override
  // void onReady() {
  //   super.onReady();
  // }

  var expList = <Expenditure>[].obs;

  Future<int> submitForm({Expenditure? exp}) async {
    return await DBHelper.insert(exp);
    // return 1;
  }

  void getExp(String dateMonthYear) async {
    // List<Map<String, dynamic>> exps = await DBHelper.query();
    List<Map<String, dynamic>> exps =
        await DBHelper.findQuery("%$dateMonthYear", "createdAt");
    expList.assignAll(exps.map((data) => Expenditure.fromJson(data)).toList());
    // print(expList);
  }

  Future<RxList<Expenditure>> getExp2(String dateMonthYear) async {
    RxList<Expenditure> expList2 = <Expenditure>[].obs;
    List<Map<String, dynamic>> exps =
        await DBHelper.findQuery("%$dateMonthYear", "createdAt");
    expList2.assignAll(exps.map((data) => Expenditure.fromJson(data)).toList());
    return expList2;
  }
}
