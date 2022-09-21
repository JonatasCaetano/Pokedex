// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pokedex/controllers/main_app_screen_controller.dart';

// ignore: must_be_immutable
class AppBarMain extends StatelessWidget implements PreferredSize {
  IconButton? icon;
  AppBarMain({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainAppScreenController>(
      builder: (mainAppScreenController) => AppBar(
        title: Image.asset('assets/images/logo.png'),
        centerTitle: true,
        leading: icon,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              radius: 12.0,
              backgroundColor: const Color(0xffffffff),
              backgroundImage: mainAppScreenController.userEntity == null ||
                      mainAppScreenController.userEntity!.image == null
                  ? null
                  : NetworkImage(mainAppScreenController.userEntity!.image!),
              child: mainAppScreenController.userEntity == null ||
                      mainAppScreenController.userEntity!.image == null
                  ? SvgPicture.asset(
                      'assets/icons/account.svg',
                      width: 120,
                    )
                  : null,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
