import 'package:flutter/material.dart';
import 'package:social_app/shared/widgets/componants.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: defaultAppBar(context: context, title: 'Add Post'),
        body: Container());
  }
}
