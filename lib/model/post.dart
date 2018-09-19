class Post {
  final String userId;
  final int id;
  final String title;
  final String body;
  final String images;

  Post({this.userId, this.id, this.title, this.body, this.images});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['imdb_code'],
      id: json['id'],
      title: json['title_english'],
      body: json['summary'],
      images: json['large_cover_image'],
    );
  }

}