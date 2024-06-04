import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mertaliveonurcan/product/init/language/locale_keys.g.dart';
import 'package:mertaliveonurcan/product/models/user.dart';
import 'package:mertaliveonurcan/screens/profile/controller/profile_controller.dart';
import 'package:mertaliveonurcan/screens/profile/mixins/profile_view_mixin.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with ProfileViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKeys.author).tr(),
        actions: [
          GestureDetector(
            onTap: () {
              BlocProvider.of<ProfileController>(context).setProfilePicture();
            },
            child: SizedBox(
              width: MediaQuery.maybeOf(context)!.size.width * 0.25,
              child: const Row(
                children: [
                  Text('Photo Change'),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<User>(
          future: getProfileItems(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _avatar(context, snapshot),
                  const SizedBox(height: 20),
                  Text(
                    '${snapshot.data!.firstName} ${snapshot.data!.lastName}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    snapshot.data!.email.toString(),
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Align _avatar(BuildContext context, AsyncSnapshot<User> snapshot) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: MediaQuery.maybeOf(context)!.size.width * 0.4,
        height: MediaQuery.maybeOf(context)!.size.height * 0.3,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: BlocBuilder<ProfileController, File>(
            builder: (context, state) {
              if (state.existsSync()) {
                return Image.file(
                  state,
                  fit: BoxFit.fitHeight,
                );
              }
              return Image.network(
                snapshot.data!.avatar.toString(),
              );
            },
          ),
        ),
      ),
    );
  }
}
