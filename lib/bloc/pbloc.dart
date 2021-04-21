
import 'package:pokedex/bloc/pevent.dart';
import 'package:pokedex/bloc/pstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/data/pokerepo.dart';


class PokeBloc extends Bloc<PEvent,PokeState>{
  
  final _pokeRep = PokeRepo();
  PokeBloc(): super(PokeInitial());

  @override
  Stream<PokeState> mapEventToState(PEvent event) async*{
    if(event is PokePgReq){
      yield PokeLoadProg();
      
      try{
        final pokePgRespon = await _pokeRep.getPokePg(0);
        yield PokeLoadSuc(pokeList: pokePgRespon.pokeList, bisaNextPg: pokePgRespon.bisaNextPg);
      } catch(e){
        yield PokeLoadFail(error: e);

      }
    }
  }
}

