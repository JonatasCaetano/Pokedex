// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pokedex/controllers/main_app_screen_controller.dart';

// ignore: must_be_immutable
class BottomNavigationBarMain extends StatelessWidget {
  bool isPokemonPage;
  BottomNavigationBarMain({
    Key? key,
    required this.isPokemonPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainAppScreenController = Get.put(MainAppScreenController());
    return BottomNavigationBar(
        currentIndex: mainAppScreenController.indexPage,
        onTap: (index) {
          mainAppScreenController.updateIndexPage(index: index);
          if (isPokemonPage) {
            Navigator.pop(context);
          }
        },
        selectedItemColor: isPokemonPage ? const Color(0xffa2a9b0) : null,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: const Color(0xffa2a9b0),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: isPokemonPage
                  ? const Color(0xffa2a9b0)
                  : const Color(0xff2f3e77),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Favoritos',
            icon: SvgPicture.asset(
              'assets/icons/favorite.svg',
              color: const Color(0xffa2a9b0),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/favorite.svg',
              color: isPokemonPage
                  ? const Color(0xffa2a9b0)
                  : const Color(0xff2f3e77),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Minha conta',
            icon: SvgPicture.asset(
              'assets/icons/account.svg',
              color: const Color(0xffa2a9b0),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/account.svg',
              color: isPokemonPage
                  ? const Color(0xffa2a9b0)
                  : const Color(0xff2f3e77),
            ),
          ),
        ]);
  }
}
