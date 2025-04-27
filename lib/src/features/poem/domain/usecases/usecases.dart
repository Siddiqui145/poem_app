 import 'package:poem_app/src/features/poem/domain/entities/entities.dart';
import '../repositories/repositories.dart';

// 3rd step use case written for calling the repository
// it is like a 1 structured class that shows or lists what all possible actions could be taken

    class GetPoemUseCase {
        final PoemRepository repository;
      
        GetPoemUseCase({required this.repository});
      
        // Future<User> execute(String userId) async {
        //   return userRepository.getUser(userId);
        // }

        Future<List<PoemEntity>> execute(String author) {
          return repository.fetchPoemsByAuthor(author);
        }
      }
      