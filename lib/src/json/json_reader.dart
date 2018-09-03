import 'dart:convert' show jsonEncode, jsonDecode;

class JsonReader {
  final Map<String, Object> _data;

  JsonReader._(this._data) {
    assert(_data != null);
  }

  factory JsonReader() {
    return JsonReader._({});
  }

  factory JsonReader.fromJson(Map<String, Object> json) {
    return JsonReader._(json);
  }

  factory JsonReader.fromJsonString(String source) {
    return JsonReader._(jsonDecode(source) as Map<String, Object>);
  }

  Object readObject(String key) {
    assert(key != null);

    return _data[key];
  }

  List<Object> readObjectList(String key) {
    assert(key != null);

    return _data[key] as List<Object>;
  }

  V readObjectWith<V>(String key, V valueMapper(Object value)) {
    assert(key != null);
    assert(valueMapper != null);

    final value = _data[key];

    if (value != null) {
      return valueMapper(value);
    } else {
      return null;
    }
  }

  List<V> readObjectListWith<V>(String key, V valueMapper(Object value)) {
    assert(key != null);
    assert(valueMapper != null);

    final value = _data[key] as List<Object>;

    if (value != null) {
      return value.map(valueMapper).toList();
    } else {
      return null;
    }
  }

  int readInt(String key) {
    assert(key != null);

    return _data[key] as int;
  }

  List<int> readIntList(String key) {
    assert(key != null);

    final value = _data[key] as List<Object>;

    if (value != null) {
      return value.map((v) => v as int).toList();
    } else {
      return null;
    }
  }

  V readIntWith<V>(String key, V valueMapper(int value)) {
    assert(key != null);
    assert(valueMapper != null);

    final value = _data[key] as int;

    if (value != null) {
      return valueMapper(value);
    } else {
      return null;
    }
  }

  List<V> readIntListWith<V>(String key, V valueMapper(int value)) {
    assert(key != null);
    assert(valueMapper != null);

    final value = _data[key] as List<Object>;

    if (value != null) {
      return value.map((v) => valueMapper(v as int)).toList();
    } else {
      return null;
    }
  }

  bool readBoolean(String key) {
    assert(key != null);

    return _data[key] as bool;
  }

  List<bool> readBooleanList(String key) {
    assert(key != null);

    final value = _data[key] as List<Object>;

    if (value != null) {
      return value.map((v) => v as bool).toList();
    } else {
      return null;
    }
  }

  V readBooleanWith<V>(String key, V valueMapper(bool value)) {
    assert(key != null);
    assert(valueMapper != null);

    final value = _data[key] as bool;

    if (value != null) {
      return valueMapper(value);
    } else {
      return null;
    }
  }

  List<V> readBooleanListWith<V>(String key, V valueMapper(bool value)) {
    assert(key != null);
    assert(valueMapper != null);

    final value = _data[key] as List<Object>;

    if (value != null) {
      return value.map((v) => valueMapper(v as bool)).toList();
    } else {
      return null;
    }
  }

  String readString(String key) {
    assert(key != null);

    return _data[key] as String;
  }

  List<String> readStringList(String key) {
    assert(key != null);

    final value = _data[key] as List<Object>;

    if (value != null) {
      return value.map((v) => v as String).toList();
    } else {
      return null;
    }
  }

  V readStringWith<V>(String key, V valueMapper(String value)) {
    assert(key != null);
    assert(valueMapper != null);

    final value = _data[key] as String;

    if (value != null) {
      return valueMapper(value);
    } else {
      return null;
    }
  }

  List<V> readStringListWith<V>(String key, V valueMapper(String value)) {
    assert(key != null);
    assert(valueMapper != null);

    final value = _data[key] as List<Object>;

    if (value != null) {
      return value.map((v) => valueMapper(v as String)).toList();
    } else {
      return null;
    }
  }

  Map<String, Object> readMap(String key) {
    assert(key != null);

    return _data[key] as Map<String, Object>;
  }

  List<Map<String, Object>> readMapList(String key) {
    assert(key != null);

    final value = _data[key] as List<Object>;

    if (value != null) {
      return value.map((v) => v as Map<String, Object>).toList();
    } else {
      return null;
    }
  }

  V readMapWith<V>(String key, V valueMapper(Map<String, Object> value)) {
    assert(key != null);
    assert(valueMapper != null);

    final value = _data[key] as Map<String, Object>;

    if (value != null) {
      return valueMapper(value);
    } else {
      return null;
    }
  }

  List<V> readMapListWith<V>(String key, V valueMapper(Map<String, Object> value)) {
    assert(key != null);
    assert(valueMapper != null);

    final value = _data[key] as List<Object>;

    if (value != null) {
      return value.map((v) => valueMapper(v as Map<String, Object>)).toList();
    } else {
      return null;
    }
  }

  Map<String, Object> toJson() {
    return _data;
  }

  String toJsonString() {
    return jsonEncode(_data);
  }
}
