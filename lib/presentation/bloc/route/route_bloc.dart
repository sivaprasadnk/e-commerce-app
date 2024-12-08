import 'package:e_comm_app/presentation/bloc/route/route_event.dart';
import 'package:e_comm_app/presentation/bloc/route/route_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> {
  RouteBloc() : super(RouteState()) {
    on(updateIndex);
  }

  updateIndex(UpdateIndexEvent event, Emitter<RouteState> emit) {
    emit(state.copyWith(index: event.index));
  }
}
