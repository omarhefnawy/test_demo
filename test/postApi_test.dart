import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:testin_demo/post/getPost.dart';
import 'package:testin_demo/post/post_model.dart';

import 'postApi_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late PostMethods postMethod;
  setUp(() {
    mockDio = MockDio();
    postMethod = PostMethods(mockDio);
  });
  group("get posts", () {
    test("test if posts success ", () async {
      when(
        mockDio.get('https://jsonplaceholder.typicode.com/todos'),
      ).thenAnswer((realInvocation) async {
        return Response(
          requestOptions: RequestOptions(),
          data: [
            {
              'userId': 1,
              'id': 1,
              'title': "you are idiot",
              'completed': false,
            },
            {
              'userId': 2,
              'id': 2,
              'title': "you are the idiot",
              'completed': false,
            },
            {
              'userId': 3,
              'id': 3,
              'title': "you both idio",
              'completed': false,
            },
          ],
          statusCode: 200,
        );
      });
      //
      final posts = await postMethod.getPosts();
      expect(posts.length, 3);
      expect(posts[0].id, 1);
    });
    // test if fail
    test("fail test exception test", () {
      when(mockDio.get('https://jsonplaceholder.typicode.com/todos')).thenThrow(
        DioException(
          requestOptions: RequestOptions(
            path: 'https://jsonplaceholder.typicode.com/todos',
          ),
          error: "something went wrong",
        ),
      );
      expect(postMethod.getPosts(), throwsA(isInstanceOf<Exception>()));
    });
    // test if not found
    test("not found ", () {
      when(
        mockDio.get('https://jsonplaceholder.typicode.com/todos'),
      ).thenAnswer((realInvocation) async {
       return Response(
          requestOptions: RequestOptions(path: 'https://jsonplaceholder.typicode.com/todos'),
          statusCode: 404,
          data: "not found",
        );
      });
      expect(postMethod.getPosts(), throwsA(isInstanceOf<Exception>()));
    });
  });
}
