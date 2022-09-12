import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarMain extends StatelessWidget implements PreferredSize {
  const AppBarMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset('assets/images/logo.png'),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: CircleAvatar(
            radius: 12.0,
            backgroundColor: const Color(0xffffffff),
            child: SvgPicture.asset(
              'assets/icons/account.svg',
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
