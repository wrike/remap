# Remap

`Map`-based readers and writers for json and formurlencoded serialization and deserialization.

## Examples

Use `JsonReader` and `JsonWriter` for json serialization and deserialization:

```dart
import 'package:remap/remap.dart';

void main() {
  final json = {
    'firstName': 'John',
    'lastName': 'Doe',
    'age': 20,
    'dateOfBirth': '1985-10-15'
  };

  final reader = new JsonReader.fromJson(json);
  final firstName = reader.readString('firstName');
  final lastName = reader.readString('lastName');
  final age = reader.readInt('age');
  final date = reader.readStringWith('dateOfBirth', (String s) => DateTime.parse(s));

  final writer = new JsonWriter();
  writer.writeString('firstName', firstName);
  writer.writeString('lastName', lastName);
  writer.writeInt('age', age);
  writer.writeStringWith('dateOfBirth', date, (DateTime s) => s.toIso8601String());

  print(writer.toJson());
  print(writer.toJsonString());
}
```

Use `FormUrlEncodedReader` and `FormUrlEncodedWriter` for formurlencoded serialization and deserialization:

```dart
import 'package:remap/remap.dart';

void main() {
  final data = 'firstName=John&lastName=Doe&age=20&dateOfBirth=1985-10-15';

  final reader = new FormUrlEncodedReader.fromFormUrlEncodedString(data);
  final firstName = reader.readString('firstName');
  final lastName = reader.readString('lastName');
  final age = reader.readInt('age');
  final date = reader.readStringWith('dateOfBirth', (String s) => DateTime.parse(s));

  final writer = new FormUrlEncodedWriter();
  writer.writeString('firstName', firstName);
  writer.writeString('lastName', lastName);
  writer.writeInt('age', age);
  writer.writeStringWith('dateOfBirth', date, (DateTime s) => s.toIso8601String());

  print(writer.toFormUrlEncoded());
  print(writer.toFormUrlEncodedString());
}
```
