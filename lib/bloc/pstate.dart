import 'package:flutter/cupertino.dart';
import 'package:pokedex/data/pokeresponse.dart';

abstract class PokeState{

}

class PokeInitial extends PokeState{}

class PokeLoadProg extends PokeState{}

class PokeLoadSuc extends PokeState{
  final List<PokeList> pokeList;
  final bool bisaNextPg;

  PokeLoadSuc({@required this.pokeList, @required this.bisaNextPg});
}

class PokeLoadFail extends PokeState{
  final Error error;
  PokeLoadFail({@required this.error});
}
