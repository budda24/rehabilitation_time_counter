// To parse this JSON data, do
//
//     final rehabilitation = rehabilitationFromJson(jsonString);

import 'dart:convert';

Rehabilitation rehabilitationFromJson(String str) =>
    Rehabilitation.fromJson(json.decode(str));

String rehabilitationToJson(Rehabilitation data) => json.encode(data.toJson());

class Rehabilitation {
  Rehabilitation({
     this.id,
    required this.title,
    required this.date,
    required this.hourSpent,
  });

   String? id;
  final String title;
  final DateTime date;
  final double hourSpent;

  factory Rehabilitation.fromJson(Map<String, dynamic> json) => Rehabilitation(
        id: json['id'],
        title: json['titlse'],
        date: DateTime.parse(json['date']),
        hourSpent: json['hour_spent'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'titlse': title,
        'date': date.toIso8601String(),
        'hour_spent': hourSpent,
      };
}
