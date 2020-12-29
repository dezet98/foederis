import 'query_field.dart';

class UserCollection {
  static String collectionName = 'user';

  static CollectionField email =
      CollectionField(fieldName: 'email', isRequired: true);
  static CollectionField firstName =
      CollectionField(fieldName: 'firstName', isRequired: false);
  static CollectionField secondName =
      CollectionField(fieldName: 'secondName', isRequired: false);
  static CollectionField birthday =
      CollectionField(fieldName: 'birthday', isRequired: false);

  static List<CollectionField> get allFields => [
        email,
        firstName,
        secondName,
        birthday,
      ];
}
