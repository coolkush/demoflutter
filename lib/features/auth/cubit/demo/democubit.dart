import 'package:demoproject/features/auth/cubit/demo/demostate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DemoCubit extends Cubit<DemoState> {
  DemoCubit() : super(const DemoState());
  void incrementCounter() {
    emit(state.copyWith(count: state.count + 1));
  }
}
