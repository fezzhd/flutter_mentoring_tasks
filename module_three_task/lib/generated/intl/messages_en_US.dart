// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
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
  String get localeName => 'en_US';

  static m0(value) => "Result is ${value}";

  static m1(value) => "Return ${value}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "exitConfirmationContent" : MessageLookupByLibrary.simpleMessage("Are you sure ?"),
    "exitConfirmationTitle" : MessageLookupByLibrary.simpleMessage("Exit"),
    "firstRouteTitle" : MessageLookupByLibrary.simpleMessage("First route"),
    "no" : MessageLookupByLibrary.simpleMessage("No"),
    "ok" : MessageLookupByLibrary.simpleMessage("Ok"),
    "pressMe" : MessageLookupByLibrary.simpleMessage("Press me"),
    "resultIs" : m0,
    "returnButton" : m1,
    "secondRouteTitle" : MessageLookupByLibrary.simpleMessage("Second route"),
    "yes" : MessageLookupByLibrary.simpleMessage("Yes")
  };
}
