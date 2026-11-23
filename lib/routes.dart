import 'package:pas/menu/home_page.dart';
import 'package:pas/pages/login.page.dart';

import 'package:get/get.dart';
import 'package:pas/pages/main_menu.dart';
import 'package:pas/pages/transaksi_page.dart';

class Routes {
  static const String login = "/login";
  static const String mainmenu = "/mainmenu";
  static const String transaksi = "/transaksi";
  static const String Home = "/Home";


static final myPages = [
  GetPage(name: Routes.login, page: () =>  LoginPage()),
  GetPage(  name: Routes.mainmenu, page: () => MainMenuPage(),),
  GetPage(  name: Routes.Home, page: () => HomePage(),),
  GetPage( name: Routes.transaksi,page: () => TransaksiPage()),
 ];

}