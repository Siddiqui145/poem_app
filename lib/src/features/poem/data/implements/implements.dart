
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class PoemRepositoryImp implements PoemRepository{

        final PoemRemoteDataSource remoteDataSource;
        PoemRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    