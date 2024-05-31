import 'package:flutter_riverpod/flutter_riverpod.dart';

// 5)
// A provider to expose the fetch count
final fetchCountProvider = NotifierProvider<FetchCount, int>(() {
  return FetchCount();
});

// 1)
// A class that stores the current items count
class FetchCount extends Notifier<int> {
  // 2)
  // The build method returns the default value for the items count.
  @override
  int build() {
    return 5;
  }

  // 3)
  // With this method we can update the current items count
  void incBy5() {
    // 4)
    // `state` is a property of the Notifier class that holds the current value of the notifier.
    // In our case, it's an int.
    state = state + 5;
  }
}
