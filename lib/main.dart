import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/PDetailCubit.dart';
import 'package:pokedex/bloc/navcub.dart';
import 'package:pokedex/bloc/pbloc.dart';
import 'package:pokedex/bloc/pevent.dart';
import 'package:pokedex/navapp.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final pokeDetailCubit = PokeDetailCubit();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context)
            .copyWith(primaryColor: Colors.cyan, accentColor: Colors.redAccent),
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => 
              PokeBloc()..add(PokePgReq(page: 0))),
        BlocProvider(
            create: (context) =>
                NavCubit(pokeDetailCubit: pokeDetailCubit)),
        BlocProvider(create: (context) =>pokeDetailCubit)
          ], child: AppNav()),
    );
  }
}
