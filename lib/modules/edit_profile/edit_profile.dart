import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socail_applcation/layout/cubit/cubit.dart';
import 'package:socail_applcation/layout/cubit/states.dart';
import 'package:socail_applcation/shared/components/widgets/components.dart';
import 'package:socail_applcation/shared/styles/icon_broken.dart';

class EditProfile extends StatelessWidget {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (BuildContext context, SocialStates state) {},
      builder: (BuildContext context, SocialStates state) {
        var UserModel = SocialCubit.get(context).userModel;
        var profileImage = SocialCubit.get(context).profileImage;
        var coverImage = SocialCubit.get(context).coverImage;

        nameController.text = UserModel!.name!;
        bioController.text = UserModel!.bio!;

        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Edit profile',
            actions: [
              defaultTextButton(
                  function: () {
                    SocialCubit.get(context).updateUser(
                        name: nameController.text,
                        phone: phoneController.text,
                        bio: bioController.text);
                  },
                  text: 'UP DATE'),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                if (state is SocialUserUpdateLoadingState)
                  LinearProgressIndicator(),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 190,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                                height: 140,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    ),
                                    image: DecorationImage(
                                        image: coverImage == null
                                            ? NetworkImage('${UserModel!.cover}')
                                            : FileImage(coverImage)
                                                as ImageProvider,
                                        fit: BoxFit.cover))),
                            IconButton(
                                onPressed: () {
                                  SocialCubit.get(context).getCoverImage();
                                },
                                icon: CircleAvatar(
                                  child: Icon(
                                    IconBroken.Camera,
                                    size: 16,
                                  ),
                                  radius: 20,
                                )),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 64,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: profileImage == null
                                  ? NetworkImage('${UserModel!.image}')
                                  : FileImage(profileImage) as ImageProvider,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                SocialCubit.get(context).getProfileImage();
                              },
                              icon: CircleAvatar(
                                child: Icon(
                                  IconBroken.Camera,
                                  size: 16,
                                ),
                                radius: 20,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                if (SocialCubit.get(context).profileImage != null ||
                    SocialCubit.get(context).coverImage != null)
                  Row(
                    children: [
                      if (SocialCubit.get(context).profileImage != null)
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              defaultMaterialButton(
                                  function: () {
                                    SocialCubit.get(context).uploadprofileImage(
                                        name: nameController.text,
                                        phone: phoneController.text,
                                        bio: bioController.text);
                                  },
                                  text: 'UpLoad profile '),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              // LinearProgressIndicator(),
                            ],
                          ),
                        )),
                      if (SocialCubit.get(context).coverImage != null)
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              defaultMaterialButton(
                                function: () {
                                  SocialCubit.get(context).uploadcoverImage(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      bio: bioController.text);
                                },
                                text: 'UpLoad cover  ',
                              ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              // LinearProgressIndicator(),
                            ],
                          ),
                        )),
                    ],
                  ),
                if (SocialCubit.get(context).profileImage != null ||
                    SocialCubit.get(context).coverImage != null)
                  SizedBox(
                    height: 20,
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: defaultTextFormField(
                    controller: nameController,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'name must not be empty';
                      }

                      return null;
                    },
                    label: 'Name',
                    prefix: IconBroken.User,
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: defaultTextFormField(
                    controller: bioController,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'Bio must not be empty';
                      }

                      return null;
                    },
                    label: 'Bio',
                    prefix: IconBroken.Info_Circle,
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: defaultTextFormField(
                    controller: phoneController,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'Phone must not be empty';
                      }

                      return null;
                    },
                    label: 'Phone',
                    prefix: Icons.phone,
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
