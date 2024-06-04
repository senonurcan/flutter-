import 'package:flutter_bloc/flutter_bloc.dart';

class BaseCubit<S> extends Cubit<S> {
  BaseCubit(super.initialState);

  @override
  void emit(state) {
    if (isClosed) return;
    super.emit(state);
  }
}
