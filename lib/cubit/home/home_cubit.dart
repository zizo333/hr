import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/enums.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.init());

  changeDayAction(DayAction dayAction) {
    emit(state.copyWith(
      dayAction: dayAction,
      showSlideButton: false,
    ));
  }

  showSlideButton() {
    emit(state.copyWith(
      showSlideButton: true,
    ));
  }
}
