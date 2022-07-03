import 'package:hive/hive.dart';

part 'userdetail.g.dart';

@HiveType(typeId: 0)
class UserDetail extends HiveObject {
  UserDetail({
    required this.id,
    required this.name,
    required this.gender,
    required this.age,
  });

  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String gender;

  @HiveField(3)
  double age;
}
