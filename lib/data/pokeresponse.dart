import 'package:flutter/cupertino.dart';

class PokeList{
  final int id;
  final String nama;

  String get imageUrl => 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  PokeList({@required this.id,@required this.nama});

  factory PokeList.fromJson(Map<String, dynamic> json){
    final nama = json['name'];
    final url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);

    return PokeList(id: id, nama: nama);
  }
}

class PokePgRespon{
  final List<PokeList> pokeList;
  final bool bisaNextPg;


  PokePgRespon(
    {@required this.pokeList, @required this.bisaNextPg}
  );

  factory PokePgRespon.fromJson(Map<String, dynamic>json){
    final bisaNextPg= json['next']!= null; 
    final pokeList=(json['results'] as List).map((listingJson) => PokeList.fromJson(listingJson)).toList();
  
  return PokePgRespon(
    pokeList: pokeList, bisaNextPg: bisaNextPg);
  }

  
}