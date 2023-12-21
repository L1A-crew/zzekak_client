/*
 * "tick_client" created by @howyoujini on 2023/11/11  7:38 PM
 * Copyright (c) app.lib.home. All rights reserved.
 */
import 'package:core/model/user/user_model.dart';
import 'package:core/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

part './string_home.dart';

class HomeScreen extends StatefulWidget {
  final UserRepository userRepository = GetIt.instance<UserRepository>();

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user;

  @override
  void initState() {
    super.initState();
    widget.userRepository.findMe().then((final User value) {
      setState(() {
        user = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(_KoKrString.TITLE.text),
          Text(
              "${user?.identifier.toString() ?? "now loading..."} ${user?.nickName.toString()}")
        ],
      ),
    ));
  }
}
