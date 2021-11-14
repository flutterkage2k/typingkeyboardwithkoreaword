import 'package:flutter/material.dart';
import 'package:fluttergooglesheetapi/api/sheets/user_sheets_api.dart';
import 'package:fluttergooglesheetapi/model/word.dart';
import 'package:fluttergooglesheetapi/widget/navigate_users_widget.dart';
import 'package:fluttergooglesheetapi/widget/user_form_widget.dart';

class ModifySheetsPage extends StatefulWidget {
  const ModifySheetsPage({Key? key}) : super(key: key);

  @override
  _ModifySheetsPageState createState() => _ModifySheetsPageState();
}

class _ModifySheetsPageState extends State<ModifySheetsPage> {
  List<UserWord> userwords = [];
  int index = 0;

  @override
  void initState() {
    super.initState();
    getKwordSample();
  }

  Future getKwordSample() async {
    final userKwordSample = await UserSheetsApi.getAll();

    setState(() {
      this.userwords = userKwordSample;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(16),
          children: [
            UserFormWidget(
                userWord: userwords.isEmpty ? null : userwords[index],
                onSavedUserWord: (userWord) async {}),
            const SizedBox(height: 16),
            if (userwords.isNotEmpty) buildUserControls(),
          ],
        ),
      ),
    );
  }

  Widget buildUserControls() => NavigateUsersWidget(
        text: '${index + 1} / ${userwords.length} Words',
        onClickedNext: () {
          final nextIndex = index >= userwords.length - 1 ? 0 : index + 1;
          setState(() {
            index = nextIndex;
          });
        },
        onClickedPrevious: () {
          final previousIndex = index <= 0 ? userwords.length - 1 : index - 1;
          setState(() {
            index = previousIndex;
          });
        },
      );
}
