import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/views/widgets/appbar_main.dart';
import 'package:pokedex/views/widgets/bottomnavigationbar_main.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarMain(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //**Start Image profile */

            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 325,
                width: 350,
                decoration: BoxDecoration(
                  color: const Color(0xfff7f1f1),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundColor: const Color(0xffffffff),
                    child: SvgPicture.asset(
                      'assets/icons/account.svg',
                      width: 120,
                    ),
                  ),
                ),
              ),
            ),

            //**End Image profile */

            const SizedBox(
              height: 16.0,
            ),

            //**Name */
            Text(
              'Nome do usuario',
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                  color: Color(0xff2F3E77),
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            //**Favorites quantity */
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: 'Favoritos: ',
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        color: Color(0xff2F3E77),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                TextSpan(
                    text: '18',
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        color: Color(0xffea686d),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarMain(),
    );
  }
}
