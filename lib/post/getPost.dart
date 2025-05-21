import 'package:dio/dio.dart';
import 'package:testin_demo/post/post_model.dart';


class PostMethods {
 final Dio dio ;

  PostMethods(this.dio);


   Future<List<Post>> getPosts() async {


    try {
      final response = await dio.get('https://jsonplaceholder.typicode.com/todos');

       if(response.statusCode==200)
         {return (response.data as List)
             .map((toElement){
           return  Post.fromJson(toElement);
         }).toList();}
       else{
         throw Exception("status code not =200");

       }


    } catch (e) {
      throw Exception("Error fetching data: ${e.toString()}");
    }
  }
}
