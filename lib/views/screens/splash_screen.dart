import 'package:flutter/material.dart';
import 'package:pokedex/enuns/screens.dart';
import 'package:pokedex/services/routes.dart';
import 'package:pokedex/views/widgets/header_pokemons.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /**Images Block  */

            const Padding(
              padding: EdgeInsets.only(top: 49),
              child: Align(
                alignment: Alignment.center,
                child: HeaderPokemons(),
              ),
            ),

            //End Images Block

            /**Start title  */

            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: 'Explore o mundo dos ',
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        color: Color(0xff2F3E77),
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                TextSpan(
                    text: 'Pokémons',
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        color: Color(0xffea686d),
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ]),
            ),

            //End title

            const SizedBox(
              height: 10.0,
            ),

            /**Start subtitle  */

            Text('Descubra todas as espécies de Pokémons',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    color: Color(0xff2F3E77),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                )),

            //End subtitle

            const SizedBox(
              height: 19.0,
            ),

            /**Start Button to homeScreen */

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: const Color(0xffea686d),
                primary: const Color(0xffEa686D),
                fixedSize: const Size(226.0, 43.0),
                elevation: 15.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onPressed: () {
                Routes.toScreen(Screens.main, context);
              },

              //**Start Title Button */

              child: Container(
                color: Colors.transparent,
                width: 208,
                height: 30,
                child: Stack(
                  children: [
                    Center(
                      child: Text('Começar',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 22,
                        color: Color(0xffFBFDFF),
                      ),
                    )
                  ],
                ),
              ),

              //**End Title Button */
            ),

            //End button to homeScreen

            const SizedBox(
              height: 67.0,
            ),
          ],
        ),
      ),
    );
  }
}
