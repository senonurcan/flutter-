import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mertaliveonurcan/product/models/user.dart';
import 'package:mertaliveonurcan/screens/home/presentation/controller/home_manager.dart';
import 'package:mertaliveonurcan/screens/profile/controller/profile_controller.dart';
import 'package:mertaliveonurcan/screens/profile/profile_view.dart';

mixin ProfileViewMixin on State<ProfileView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        BlocProvider.of<ProfileController>(context).getProfilePicture);
  }

  HomeManager get homeManager => HomeManager();

  Future<User> getProfileItems() {
    return homeManager.getProfile();
  }
}
