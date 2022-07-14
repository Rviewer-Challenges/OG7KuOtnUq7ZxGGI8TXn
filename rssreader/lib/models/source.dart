class SourceFeed {
  String name;
  String url;
  bool active;

  SourceFeed({required this.name, required this.url, this.active = true});

  bool get isActive => active;

  bool get isNotActive => !active;
}
