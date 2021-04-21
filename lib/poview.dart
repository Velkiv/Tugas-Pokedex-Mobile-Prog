

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/navcub.dart';
import 'package:pokedex/bloc/pbloc.dart';
import 'package:pokedex/bloc/pstate.dart';
import 'package:pokedex/data/pokeresponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PokeView extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('P@kedex'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search), 
            onPressed: (){showSearch(context: context, delegate: DataSearch());
          })
        ],
      ),
      
      body: BlocBuilder<PokeBloc, PokeState>(
        builder: (context, state){
          if (state is PokeLoadProg) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokeLoadSuc){
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3) , 
              itemCount: state.pokeList.length, 
              itemBuilder:(context, index){
                return GestureDetector(
                  onTap: () => BlocProvider.of<NavCubit>(context)
                  .showPokeDetail(state.pokeList[index].id),
                  child: Card(
                    child: GridTile(
                      child: Column(
                        children: [
                          Text(state.pokeList[index].nama),
                          Image.network(state.pokeList[index].imageUrl),
                          ],
                        ),
                      ),
                    ),
                );
                } 
              );
          } else if(state is PokeLoadFail){
            return Center(
              child: Text(state.error.toString()),
            );
          } else{
            return Container();
          }     
        },
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String>{

  @override
  List<Widget> buildActions(BuildContext context) {
      return[IconButton(icon: Icon(Icons.clear), onPressed: (){
        close(context, null);
      })];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
          ),
          onPressed: (){
            close(context, null);
          });
    }
  
    @override
    Widget buildResults(BuildContext context) {
    
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    
    return Scaffold(
      body: BlocBuilder<PokeBloc, PokeState>(
        builder: (context, state){
          if (state is PokeLoadProg) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokeLoadSuc){
            return ListView.builder(
              
              itemCount: state.pokeList.length, 
              itemBuilder:(context, index){
                return GestureDetector(
                  onTap: () => BlocProvider.of<NavCubit>(context)
                  .showPokeDetail(state.pokeList[index].id),
                  child: Card(
                    child: GridTile(
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.all(12)),
                          Text(state.pokeList[index].nama),
                          Padding(padding: EdgeInsets.all(12)),
                          ],
                        ),
                      ),
                    ),
                );
                } 
              );
          } else if(state is PokeLoadFail){
            return Center(
              child: Text(state.error.toString()),
            );
          } else{
            return Container();
          }     
        },
      ),
    );
    
  ;}

}



