import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mertaliveonurcan/product/init/language/locale_keys.g.dart';
import 'package:mertaliveonurcan/product/models/oneri.dart';
import 'package:mertaliveonurcan/screens/home/presentation/controller/home_my_sug_controller.dart';

class AddSuggestionWidget extends StatefulWidget {
  const AddSuggestionWidget({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;
  @override
  State<AddSuggestionWidget> createState() => _AddSuggestionWidgetState();
}

class _AddSuggestionWidgetState extends State<AddSuggestionWidget> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController oneriController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${LocaleKeys.title.tr()}:',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: TextField(
                    controller: titleController,
                    onChanged: (value) =>
                        titleController.text = value.toString(),
                    decoration: InputDecoration(
                      hintText: LocaleKeys.title.tr(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  '${LocaleKeys.home_page_suggestion.tr()}:',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ).tr(),
                Expanded(
                  child: TextField(
                    controller: oneriController,
                    onChanged: (value) =>
                        oneriController.text = value.toString(),
                    decoration: InputDecoration(
                      hintText: LocaleKeys.home_page_suggestion.tr(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: add,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Buton rengi
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    LocaleKeys.home_page_add,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ).tr(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void add() {
    BlocProvider.of<HomeMySugController>(context).addSuggestion(
      Oneri(
        id: UniqueKey().hashCode,
        title: titleController.text,
        oneri: oneriController.text,
      ),
    );
    titleController.clear();
    oneriController.clear();

    if (widget.scrollController.hasClients) {
      widget.scrollController.animateTo(
        widget.scrollController.position.maxScrollExtent + 100,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }

    // BlocProvider.of<HomeMySugController>(context).clear();

    if (context.canPop()) {
      context.pop();
    } else {
      GoRouter.of(context).go('/home');
    }
  }

  // void add(String title, String oneri, WidgetRef ref) {
  //   ref.watch(anasayfaListProvider.notifier).addOneri(
  //         Oneri(
  //           id: UniqueKey().hashCode,
  //           title: title,
  //           oneri: oneri,
  //         ),
  //       );

  //   widget.scrollController.animateTo(
  //     widget.scrollController.position.maxScrollExtent + 100,
  //     duration: const Duration(milliseconds: 500),
  //     curve: Curves.easeInOut,
  //   );

  //   if (context.canPop()) {
  //     context.pop();
  //   } else {
  //     GoRouter.of(context).go('/home');
  //   }
  // }
}
