    import 'package:poem_app/src/features/poem/domain/entities/entities.dart';

    // 4th Step
    // here we actually handle and map data from api with 
    // API Specific logic is kept separated not mixing with domain entities

class  PoemModel extends PoemEntity {
        // ...
        // A model is a more generic term and can represent structured data used within an application. 
        // ...
        // fromJson
        // ...
        // toJson

        PoemModel({
          required String title,
          required List<String> lines,
          required String author,
        }) : super(title: title, lines: lines, author: author);

        factory PoemModel.fromJson(Map<String, dynamic> json){
          return PoemModel(
            title: json['title'] ?? "", 
            lines: List<String>.from(json['lines'] ?? []), 
            author: json['author'] ?? "");
        }
    }