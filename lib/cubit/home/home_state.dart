part of 'home_cubit.dart';

class HomeState extends Equatable {
  final RequestState requestState;
  final DayAction dayAction;
  final String message;
  final bool showSlideButton;

  const HomeState({
    required this.requestState,
    required this.dayAction,
    required this.message,
    required this.showSlideButton,
  });

  factory HomeState.init() {
    return const HomeState(
      requestState: RequestState.none,
      dayAction: DayAction.on,
      message: '',
      showSlideButton: false,
    );
  }

  HomeState copyWith({
    RequestState? requestState,
    DayAction? dayAction,
    String? message,
    bool? showSlideButton,
  }) {
    return HomeState(
      requestState: requestState ?? this.requestState,
      dayAction: dayAction ?? this.dayAction,
      message: message ?? this.message,
      showSlideButton: showSlideButton ?? this.showSlideButton,
    );
  }

  @override
  List<Object> get props => [
        requestState,
        dayAction,
        message,
        showSlideButton,
      ];
}
