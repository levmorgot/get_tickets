class Department {
  int id;
  String name;

  Department({this.id: 0, this.name: ''});

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
        id: json['id'],
        name: json['name'],
    );
  }
}