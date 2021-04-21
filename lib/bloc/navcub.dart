import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/PDetailCubit.dart';

class NavCubit extends Cubit<int>{
  PokeDetailCubit pokeDetailCubit;

  NavCubit({@required this.pokeDetailCubit}) : super(null);

  void showPokeDetail(int pokemonId){
    pokeDetailCubit.getPokeDetails(pokemonId);
    emit(pokemonId);
  }
  void popToPokedex(){
    emit(null);
    pokeDetailCubit.clearPokeDetails();
  }
}