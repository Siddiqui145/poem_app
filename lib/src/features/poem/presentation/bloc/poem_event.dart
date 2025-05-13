part of 'poem_bloc.dart';

abstract class PoemEvent {}

class FetchPoemsEvent extends PoemEvent{
  final String author;
  FetchPoemsEvent(this.author);
}

class ClosePoemsEvent extends PoemEvent{}