import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationBarMain extends StatelessWidget {
  const BottomNavigationBarMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(
        label: 'Home',
        icon: SvgPicture.asset(
          'assets/icons/home.svg',
        ),
      ),
      BottomNavigationBarItem(
        label: 'Favoritos',
        icon: SvgPicture.asset(
          'assets/icons/favorite.svg',
        ),
      ),
      BottomNavigationBarItem(
        label: 'Minha conta',
        icon: SvgPicture.asset(
          'assets/icons/account.svg',
        ),
      ),
    ]);
  }
}
