

class Post{
 final int userId;
 final int id;
 final String title;
 final bool completed;

  Post({required this.userId, required this.id, required this.title, required this.completed});
 factory Post.fromJson(Map<String,dynamic> map)
 {
   return Post(
       userId: map['userId'],
       id: map['id'],
       title: map['title'],
       completed: map['completed']
   );
 }
}