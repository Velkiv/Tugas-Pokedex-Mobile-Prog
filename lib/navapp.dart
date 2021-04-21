import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/navcub.dart';
import 'package:pokedex/podetailview.dart';
import 'package:pokedex/poview.dart';

class AppNav extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return BlocBuilder<NavCubit, int>(builder: (context, pokemonId){
      return Navigator(
        pages: [
          MaterialPage(child: PokeView()),
          if(pokemonId!=null) MaterialPage(child: PokeDetailView())
        ],
        onPopPage: (route, result){
          BlocProvider.of<NavCubit>(context).popToPokedex();
          return route.didPop(result);
        },
      );
    });
  }
}