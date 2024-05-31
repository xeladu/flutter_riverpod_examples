import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/filter_data_multiple_providers_example/domain/filter_option_enum.dart';

// 5)
// A provider to expose the filter option
final filterOptionProvider =
    NotifierProvider<FilterOption, FilterOptionEnum>(FilterOption.new);

// 1)
// A class that stores the current selected filter option
class FilterOption extends Notifier<FilterOptionEnum> {
  // 2)
  // The build method returns the default value for the filter option.
  @override
  build() => FilterOptionEnum.priceMoreThan5;

  // 3)
  // With this method we can update the current filter option
  void setFilter(FilterOptionEnum filter) {
    // 4)
    // `state` is a property of the Notifier class that holds the current value of the notifier.
    // In our case, it's a FilterOptionEnum.
    state = filter;
  }
}
