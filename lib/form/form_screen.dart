import 'package:exp_note/constant/custom_button.dart';
import 'package:exp_note/constant/custom_textfield.dart';
import 'package:exp_note/constant/search_bar.dart';
import 'package:exp_note/form/form_services.dart';
import 'package:exp_note/models/expenditure.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final FormServices formServices = Get.put(FormServices());

  @override
  void dispose() {
    super.dispose();
    _typeController.dispose();
    _descController.dispose();
    _priceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          // height of tool in appbar
          toolbarHeight: 70,
          // backgroundColor: Colors.transparent,
          elevation: 0,
          title: const SearchBar(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextfield(
              controller: _typeController,
              hintText: 'type',
            ),
            const SizedBox(height: 8),
            CustomTextfield(
              controller: _descController,
              hintText: 'desc',
              maxLines: 5,
            ),
            const SizedBox(height: 8),
            CustomTextfield(
              controller: _priceController,
              hintText: 'harga',
            ),
            const SizedBox(height: 12),
            CustomButton(
              text: 'Submit',
              onTap: () {
                submitForm();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  void submitForm() {
    formServices.submitForm(
      exp: Expenditure(
        type: _typeController.text,
        desc: _descController.text,
        price: int.parse(_priceController.text),
        createdAt: DateFormat('HH:mm dd-MM-yyyy').format(DateTime.now()),
      ),
    );
  }
}
