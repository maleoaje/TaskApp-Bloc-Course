import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchInitial(false)) {
    on<SwitchOnEvent>((event, emit) {
      emit(
        const SwitchState(true),
      );
    });
    on<SwitchOffEvent>((event, emit) {
      emit(
        const SwitchState(false),
      );
    });
  }
}
