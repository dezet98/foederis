String enumToString(Object o) =>
    o == null ? null : o.toString().split('.').last;

Enum enumFromString<Enum>(List<Enum> enumValues, String key) =>
    enumValues.firstWhere(
        (element) => key?.toLowerCase() == enumToString(element).toLowerCase(),
        orElse: () {
      return null;
    });
