 import 'package:poem_app/src/features/poem/domain/entities/entities.dart';

// 2nd step, external api links all separated, here only possible actions
// like we have fetch operation based on our entity structure.
abstract class PoemRepository {
        Future<List<PoemEntity>> fetchPoemsByAuthor(String author);
        Future<List<String>> fetchAuthors();
      }
    