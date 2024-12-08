class RouteState {
  final int? currentIndex;
  RouteState({
    this.currentIndex = 0,
  });

  RouteState copyWith({int? index}) {
    return RouteState(
      currentIndex: index ?? currentIndex,
    );
  }
}
