part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  final bool switchValue;
  const SwitchState(this.switchValue);

  @override
  List<Object> get props => [switchValue];
}

class SwitchInitial extends SwitchState {
  const SwitchInitial(bool switchValue) : super(switchValue);
}
