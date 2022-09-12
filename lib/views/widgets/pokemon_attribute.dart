// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class PokemonAttribute extends StatelessWidget {
  String name;
  Color color;
  double value;
  PokemonAttribute({
    Key? key,
    required this.name,
    required this.color,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          /**Start name area */
          SizedBox(
            width: 97,
            child: Text(
              name,
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                  color: Color(0xff233674),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          //**End name area */

          /**Start indicator area */

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              color: color,
            ),
            width: (value / 100) * MediaQuery.of(context).size.width -
                (97 + 21 + 20),
            height: 7.94,
          ),

         //**End indicator area */

        ],
      ),
    );
  }
}
