import 'package:equatable/equatable.dart';

class Pair<T> extends Equatable {
  final T first;
  final T second;

  Pair(
    this.first,
    this.second,
  );

  @override
  List<Object?> get props => [first, second];
}
