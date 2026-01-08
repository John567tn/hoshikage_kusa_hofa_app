class Event {
  final int id;
  final String title;
  final String date;
  final String tag;
  final bool isPinned;
  final String content;
  final String color;
  final String location;
  final String? url;
  final String? qqGroup;

  Event({
    required this.id,
    required this.title,
    required this.date,
    required this.tag,
    required this.isPinned,
    required this.content,
    required this.color,
    required this.location,
    this.url,
    this.qqGroup,
  });

  // 从 Json 创建 Event 对象
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      tag: json['tag'],
      isPinned: json['isPinned'] ?? false,
      content: json['content'],
      color: json['color'],
      location: json['location'],
      url: json['url'],
      qqGroup: json['qqGroup'],
    );
  }
}
