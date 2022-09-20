import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/main_app_screen_controller.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainAppScreenController = Get.find<MainAppScreenController>();
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundColor: const Color(0xffffffff),
                    child: SvgPicture.asset(
                      'assets/icons/account.svg',
                      width: 120,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),

                //**Name */
                Text(
                  'Nome do usuario',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                      color: Color(0xff2F3E77),
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: const Color(0xffa2a9b0).withOpacity(0.2),
          ),
          GestureDetector(
            onTap: () {
              mainAppScreenController.updateIndexPage(index: 0);
              Navigator.pop(context);
            },
            child: ListTile(
              leading: SvgPicture.asset(
                'assets/icons/home.svg',
                color: const Color(0xffa2a9b0),
              ),
              title: const Text("Home"),
            ),
          ),
          GestureDetector(
            onTap: () {
              mainAppScreenController.updateIndexPage(index: 1);
              Navigator.pop(context);
            },
            child: ListTile(
              leading: SvgPicture.asset(
                'assets/icons/favorite.svg',
                color: const Color(0xffa2a9b0),
              ),
              title: const Text("Favoritos"),
            ),
          ),
          GestureDetector(
            onTap: () {
              mainAppScreenController.updateIndexPage(index: 2);
              Navigator.pop(context);
            },
            child: ListTile(
              leading: SvgPicture.asset(
                'assets/icons/account.svg',
                color: const Color(0xffa2a9b0),
              ),
              title: const Text("Minha conta"),
            ),
          ),
          GestureDetector(
            onTap: () {
              mainAppScreenController.logOut();
              Navigator.pop(context);
            },
            child: const ListTile(
              leading: Icon(
                Icons.logout,
                color: Color(0xffa2a9b0),
              ),
              title: Text("Sair"),
            ),
          )
        ],
      ),
    );
  }
}
