import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socail_applcation/layout/cubit/cubit.dart';
import 'package:socail_applcation/layout/cubit/states.dart';
import 'package:socail_applcation/modules/newpost/new_post_screen.dart';
import 'package:socail_applcation/shared/components/widgets/components.dart';
import 'package:socail_applcation/shared/components/widgets/toast_widget.dart';
import 'package:socail_applcation/shared/styles/icon_broken.dart';

class Social_app extends StatelessWidget {
  const Social_app({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (BuildContext context, SocialStates state) {
        if (state is SocialNewPostState){
          navigateTo(context, NewPostScreen());
        }
      },
      builder: (BuildContext context, SocialStates state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
              actions: [
                IconButton(
                  icon: const Icon(
                    IconBroken.Notification,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    IconBroken.Search,
                  ),
                  onPressed: () {},
                ),
              ],
             ),
            body:cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNav(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Chat,
                ),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Upload,
                ),
                label: 'post',
              ),

              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Location,
                ),
                label: 'Users',
              ),

              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Setting,
                ),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}