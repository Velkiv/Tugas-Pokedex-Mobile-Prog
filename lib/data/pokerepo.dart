import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/data/pokespec.dart';
import 'package:pokedex/data/pokespecinfo.dart';
import 'package:pokedex/data/pokeresponse.dart';

class PokeRepo{
  final baseurl = 'pokeapi.co';
  final client = http.Client();

  Future<PokePgRespon> getPokePg(int pageI) async{
    final qPara={
      'limit' : '151',
      'offset' :(pageI * 0).toString()
    };

    final uri= Uri.https(baseurl, '/api/v2/pokemon', qPara);

    final response = await client.get(uri);
    final json =jsonDecode(response.body);

    return PokePgRespon.fromJson(json);
  } 

  Future<PokeInfoRes> getPokeInfo(int pokemonId) async{
    final uri=Uri.https(baseurl, '/api/v2/pokemon/$pokemonId');

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return PokeInfoRes.fromJson(json);
    } catch (e) {
      print(e);
    }
  }

  Future<PokeInfoSpecRespon> getPokeSpeciesInfo(int pokemonId) async{
    final uri=Uri.https(baseurl, '/api/v2/pokemon-species/$pokemonId');

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return PokeInfoSpecRespon.fromJson(json);
    } catch (e) {
      print(e);
    }
  }
}