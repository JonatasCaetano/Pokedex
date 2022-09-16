// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TypeButton extends StatelessWidget {
  String type;
  Color color;
  double fontSize;
  double radius;
  TypeButton({
    Key? key,
    required this.type,
    required this.color,
    required this.fontSize,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shadowColor: const Color(0xffea686d),
        primary: color,
        elevation: 0.0,
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: Text(
        type,
        textAlign: TextAlign.center,
        style: GoogleFonts.nunito(
          textStyle: TextStyle(
            color: const Color(0xffffffff),
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
