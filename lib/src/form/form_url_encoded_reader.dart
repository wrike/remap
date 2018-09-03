import 'dart:convert';

class FormUrlEncodedReader {
  final Map<String, String> _data;

  FormUrlEncodedReader._(this._data) {
    assert(_data != null);
  }

  factory FormUrlEncodedReader() {
    return new FormUrlEncodedReader._({});
  }

  factory FormUrlEncodedReader.fromFormUrlEncoded(Map<String, String> data) {
    return new FormUrlEncodedReader._(data);
  }

  factory FormUrlEncodedReader.fromFormUrlEncodedString(String source) {
    final uri = new Uri(query: source);
    return new FormUrlEncodedReader._(uri.queryParameters);
  }

  int readInt(String key) {
    assert(key != null);

    final value = _data[key];

    if (value != null) {
      return int.parse(value);
    } else {
      return null;
    }
  }

  V readIntWith<V>(String key, V valueMapper(int value)) {
    assert(key != null);
    assert(valueMapper != null);

    final value = _data[key];

    if (value != null) {
      return valueMapper(int.parse(value));
    } else {
      return null;
    }
  }

  bool readBoolean(String key) {
    assert(key != null);

    final value = _data[key];

    if (value != null) {
      return value == 'true';
    } else {
      return null;
    }
  }

  V readBooleanWith<V>(String key, V valueMapper(bool value)) {
    assert(key != null);
    assert(valueMapper != null);

    final value = _data[key];

    if (value != null) {
      return valueMapper(value == 'true');
    } else {
      return null;
    }
  }

  String readString(String key) {
    assert(key != null);

    return _data[key];
  }

  V readStringWith<V>(String key, V valueMapper(String value)) {
    assert(key != null);
    assert(valueMapper != null);

    final value = _data[key];

    if (value != null) {
      return valueMapper(value);
    } else {
      return null;
    }
  }

  Object readJsonString(String key) {
    assert(key != null);

    return json.decode(_data[key]);
  }

  V readJsonStringWith<V>(String key, V valueMapper(Object value)) {
    assert(key != null);
    assert(valueMapper != null);

    final value = _data[key];

    if (value != null) {
      return valueMapper(json.decode(value));
    } else {
      return null;
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
