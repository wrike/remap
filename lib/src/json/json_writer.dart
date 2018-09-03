import 'dart:convert' show jsonEncode, jsonDecode;

class JsonWriter {
  final Map<String, Object> _data;

  JsonWriter._(this._data) {
    assert(_data != null);
  }

  factory JsonWriter() {
    return JsonWriter._({});
  }

  factory JsonWriter.fromJson(Map<String, Object> json) {
    return JsonWriter._(json);
  }

  factory JsonWriter.fromJsonString(String source) {
    return JsonWriter._(jsonDecode(source) as Map<String, Object>);
  }

  void writeObject(String key, Object value) {
    assert(key != null);

    _data[key] = value;
  }

  void writeObjectList(String key, List<Object> value) {
    assert(key != null);

    _data[key] = value;
  }

  void writeObjectWith<V>(String key, V value, Object valueMapper(V value)) {
    assert(key != null);
    assert(valueMapper != null);

    if (value != null) {
      _data[key] = valueMapper(value);
    } else {
      _data[key] = null;
    }
  }

  void writeObjectListWith<V>(String key, List<V> value, Object valueMapper(V value)) {
    assert(key != null);
    assert(valueMapper != null);

    if (value != null) {
      _data[key] = value.map(valueMapper).toList();
    } else {
      _data[key] = null;
    }
  }

  void writeInt(String key, int value) {
    assert(key != null);

    _data[key] = value;
  }

  void writeIntList(String key, List<int> value) {
    assert(key != null);

    _data[key] = value;
  }

  void writeIntWith<V>(String key, V value, int valueMapper(V value)) {
    assert(key != null);
    assert(valueMapper != null);

    if (value != null) {
      _data[key] = valueMapper(value);
    } else {
      _data[key] = null;
    }
  }

  void writeIntListWith<V>(String key, List<V> value, int valueMapper(V value)) {
    assert(key != null);
    assert(valueMapper != null);

    if (value != null) {
      _data[key] = value.map(valueMapper).toList();
    } else {
      _data[key] = null;
    }
  }

  void writeBoolean(String key, bool value) {
    assert(key != null);

    _data[key] = value;
  }

  void writeBooleanList(String key, List<bool> value) {
    assert(key != null);

    _data[key] = value;
  }

  void writeBooleanWith<V>(String key, V value, bool valueMapper(V value)) {
    assert(key != null);
    assert(valueMapper != null);

    if (value != null) {
      _data[key] = valueMapper(value);
    } else {
      _data[key] = null;
    }
  }

  void writeBooleanListWith<V>(String key, List<V> value, bool valueMapper(V value)) {
    assert(key != null);
    assert(valueMapper != null);

    if (value != null) {
      _data[key] = value.map(valueMapper).toList();
    } else {
      _data[key] = null;
    }
  }

  void writeString(String key, String value) {
    assert(key != null);

    _data[key] = value;
  }

  void writeStringList(String key, List<String> value) {
    assert(key != null);

    _data[key] = value;
  }

  void writeStringWith<V>(String key, V value, String valueMapper(V value)) {
    assert(key != null);
    assert(valueMapper != null);

    if (value != null) {
      _data[key] = valueMapper(value);
    } else {
      _data[key] = null;
    }
  }

  void writeStringListWith<V>(String key, List<V> value, String valueMapper(V value)) {
    assert(key != null);
    assert(valueMapper != null);

    if (value != null) {
      _data[key] = value.map(valueMapper).toList();
    } else {
      _data[key] = null;
    }
  }

  void writeMap(String key, Map<String, Object> value) {
    assert(key != null);

    _data[key] = value;
  }

  void writeMapWith<V>(String key, V value, Map<String, Object> valueMapper(V value)) {
    assert(key != null);
    assert(valueMapper != null);

    if (value != null) {
      _data[key] = valueMapper(value);
    } else {
      _data[key] = null;
    }
  }

  Map<String, Object> toJson() {
    return _data;
  }

  String toJsonString() {
    return jsonEncode(_data);
  }
}
