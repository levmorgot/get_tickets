class Department {
  int id;
  int groupId;
  String name;
  String groupName;

  Department({this.id: 0, this.groupId: 0, this.name: '', this.groupName: ''});

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
        id: json['id'],
        groupId: json['groupId'],
        name: json['name'],
        groupName: json['groupName'],
    );
  }
}