import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/controllers/cubit/app_cubit.dart';
import 'package:social_app/controllers/cubit/state_cubit.dart';
import 'package:social_app/shared/widgets/componants.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();
  String phoneFeild = '';
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    nameController.text = BlocProvider.of<AppCubit>(context).user.name;
    bioController.text = BlocProvider.of<AppCubit>(context).user.bio;
    phoneController.text =
        BlocProvider.of<AppCubit>(context).user.phone.substring(3);
    return BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
      if (state is GetUserSucceedState) {
        toast(msg: 'update succeessfully', state: StateOfToast.success);
      }
      if (state is UploadCoverImageSucceedState) {
        AppCubit.get(context).resetCoverImage();
      }
      if (state is UploadProfileImageSucceedState) {
        AppCubit.get(context).resetProfileImage();
      }
    }, builder: (context, state) {
      var cubit = AppCubit.get(context);

      var profileImage = cubit.profileImage;
      return Scaffold(
          appBar:
              defaultAppBar(context: context, title: 'Edit Profile', actions: [
            TextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    cubit.updateProfile(
                        name: nameController.text,
                        phone: phoneFeild.isNotEmpty
                            ? phoneFeild
                            : cubit.user.phone,
                        bio: bioController.text);
                  }
                },
                child: const Text(
                  'UPDATE',
                )),
            const SizedBox(width: 10),
          ]),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(children: [
                if (state is LoadingState) const LinearProgressIndicator(),
                Stack(
                  alignment: Alignment.topRight,
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
                              child: cubit.coverImage == null
                                  ? Image.network(
                                      cubit.user.cover,
                                      height: 180,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.file(
                                      cubit.coverImage!,
                                      height: 180,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  radius: 64,
                                  child: cubit.profileImage == null
                                      ? CircleAvatar(
                                          radius: 60,
                                          backgroundImage:
                                              NetworkImage(cubit.user.image))
                                      : CircleAvatar(
                                          radius: 60,
                                          backgroundImage:
                                              FileImage(cubit.profileImage!)),
                                ),
                                CircleAvatar(
                                  child: IconButton(
                                      onPressed: () {
                                        cubit.getProfileImage();
                                      },
                                      icon: const Icon(
                                          Icons.camera_alt_outlined)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        child: IconButton(
                            onPressed: () {
                              cubit.getCoverImage();
                            },
                            icon: const Icon(
                              Icons.camera_alt_outlined,
                            )),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                if (cubit.coverImage != null || cubit.profileImage != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        if (cubit.profileImage != null)
                          Expanded(
                              child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: OutlinedButton(
                                  child: const Text('upload profile image'),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      cubit.uploadProfileImage(
                                          name: nameController.text,
                                          phone: phoneFeild.isNotEmpty
                                              ? phoneFeild
                                              : cubit.user.phone,
                                          bio: bioController.text);
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 5),
                              if (state
                                  is UpdateUserProfileImageAndDataLoadingState)
                                const LinearProgressIndicator(),
                            ],
                          )),
                        const SizedBox(width: 10),
                        if (cubit.coverImage != null)
                          Expanded(
                              child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: OutlinedButton(
                                  child: const Text('upload cover image'),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      cubit.uploadCoverImage(
                                          name: nameController.text,
                                          phone: phoneFeild.isNotEmpty
                                              ? phoneFeild
                                              : cubit.user.phone,
                                          bio: bioController.text);
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 5),
                              if (state
                                  is UpdateUserCoverImageAndDataLoadingState)
                                const LinearProgressIndicator(),
                            ],
                          )),
                      ],
                    ),
                  ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      DefaultTextFormField(
                          hintText: 'enter name',
                          controller: nameController,
                          prefixIcon: Icons.person,
                          validator: 'you must enter value'),
                      const SizedBox(height: 10),
                      DefaultTextFormField(
                          hintText: 'enter bio',
                          controller: bioController,
                          prefixIcon: Icons.info_outline,
                          validator: 'you must enter value'),
                      const SizedBox(height: 10),
                      DefaultPhoneField(
                          controller: phoneController,
                          onChange: (phone) {
                            phoneFeild = phone.completeNumber;
                          }),
                    ],
                  ),
                ),
              ]),
            ),
          ));
    });
  }
}
