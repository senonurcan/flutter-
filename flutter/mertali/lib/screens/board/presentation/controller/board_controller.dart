part of './../board_screen.dart';

abstract class BoardController extends State<BoardView> {
  @override
  void initState() {
    super.initState();
    _checkFirstOpened();
  }

  void _checkFirstOpened() async {
    final bool isFirstOpened = await ProductPreferences.instance.isFirstOpened;
    log('isFirstOpened: $isFirstOpened');
    if (!isFirstOpened) {
      _goNextPage();
    }
  }

  _goNextPage() {
    context.go(AppRoutes.login.location);
  }
}
