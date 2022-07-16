import '../models/source.dart';

List<SourceFeed> sourcesConfig = [
  SourceFeed(
    name: 'Gamedeveloper',
    url: 'https://gamedeveloper.com/rss.xml',
    active: true,
  ),
  SourceFeed(
    name: 'Ultra engine',
    url:
        'https://www.ultraengine.com/community/blogs/blog/rss/41-leadwerks-company-blog/',
    active: true,
  ),
  SourceFeed(
    name: 'Gamefromscratch',
    url: 'https://gamefromscratch.com/feed/',
    active: true,
  ),
  SourceFeed(
    name: 'Unity Blogs',
    url: 'https://blog.unity.com/feed',
    active: true,
  )
];
