// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TypeButton extends StatelessWidget {
  String type;
  Color color;
  double buttonWidth;
  double buttonHeight;
  TypeButton({
    Key? key,
    required this.type,
    required this.color,
    required this.buttonWidth,
    required this.buttonHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shadowColor: const Color(0xffea686d),
        fixedSize: Size(buttonWidth, buttonHeight),
        primary: color,
        elevation: 0.0,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      child: Text(
        type,
        textAlign: TextAlign.center,
        style: GoogleFonts.nunito(
          textStyle: const TextStyle(
            color: Color(0xffffffff),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
