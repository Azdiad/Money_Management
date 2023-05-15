import 'package:hive/hive.dart';
part 'added.g.dart';

@HiveType(typeId: 1)
class added extends HiveObject {
  added(
      {required this.amount,
      required this.type,
      required this.description,
      required this.dates});
  @HiveField(0)
  String type;
  @HiveField(1)
  String amount;
  @HiveField(2)
  String description;
  @HiveField(3)
  DateTime dates;
}
