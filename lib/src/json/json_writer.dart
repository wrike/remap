import 'dart:convert';

class JsonWriter {
  final Map<String, Object> _json;

  JsonWriter._(this._json) {
    assert(json != null);
  }

  factory JsonWriter() {
    return JsonWriter._({});
  }

  factory JsonWriter.fromJson(Map<String, Object> json) {
    return JsonWriter._(json);
  }

  factory JsonWriter.fromJsonString(String source) {
    return JsonWriter._(json.decode(source) as Map<String, Object>);
  }

  void writeObject(String key, Map<String, Object> value) {
    assert(key != null);

    _json[key] = value;
  }

  void writeObjectList(String key, List<Map<String, Object>> value) {
    assert(key != null);

    _json[key] = value;
  }

  void writeObjectWith<V>(String key, V value, Map<String, Object> valueMapper(V value)) {
    assert(key != null);
    assert(valueMapper != null);

    if (value != null) {
      _json[key] = valueMapper(value);
    } else {
      _json[key] = null;
    }
  }

  void writeObjectListWith<V>(String key, List<V> value, Map<String, Object> valueMapper(V value)) {
    assert(key != null);
    assert(valueMapper != null);

    if (value != null) {
      _json[key] = value.map(valueMapper).toList();
    } else {
      _json[key] = null;
    }
  }

  void writeInt(String key, int value) {
    assert(key != null);

    _json[key] = value;
  }

  void writeIntList(String key, List<int> value) {
    assert(key != null);

    _json[key] = value;
  }

  void writeIntWith<V>(String key, V value, int valueMapper(V value)) {
    assert(key != null);
    assert(valueMapper != null);

    if (value != null) {
      _json[key] = valueMapper(value);
    } else {
      _json[key] = null;
    }
  }

  void writeIntListWith<V>(String key, List<V> value, int valueMapper(V value)) {
    assert(key != null);
    assert(valueMapper != null);

    if (value != null) {
      _json[key] = value.map(valueMapper).toList();
    } else {
      _json[key] = null;
    }
  }

  void writeBoolean(String key, bool value) {
    assert(key != null);

    _json[key] = value;
  }

  void writeBooleanList(String key, List<bool> value) {
    assert(key != null);

    _json[key] = value;
  }

  void writeBooleanWith<V>(String key, V value, bool valueMapper(V value)) {
    assert(key != null);
    assert(valueMapper != null);

    if (value != null) {
      _json[key] = valueMapper(value);
    } else {
      _json[key] = null;
    }
  }

  void writeBooleanListWith<V>(String key, List<V> value, bool valueMapper(V value)) {
    assert(key != null);
    assert(valueMapper != null);

    if (value != null) {
      _json[key] = value.map(valueMapper).toList();
    } else {
      _json[key] = null;
    }
  }

  void writeString(String key, String value) {
    assert(key != null);

    _json[key] = value;
  }

  void writeStringList(String key, List<String> value) {
    assert(key != null);

    _json[key] = value;
  }

  void writeStringWith<V>(String key, V value, String valueMapper(V value)) {
    assert(key != null);
    assert(valueMapper != null);

    if (value != null) {
      _json[key] = valueMapper(value);
    } else {
      _json[key] = null;
    }
  }

  void writeStringListWith<V>(String key, List<V> value, String valueMapper(V value)) {
    assert(key != null);
    assert(valueMapper != null);

    if (value != null) {
      _json[key] = value.map(valueMapper).toList();
    } else {
      _json[key] = null;
    }
  }

  void writeMap(String key, Map<String, Object> value) {
    assert(key != null);

    _json[key] = value;
  }

  void writeMapWith<K, V>(String key, Map<K, V> value, String keyMapper(K key), Object valueMapper(V value)) {
    assert(key != null);
    assert(keyMapper != null);
    assert(valueMapper != null);

    if (value != null) {
      _json[key] = value.map((k, v) => new MapEntry(keyMapper(k), valueMapper(v)));
    } else {
      _json[key] = null;
    }
  }

  Map<String, Object> toJson() {
    return _json;
  }

  String toJsonString() {
    return json.encode(_json);
  }
}
