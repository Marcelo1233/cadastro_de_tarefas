class Todo {
  Todo({required this.title,required this.dateTime});

Todo.fronJson(Map<String, dynamic> json)
: title = json['datetime'],
dateTime = DateTime.parse('datetime');

  String title;
  DateTime dateTime;

  Map<String, dynamic> toJason(){
    return{
     'title': title,
     'datetime': dateTime.toIso8601String(),
    };
  }
}