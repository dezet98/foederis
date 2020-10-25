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

// // enum TO string
// String enumToString(Object o) {
//   if (o == null) return null;
//   return o.toString().split('.').last;
// }

// // enum FROM string
// T enumFromString<T>(List<T> enumValues, String key, {T fallback}) =>
//     enumValues.firstWhere(
//         (element) => key?.toLowerCase() == enumToString(element).toLowerCase(),
//         orElse: () {
//       if (fallback == null)
//         assert(false,
//             '\nenumFromString failed and fallback was not provided.\n\tkey: $key;\n\tenums: $enumValues');
//       return fallback;
//     });
