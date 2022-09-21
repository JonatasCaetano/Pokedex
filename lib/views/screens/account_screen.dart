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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: Stack(
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundColor: const Color(0xffffffff),
                                backgroundImage:
                                    mainAppScreenController.userEntity!.image ==
                                            null
                                        ? null
                                        : NetworkImage(mainAppScreenController
                                            .userEntity!.image!),
                                child:
                                    mainAppScreenController.userEntity!.image ==
                                            null
                                        ? SvgPicture.asset(
                                            'assets/icons/account.svg',
                                            width: 120,
                                          )
                                        : null,
                              ),
                            ),
                            Positioned(
                              bottom: 5.0,
                              right: 5.0,
                              child: IconButton(
                                onPressed: () {
                                  mainAppScreenController.updateImageProfile();
                                },
                                icon: const Icon(Icons.more_vert),
                              ),
                            ),
                            mainAppScreenController.loadImage.isFalse
                                ? Container()
                                : Positioned(
                                    bottom: 10.0,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: const Center(
                                          child: CircularProgressIndicator()),
                                    ),
                                  )
                          ],
                        ),
                      ),
                    ),

                    //**End Image profile */

                    const SizedBox(
                      height: 16.0,
                    ),

                    //**Name */
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        mainAppScreenController.userEntity!.name,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                            color: Color(0xff2F3E77),
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),

                    //**Favorites quantity */
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Recentes ',
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                            color: Color(0xff2F3E77),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
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
