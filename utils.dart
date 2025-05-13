import 'package:interact/interact.dart';

int Interact(List<String> listSelection, String message) {
  final selection = Select(
    prompt: message,
    options: listSelection,
  ).interact();
  return selection;
}
