// presentation/bloc/poem_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poem_app/src/features/poem/domain/usecases/usecases.dart';
import 'package:poem_app/src/features/poem/presentation/bloc/poem_state.dart';


part 'poem_event.dart';
//part 'poem_state.dart';

class PoemBloc extends Bloc<PoemEvent, PoemState> {
  final GetPoemUseCase fetchPoems;
  final GetAuthorsUseCase fetchAuthors;

  PoemBloc({required this.fetchPoems, required this.fetchAuthors}) : super(PoemInitial()) {
    on<FetchPoemsEvent>(_onFetchPoemsEvent);
    on<ClosePoemsEvent>(_onClosePoemsEvent);
    on<FetchAuthorsEvent>(_onFetchAuthorsEvent);
  }

  Future<void> _onFetchPoemsEvent(FetchPoemsEvent event, Emitter<PoemState> emit) async {
    emit(PoemLoading());
    try {
      final poems = await fetchPoems.execute(event.author);
      emit(PoemLoaded(poems));
    } catch (e) {
      emit(PoemError(e.toString()));
    }
  }

  Future<void> _onClosePoemsEvent(ClosePoemsEvent event, Emitter<PoemState> emit) async {
    emit(PoemLoading());
    try {
      emit(PoemInitial());
    } catch (e) {
      emit(PoemError(e.toString()));
    }
  }

  Future<void> _onFetchAuthorsEvent(FetchAuthorsEvent event, Emitter<PoemState> emit) async{
    emit(PoemLoading());
    try{
      final authors = await fetchAuthors.execute();
      emit(AuthorsLoaded(authors));
    }
    catch(e){
      emit(PoemError(e.toString()));
    }
  }
}
