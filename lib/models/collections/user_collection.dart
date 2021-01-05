import '../utils/query_field.dart';

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
  static CollectionField gender =
      CollectionField(fieldName: 'gender', isRequired: false);
  static CollectionField about =
      CollectionField(fieldName: 'about', isRequired: false);
  static CollectionField phone =
      CollectionField(fieldName: 'phone', isRequired: false);
  static CollectionField photoUrl =
      CollectionField(fieldName: 'photoUrl', isRequired: false);

  static List<CollectionField> get allFields => [
        email,
        firstName,
        secondName,
        birthday,
        gender,
        about,
        phone,
      ];
}
