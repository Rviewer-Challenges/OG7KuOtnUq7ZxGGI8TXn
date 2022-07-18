class Feed {
  String guid;
  String source;
  String? _title;
  String? _description;
  String? _urlImage;
  String link;
  DateTime pubDate;

  Feed(
      {required this.guid,
      required this.pubDate,
      required this.link,
      required this.source,
      String? title,
      String? description,
      String? urlImage}) {
    _description = description;
    _urlImage = urlImage;
    _title = title;
  }

  Feed.fromJson(Map<String, dynamic> json)
      : guid = json['guid'],
        source = json['source'],
        _title = json['title'],
        _description = json['description'],
        _urlImage = json['urlImage'],
        link = json['link'],
        pubDate = DateTime.parse(json['pubDate']);

  Map<String, dynamic> toJson() => {
        'guid': guid,
        'source': source,
        'title': _title,
        'description': _description,
        'urlImage': _urlImage,
        'link': link,
        'pubDate': pubDate.toString(),
      };

  String get description => _description ?? 'No description';

  String get title => _title ?? 'No Title';

  String? get urlImage => _urlImage;
}
