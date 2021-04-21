
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/data/pokedetail.dart';
import 'package:pokedex/data/pokerepo.dart';
import 'package:pokedex/data/pokespec.dart';
import 'package:pokedex/data/pokespecinfo.dart';

class PokeDetailCubit extends Cubit<PokeDetail>{
  final _pokeRepo = PokeRepo();

  PokeDetailCubit() : super(null);

  void getPokeDetails(int pokemonId) async{
    final responses = await Future.wait([
      _pokeRepo.getPokeInfo(pokemonId),
      _pokeRepo.getPokeSpeciesInfo(pokemonId)
    ]);
    final pokeInfo = responses[0] as PokeInfoRes;
    final speciesInfo = responses[1] as PokeInfoSpecRespon;

    emit(PokeDetail(
      id: pokeInfo.id,
      name: pokeInfo.name, 
      imageUrl: pokeInfo.imageUrl, 
      types: pokeInfo.types, 
      height: pokeInfo.height, 
      weight: pokeInfo.weight, 
      description: speciesInfo.description)); 
  }

  void clearPokeDetails() => emit(null);

  
}