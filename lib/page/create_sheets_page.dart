import 'package:flutter/material.dart';
import 'package:fluttergooglesheetapi/api/sheets/user_sheets_api.dart';
import 'package:fluttergooglesheetapi/widget/user_form_widget.dart';

class CreateSheetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: UserFormWidget(
            onSavedUserWord: (userWord) async {
              final id = await UserSheetsApi.getRowCount();
              final newUserWord = userWord.copy(id: id);
              await UserSheetsApi.insert([newUserWord.toJson()]);
            },
          ),
        ),
      ),
    );
  }
}
