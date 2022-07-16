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

  String get description => _description ?? 'No description';

  String get title => _title ?? 'No Title';

  String? get urlImage => _urlImage;
}
