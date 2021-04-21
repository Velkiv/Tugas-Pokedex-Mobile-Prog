import 'package:flutter/cupertino.dart';

class PokeInfoSpecRespon{
  final String description;

  PokeInfoSpecRespon({@required this.description});

  factory PokeInfoSpecRespon.fromJson(Map<String, dynamic> json){
    return PokeInfoSpecRespon(
      description: json['flavor_text_entries'][0]['flavor_text']);
  }
}