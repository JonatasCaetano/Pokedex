import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/views/widgets/card_pokemon.dart';

import '../../controllers/main_app_screen_controller.dart';
import 'login_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainAppScreenController>(
        builder: (mainAppScreenController) {
      return mainAppScreenController.userEntity == null
          ? LoginScreen()
          : Scaffold(
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
                    const SizedBox(
                      height: 16.0,
                    ),
                    mainAppScreenController.recentlySeen.isEmpty
                        ? Container()
                        : GridView.builder(
                            padding: const EdgeInsets.all(8.0),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                mainAppScreenController.recentlySeen.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  MediaQuery.of(context).size.width ~/ 200,
                              childAspectRatio: 159.53 / 110.94,
                              crossAxisSpacing: 7,
                              mainAxisSpacing: 11,
                            ),
                            itemBuilder: (context, index) {
                              return CardPokemon(
                                pokemon:
                                    mainAppScreenController.recentlySeen[index],
                              );
                            },
                          ),
                  ],
                ),
              ),
            );
    });
  }
}
