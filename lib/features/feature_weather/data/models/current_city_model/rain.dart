import 'dart:convert';

class Rain {
  double? h1;

  Rain({this.h1});

  factory Rain.fromMap(Map<String, dynamic> data) => Rain(
        h1: (data['1h'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        '1h': h1,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Rain].
  factory Rain.fromJson(String data) {
    return Rain.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Rain] to a JSON string.
  String toJson() => json.encode(toMap());
}
