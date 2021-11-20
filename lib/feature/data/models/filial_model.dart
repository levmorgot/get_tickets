import 'package:get_tickets/feature/domain/entities/filial_entity.dart';
import 'package:meta/meta.dart';

class FilialModel extends FilialEntity {
  FilialModel({
    @required id,
    @required cashId,
    @required name,
    address,
    phone,
  }) : super(
          id: id,
          cashId: cashId,
          name: name,
          address: address,
          phone: phone,
        );

  factory FilialModel.fromJson(Map<String, dynamic> json) {
    return FilialModel(
      id: json['id'],
      cashId: json['cashId'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cashId': cashId,
      'name': name,
      'address': address,
      'phone': phone,
    };
  }
}
