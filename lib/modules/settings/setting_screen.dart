import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socail_applcation/layout/cubit/cubit.dart';
import 'package:socail_applcation/layout/cubit/states.dart';
import 'package:socail_applcation/modules/edit_profile/edit_profile.dart';
import 'package:socail_applcation/shared/components/widgets/components.dart';
import 'package:socail_applcation/shared/styles/icon_broken.dart';

class Setting_Screen extends StatelessWidget {
  const Setting_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (BuildContext context, SocialStates state) {},
      builder: (BuildContext context, SocialStates state) {
        var UserModel = SocialCubit.get(context).userModel;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 190,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Container(
                          height: 140,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage('${UserModel!.cover}'),
                                  fit: BoxFit.cover))),
                    ),
                    CircleAvatar(
                      radius: 64,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage('${UserModel!.image}'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${UserModel!.name}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '${UserModel!.bio}',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '100   ',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Posts',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '250',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'photos',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              'followers',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '10k',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '160',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'followings',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: OutlinedButton(onPressed: () {  }, child: Text('Add Photo'),

                        ),

                    ),
                    SizedBox(
                      width: 10,
                    ),
                    OutlinedButton(onPressed: () { navigateTo(context, EditProfile()) ;}, child: Icon(IconBroken.Edit,size: 14),

                    ),

                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
