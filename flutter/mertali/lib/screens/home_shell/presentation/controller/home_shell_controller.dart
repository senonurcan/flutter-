import 'package:mertaliveonurcan/product/state/base/base_cubit.dart';

final class HomeShellController extends BaseCubit<int> {
  HomeShellController() : super(0);

  void changeIndex(int index) {
    emit(index);
  }
}
