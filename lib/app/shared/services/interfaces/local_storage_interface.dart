import 'package:flutter_modular/flutter_modular.dart';

@Injectable()
abstract class ILocalStorage {
  Future<dynamic> getValue<T>(String key);
  Future<bool> setValue<T>(String key, dynamic value);
  Future<bool> contains(String key);
  Future<bool> delete(String key);
}