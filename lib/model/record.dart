class Record{
  final String name;
  final String avatarUrl;
  final String text;
  final String photoUrl;
  Record.fromMap(Map<String, dynamic>map):
        name = map['name'],
        avatarUrl = map['avatarUrl'],
        text = map['text'],
        photoUrl = map['photoUrl'];
}