class Filial {
  int id;
  int cashId;
  String name;
  String address;
  String phone;

  Filial({this.id: 0, this.cashId: 0, this.name: '', this.address: '', this.phone: ''});

  factory Filial.fromJson(Map<String, dynamic> json) {
    return Filial(
        id: json['id'],
        cashId: json['cashId'],
        name: json['name'],
        address: json['address'],
        phone: json['phone'],
    );
  }
}