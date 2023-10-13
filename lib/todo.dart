class ToDo{
  String title;
  String time;
  String status;
  ToDo({
    required this.title,
    required this.time,
    this.status = 'Pending',
  });

}