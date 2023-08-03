class NewsBody {
  String image;
  String title;
  String text;

  NewsBody({
    required this.image,
    required this.title,
    required this.text,
  });

  factory NewsBody.fromJson(Map<String, dynamic> json) {
    return NewsBody(
      image: json['image'] as String,
      title: json['title'] as String,
      text: json['text'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'text': text,
    };
  }
}
