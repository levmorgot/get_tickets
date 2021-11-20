import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class FilialEntity extends Equatable {
  final int? id;
  final int? cashId;
  final String? name;
  final String? address;
  final String? phone;

  FilialEntity({
    @required this.id,
    @required this.cashId,
    @required this.name,
    this.address,
    this.phone,
  });


  @override
  List<Object?> get props => [id, cashId, name, address, phone];
}
