import 'package:poem_app/src/features/poem/data/sources/sources.dart';
import 'package:poem_app/src/features/poem/domain/entities/entities.dart';
import 'package:poem_app/src/features/poem/domain/repositories/repositories.dart';


// 6th step the api gets data but now it has to be connected for a fetch operation
// Implement repository by connecting RemoteDataSource to domain PoemRepository.
class PoemRepositoryImpl extends PoemRepository{
  final PoemRemoteDataSource remoteDataSource;

  PoemRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<PoemEntity>> fetchPoemsByAuthor(String author) async{
    final poems = await remoteDataSource.getPoemsByAuthor(author);
    return poems;
  }
}