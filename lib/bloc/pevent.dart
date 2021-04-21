import 'package:flutter/cupertino.dart';

abstract class PEvent{

}

class PokePgReq extends PEvent{
  final int page;

  PokePgReq({@required this.page});
}