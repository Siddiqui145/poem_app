import 'package:poem_app/src/features/poem/domain/entities/entities.dart';


abstract class PoemState {}

class PoemInitial extends PoemState {}

class PoemLoading extends PoemState {}

class PoemLoaded extends PoemState {
  final List<PoemEntity> poems;
  PoemLoaded(this.poems);
}

class PoemError extends PoemState {
  final String message;
  PoemError(this.message);
}

class AuthorsLoaded extends PoemState {
  final List<String> authors;
  AuthorsLoaded(this.authors);
}