import 'package:flutter/material.dart';

import 'custom_appbar.dart';
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 32.0,left: 16,right: 16),
      child: Column(


        children: [
          CustomAppBar(),



        ],
      ),
    );
  }
}





