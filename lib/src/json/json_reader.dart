import 'dart:convert';

class JsonReader {
  final Map<String, Object> _json;

  JsonReader._(this._json) {
    assert(json != null);
  }

  factory JsonReader() {
    return JsonReader._({});
  }

  factory JsonReader.fromJson(Map<String, Object> json) {
    return JsonReader._(json);
  }

  factory JsonReader.fromJsonString(String source) {
    return JsonReader._(json.decode(source) as Map<String, Object>);
  }

  Map<String, Object> readObject(String key) {
    assert(key != null);

    return _json[key] as Map<String, Object>;
  }

  List<Object> readObjectList(String key) {
    assert(key != null);

    final value = _json[key] as List<Object>;

    if (value != null) {
      return value.cast<Map<String, Object>>();
    } else {
      return null;
    }
  }

  V readObjectWith<V>(String key, V valueMapper(Map<String, Object> value)) {
    assert(key != null);
    assert(valueMapper != null);

    final value = _json[key] as Map<String, Object>;

    if (value != null) {
      return valueMapper(value);
    } else {
      return null;
    }
  }

  List<V> readObjectListWith<V>(String key, V valueMapper(Map<String, Object> value)) {
    assert(key != null);
    assert(valueMapper != null);

    final value = _json[key] as List<Object>;

    if (value != null) {
      return value.map((v) => valueMapper(v as Map<String, Object>)).toList();
    } else {
      return null;
    }
  }

  int readInt(String key) {
    assert(key != null);

    return _json[key] as int;
  }

  List<int> readIntList(String key) {
    assert(key != null);

    final value = _json[key] as List<Object>;

    if (value != null) {
      return value.cast<int>();
    } else {
      return null;
    }
  }

  V readIntWith<V>(String key, V valueMapper(int value)) {
    assert(key != null);
    assert(valueMapper != null);

    final value = _json[key] as int;

    if (value != null) {
      return valueMapper(value);
    } else {
      return null;
    }
  }

  List<V> readIntListWith<V>(String key, V valueMapper(int value)) {
    assert(key != null);
    assert(valueMapper != null);

    final value = _json[key] as List<Object>;

    if (value != null) {
      return value.map((v) => valueMapper(v as int)).toList();
    } else {
      return null;
    }
  }

  bool readBoolean(String key) {
    assert(key != null);

    return _json[key] as bool;
  }

  List<bool> readBooleanList(String key) {
    assert(key != null);

    final value = _json[key] as List<Object>;

    if (value != null) {
      return value.cast<bool>();
    } else {
      return null;
    }
  }

  V readBooleanWith<V>(String key, V valueMapper(bool value)) {
    assert(key != null);
    assert(valueMapper != null);

    final value = _json[key] as bool;

    if (value != null) {
      return valueMapper(value);
    } else {
      return null;
    }
  }

  List<V> readBooleanListWith<V>(String key, V valueMapper(bool value)) {
    assert(key != null);
    assert(valueMapper != null);

    final value = _json[key] as List<Object>;

    if (value != null) {
      return value.map((v) => valueMapper(v as bool)).toList();
    } else {
      return null;
    }
  }

  String readString(String key) {
    assert(key != null);

    return _json[key] as String;
  }

  List<String> readStringList(String key) {
    assert(key != null);

    final value = _json[key] as List<Object>;

    if (value != null) {
      return value.cast<String>();
    } else {
      return null;
    }
  }

  V readStringWith<V>(String key, V valueMapper(String value)) {
    assert(key != null);
    assert(valueMapper != null);

    final value = _json[key] as String;

    if (value != null) {
      return valueMapper(value);
    } else {
      return null;
    }
  }

  List<V> readStringListWith<V>(String key, V valueMapper(String value)) {
    assert(key != null);
    assert(valueMapper != null);

    final value = _json[key] as List<Object>;

    if (value != null) {
      return value.map((v) => valueMapper(v as String)).toList();
    } else {
      return null;
    }
  }

  Map<String, Object> readMap(String key) {
    assert(key != null);

    return _json[key] as Map<String, Object>;
  }

  Map<K, V> readMapWith<K, V>(String key, K keyMapper(String key), V valueMapper(Object value)) {
    assert(key != null);
    assert(keyMapper != null);
    assert(valueMapper != null);

    final value = _json[key] as Map<String, Object>;

    if (value != null) {
      return value.map((k, v) => new MapEntry(keyMapper(k), valueMapper(v)));
    } else {
      return null;
    }
  }

  Map<String, Object> toJson() {
    return _json;
  }

  String toJsonString() {
    return json.encode(_json);
  }
}
