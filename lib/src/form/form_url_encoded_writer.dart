import 'dart:convert';

class FormUrlEncodedWriter {
  final Map<String, String> _data;

  FormUrlEncodedWriter._(this._data) {
    assert(_data != null);
  }

  factory FormUrlEncodedWriter() {
    return new FormUrlEncodedWriter._({});
  }

  factory FormUrlEncodedWriter.fromFormUrlEncoded(Map<String, String> data) {
    return new FormUrlEncodedWriter._(data);
  }

  factory FormUrlEncodedWriter.fromFormUrlEncodedString(String source) {
    final uri = new Uri(query: source);
    return new FormUrlEncodedWriter._(uri.queryParameters);
  }

  void writeInt(String key, int value) {
    assert(key != null);

    if (value != null) {
      _data[key] = value.toString();
    } else {
      _data[key] = null;
    }
  }

  void writeIntWith<V>(String key, V value, int valueMapper(V value)) {
    assert(key != null);
    assert(valueMapper != null);

    if (value != null) {
      _data[key] = valueMapper(value).toString();
    } else {
      _data[key] = null;
    }
  }

  void writeBoolean(String key, bool value) {
    assert(key != null);

    if (value != null) {
      _data[key] = value.toString();
    } else {
      _data[key] = null;
    }
  }

  void writeBooleanWith<V>(String key, V value, bool valueMapper(V value)) {
    assert(key != null);
    assert(valueMapper != null);

    if (value != null) {
      _data[key] = valueMapper(value).toString();
    }
  }

  void writeString(String key, String value) {
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

  void writeJsonString(String key, Object value) {
    assert(key != null);

    _data[key] = json.encode(value);
  }

  void writeJsonStringWith<V>(String key, V value, Object valueMapper(V value)) {
    assert(key != null);
    assert(valueMapper != null);

    if (value != null) {
      _data[key] = json.encode(valueMapper(value));
    } else {
      _data[key] = null;
    }
  }

  Map<String, String> toFormUrlEncoded() {
    return _data;
  }

  String toFormUrlEncodedString() {
    final uri = new Uri(queryParameters: _data);
    return uri.query;
  }
}
