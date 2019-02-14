import 'package:domowka/models/api/beers_response.dart';
import 'package:equatable/equatable.dart';

abstract class BeersBlocState extends Equatable {
  // This is something connected
  BeersBlocState([List props = const []]) : super(props);
}

class BeersLoadingState extends BeersBlocState {
  @override
  String toString() => 'BeersLoadingState';
}

class BeersLoadedState extends BeersBlocState {
  final List<Beer> beers;

  BeersLoadedState(this.beers) : super([beers]);

  @override
  String toString() => 'BeersLoadedState'; 
}

class BeersLoadingErrorState extends BeersBlocState {
  final String error;

  BeersLoadingErrorState({
    this.error
  });

  @override
  String toString() => 'BeersLoadingErrorState'; 
}
