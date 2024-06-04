import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mertaliveonurcan/product/state/view_model/product_view_model.dart';
import 'package:mertaliveonurcan/screens/home/presentation/controller/home_my_sug_controller.dart';
import 'package:mertaliveonurcan/screens/home/presentation/controller/home_rand_sug_controller.dart';

class StateInitialize extends StatefulWidget {
  const StateInitialize({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  State<StateInitialize> createState() => _StateInitializeState();
}

class _StateInitializeState extends State<StateInitialize> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductViewModel>(
          create: (_) => ProductViewModel(),
        ),
        BlocProvider<HomeRandSugController>(
          create: (context) => HomeRandSugController(),
        ),
        BlocProvider<HomeMySugController>(
          create: (context) => HomeMySugController(),
        ),
      ],
      child: widget.child,
    );
  }
}
