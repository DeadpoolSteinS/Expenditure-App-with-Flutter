import 'package:exp_note/form/form_services.dart';
import 'package:exp_note/home/exp_card.dart';
import 'package:exp_note/models/expenditure.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  final String dateMonthYear;
  final RxList<Expenditure> dataToday;
  const Body({
    Key? key,
    required this.dateMonthYear,
    required this.dataToday,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final FormServices formServices = Get.put(FormServices());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          const SizedBox(height: 6),
          Text(
            widget.dateMonthYear,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Expanded(
            child: FutureBuilder(
              future: formServices.getExp2(widget.dateMonthYear),
              builder: (context, AsyncSnapshot<RxList<Expenditure>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) {
                      return ExpCard(exp: snapshot.data![index]);
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
