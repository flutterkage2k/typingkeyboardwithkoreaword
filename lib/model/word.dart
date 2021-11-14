import 'dart:convert';

class WordFields {
  static final String id = 'id';
  static final String kwordSample = 'kwordSample';
  static final String kwordUserInput = 'kwordUserInput';

  static List<String> getField() =>
      [id, kwordSample, kwordUserInput]; // sheet에 1행에 만들어줌

}

class UserWord {
  final int? id;
  final String? kwordSample;
  final String? kwordUserInput;

  const UserWord({
    this.id,
    this.kwordSample,
    this.kwordUserInput,
  });

  UserWord copy({
    int? id,
    String? kwordSample,
    String? kwordUserInput,
  }) =>
      UserWord(
        id: id ?? this.id,
        kwordSample: kwordSample ?? this.kwordSample,
        kwordUserInput: kwordUserInput ?? this.kwordUserInput,
      );

  static UserWord fromJson(Map<String, dynamic> json) => UserWord(
        id: jsonDecode(json[WordFields.id]),
        kwordSample: json[WordFields.kwordSample],
        kwordUserInput: json[WordFields.kwordUserInput],
      );

  Map<String, dynamic> toJson() => {
        WordFields.id: id,
        WordFields.kwordSample: kwordSample,
        WordFields.kwordUserInput: kwordUserInput
      };
}
