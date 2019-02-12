import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:domowka/models/api/beers_response.dart';

abstract class BeersBlock {
  Sink<bool> get beers; 
  Stream<BeersResponse> get beersResponse;
}

class BeersBlockImpl extends BeersBlock {

  final _getListTrigger = new StreamController<bool>();
  final _beersList = new BehaviorSub
  
  @override
  Sink<bool> get beers => null;

  @override
  Stream<BeersResponse> get beersResponse => null;

}