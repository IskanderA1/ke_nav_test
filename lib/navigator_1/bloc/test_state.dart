part of 'test_bloc.dart';

abstract class TestState{
  const TestState();
}

class TestInitial extends TestState {
  @override
  List<Object> get props => [];
}
