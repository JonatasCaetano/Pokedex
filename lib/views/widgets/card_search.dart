import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CardSearch extends StatelessWidget {
  const CardSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      color: const Color(0xfff8f8f8),
      //width: 335,
      height: 152,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(241, 176, 179, 0.1),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 14,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Pokedéx',
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                          color: Color(0xff2f3e77),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: Text(
                        'Todas as espécies de pokemons estão esperando por você!',
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                            color: Color(0xff2f3e77),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xfff4f4f4),
                            spreadRadius: 5.0,
                            blurRadius: 5.0,
                          )
                        ],
                      ),
                      width: MediaQuery.of(context).size.width >= 163
                          ? MediaQuery.of(context).size.width * 0.50
                          : 163,
                      height: 31,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.0),
                                  bottomLeft: Radius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shadowColor: const Color(0xffea686d),
                              fixedSize: const Size.fromWidth(40.4),
                              primary: const Color(0xffEa686D),
                              elevation: 5.0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5.0),
                                  bottomRight: Radius.circular(5.0),
                                ),
                              ),
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/search.svg',
                              color: const Color(0xfffbfdff),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 27.0),
              child: Image.asset(
                'assets/images/pokemon-4.png',
                width: 85,
                height: 84,
              ),
            )
          ],
        ),
      ),
    );
  }
}
