import 'package:equatable/equatable.dart';

class DemoState extends Equatable {
  final int count;
  const DemoState({this.count = 0});
  @override
  List<Object?> get props => [count];

  DemoState copyWith({int? count}) {
    return DemoState(count: count ?? this.count);
  }
}
