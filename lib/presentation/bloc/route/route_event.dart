abstract class RouteEvent {}

class UpdateIndexEvent extends RouteEvent {
  final int index;
  UpdateIndexEvent(this.index);
}
