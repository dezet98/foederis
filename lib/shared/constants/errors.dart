enum LoginError {
  bad_credentials,
  undefined,
}

enum RegisterError {
  invalid_email,
  email_already_in_use,
  weak_password,
  operation_not_allowed,
  undefined,
}

enum UserLoadDataError {
  undefined,
}

enum FetchingError {
  field_not_exist, // when using get() method on document and attribute doesn't exist
  undefined,
}

enum StorageError {
  undefined,
}

enum StreamError {
  undefined,
}

enum SendingError {
  undefined,
}

enum FetchFilterType {
  isEqualTo,
  isNotEqualTo,
  isLessThan,
  isLessThanOrEqualTo,
  isGreaterThan,
  isGreaterThanOrEqualTo,
  arrayContains,
  arrayContainsAny,
  whereIn,
  whereNotIn,
  isNull
}

enum UploadDataError {
  wrongFieldName,
  undefined,
  required_field_not_provider,
  data_not_valid,
}
