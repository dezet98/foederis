// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a messages locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'messages';

  static m0(howManyDays) => "${Intl.plural(howManyDays, one: '${howManyDays} dzień', other: '${howManyDays} dni')}";

  static m1(howManyHours) => "${Intl.plural(howManyHours, one: '${howManyHours} godzina', two: '${howManyHours} godziny', other: '${howManyHours} godzin')}";

  static m2(howManyMinutes) => "${Intl.plural(howManyMinutes, one: '${howManyMinutes} minuta', two: '${howManyMinutes} minuty', other: '${howManyMinutes} minut')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "plural_days" : m0,
    "plural_hours" : m1,
    "plural_minutes" : m2
  };
}
