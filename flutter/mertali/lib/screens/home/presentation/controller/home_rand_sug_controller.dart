import 'package:mertaliveonurcan/product/models/oneri.dart';
import 'package:mertaliveonurcan/product/state/base/base_cubit.dart';
import 'package:mertaliveonurcan/screens/home/presentation/controller/home_manager.dart';

final class HomeRandSugController extends BaseCubit<List<Oneri>> {
  HomeRandSugController() : super(<Oneri>[]);

  Future<void> getRandomSuggestions() async {
    emit(await HomeManager().getRandomSuggestions());
  }
}
