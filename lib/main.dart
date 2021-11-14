import 'package:flutter/material.dart';
import 'package:fluttergooglesheetapi/api/sheets/user_sheets_api.dart';
import 'package:fluttergooglesheetapi/page/create_sheets_page.dart';
import 'package:fluttergooglesheetapi/page/modify_sheets.page.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetsApi.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.notoSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: ModifySheetsPage());
  }
}
