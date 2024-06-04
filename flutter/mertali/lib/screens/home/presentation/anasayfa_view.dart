// ignore_for_file: library_private_types_in_public_api

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mertaliveonurcan/product/utility/funcs.dart';
import 'package:mertaliveonurcan/product/init/language/locale_keys.g.dart';
import 'package:mertaliveonurcan/product/init/product_localization.dart';
import 'package:mertaliveonurcan/product/models/oneri.dart';
import 'package:mertaliveonurcan/product/navigation/app_routes.dart';
import 'package:mertaliveonurcan/product/navigator.dart';
import 'package:mertaliveonurcan/product/permission/product_notification_permission.dart';
import 'package:mertaliveonurcan/product/utility/locales.dart';
import 'package:mertaliveonurcan/screens/home/presentation/controller/home_my_sug_controller.dart';
import 'package:mertaliveonurcan/screens/home/presentation/controller/home_rand_sug_controller.dart';
import 'package:mertaliveonurcan/screens/home/presentation/mixins/anasayfa_view_mixin.dart';
import 'package:mertaliveonurcan/screens/home/presentation/widgets/add_suggestion.dart';

part './widgets/home_page_drawer.dart';

final class AnasayfaView extends StatefulWidget {
  const AnasayfaView({Key? key}) : super(key: key);

  @override
  _AnasayfaViewState createState() => _AnasayfaViewState();
}

class _AnasayfaViewState extends State<AnasayfaView> with AnasayfaViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKeys.home).tr(),
        actions: [
          Switch(
            value: switchValue,
            activeTrackColor: Colors.black,
            onChanged: (value) {
              switchValue = value;
              changeTheme();
              setState(() {
                switchValue = value;
              });
            },
          ),
        ],
      ),
      drawer: const _HomePageDrawer(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => AddSuggestionWidget(
                scrollController: mySugscrollController,
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Column(
          children: [
            Text(
              LocaleKeys.welcome.tr(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    changeActivePV(0);
                  },
                  child: const Text('Benim'),
                ),
                TextButton(
                  onPressed: () {
                    changeActivePV(1);
                  },
                  child: const Text('Random'),
                ),
              ],
            ),
            const Text(
              LocaleKeys.home_page_content,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ).tr(),
            const SizedBox(height: 20),
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  _mySuggestions(),
                  _randomSuggestions(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BlocBuilder<HomeMySugController, List<Oneri>> _mySuggestions() =>
      BlocBuilder<HomeMySugController, List<Oneri>>(
        builder: (context, state) {
          if (state.isEmpty) {
            return const Center(
                child: Text('Henüz kendiniz için öneri eklenmediniz.'));
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      return _buildListItem(state[index], context);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );

  Padding _randomSuggestions() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: BlocBuilder<HomeRandSugController, List<Oneri>>(
                builder: (context, state) {
                  if (state.isNotEmpty) {
                    randomOneriler = state;
                    return ListView.builder(
                      itemCount: randomOneriler.length,
                      itemBuilder: (context, index) {
                        return _buildListItem(randomOneriler[index], context);
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            )
          ],
        ),
      );

  Widget _buildListItem(Oneri oneri, BuildContext context) => Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          title: Text(oneri.title.toString()),
          subtitle: Text(oneri.oneri.toString()),
          leading: const Icon(Icons.lightbulb),
          onTap: () {
            Funcs.showSnackBar(context, 'Öneriye tıklandı: ${oneri.oneri}');
          },
        ),
      );
}
