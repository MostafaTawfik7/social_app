import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/controllers/cubit/app_cubit.dart';
import 'package:social_app/controllers/cubit/state_cubit.dart';
import 'package:social_app/shared/widgets/componants.dart';
import 'package:social_app/views/layout_screen/edit_profile_screen/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);

          return Column(
            children: [
              SizedBox(
                height: 250,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(4),
                      child: Card(
                        elevation: 5,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.network(
                          cubit.user.cover,
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        radius: 64,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(cubit.user.image),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                cubit.user.name,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 5),
              Text(
                cubit.user.bio,
                style: Theme.of(context).textTheme.caption,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: const [
                          Text('100'),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Posts')
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: const [
                          Text('150'),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Photos')
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: const [
                          Text('15k'),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Followings')
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: const [
                          Text('200'),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Followers')
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                          onPressed: () {}, child: const Text('Add photos')),
                    ),
                    const SizedBox(width: 30),
                    OutlinedButton(
                        onPressed: () {
                          navigateTo(context, EditProfileScreen());
                        },
                        child: const Icon(Icons.edit))
                  ],
                ),
              )
            ],
          );
        });
  }
}
