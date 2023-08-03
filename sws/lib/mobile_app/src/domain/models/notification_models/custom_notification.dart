class CustomNotification {
  String docID;
  String id;
  String title;
  String text;
  String createdTime;
  String image;

  CustomNotification({
    required this.docID,
    required this.id,
    required this.title,
    required this.text,
    required this.createdTime,
    required this.image,
  });

  factory CustomNotification.fromJson(Map<String, dynamic> json) {
    return CustomNotification(
      docID: json['docID'] as String,
      id: json['id'] as String,
      title: json['title'] as String,
      text: json['text'] as String,
      createdTime: json['createdTime'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'docID': docID,
      'id': id,
      'title': title,
      'text': text,
      'createdTime': createdTime,
      'image': image,
    };
  }
}
