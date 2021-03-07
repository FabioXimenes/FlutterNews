abstract class ILocalStorage {
  Future getValue<T>(String key);
  Future setValue<T>(String key, dynamic value);
  Future contains(String key);
  Future delete(String key);
}