import 'package:exp_note/constant/global_variables.dart';
import 'package:exp_note/models/expenditure.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpCard extends StatelessWidget {
  final Expenditure exp;
  const ExpCard({
    Key? key,
    required this.exp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 8,
        ),
        // color: AppColor.cardBackground,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.black,
            // width: 4,
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: Image.asset(
                "assets/${exp.type}.png",
                width: 44,
                height: 44,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${exp.type}",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "- Rp. ${GlobalVariables.formatter.format(exp.price)}",
                        style: GoogleFonts.roboto(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${exp.desc}",
                        style: GoogleFonts.roboto(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        getHourMinute(exp.createdAt),
                        style: GoogleFonts.roboto(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getHourMinute(String? createdAt) {
    if (createdAt == null) return "";
    var arr = createdAt.split(' ');
    return arr[0];
  }
}
