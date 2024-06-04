part of './../anasayfa_view.dart';

class _HomePageDrawer extends StatefulWidget {
  const _HomePageDrawer();

  @override
  State<_HomePageDrawer> createState() => _HomePageDraverState();
}

class _HomePageDraverState extends State<_HomePageDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  ClipRect(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: 50,
                        child: Image.network(
                            "https://www.iprcenter.gov/image-repository/blank-profile-picture.png/@@images/image.png"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Mertali, Onurcan ve Emir',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      PNavigator.nextPageAndRemoveUntil(
                          context, AppRoutes.login.location);
                    },
                    child: Text(
                      LocaleKeys.logout.tr(),
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  )
                ],
              )),
          // ListTile(
          //   title: const Text(LocaleKeys.author).tr(),
          //   onTap: () {
          //     PNavigator.nextPage(context, const ProfileView());
          //   },
          // ),
          ListTile(
            title: Text(Locales.tr.locale.languageCode.toUpperCase()),
            onTap: () {
              ProductLocalization.updateLang(context, Locales.tr);
            },
          ),
          ListTile(
            title: Text(Locales.en.locale.languageCode.toUpperCase()),
            onTap: () {
              ProductLocalization.updateLang(context, Locales.en);
            },
          ),
          ListTile(
            title: const Text("Check notification permission"),
            onTap: () {
              ProductNotificationPermission.checkPermission(context);
            },
          ),
        ],
      ),
    );
  }
}
