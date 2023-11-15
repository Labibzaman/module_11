class apiDATA {
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  apiDATA(
      {required this.id,
      required this.thumbnailUrl,
      required this.title,
      required this.url});

  factory apiDATA.fromJson(Map<String, dynamic> json) {
    return apiDATA(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }

}
