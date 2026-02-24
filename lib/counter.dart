import 'package:equatable/equatable.dart';

class Counter extends Equatable {
   int value;

  Counter({this.value = 0});

  int increment() => value++;
  int decrement() => value--;

  @override
  List<Object?> get props => [value];
}