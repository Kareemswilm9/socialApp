import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socail_applcation/layout/cubit/cubit.dart';
import 'package:socail_applcation/layout/cubit/states.dart';
import 'package:socail_applcation/models/postmodel.dart';
import 'package:socail_applcation/shared/components/widgets/components.dart';
import 'package:socail_applcation/shared/styles/icon_broken.dart';

class Feeds_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, SocialStates? state) {
        return ConditionalBuilder(
          condition: SocialCubit.get(context).posts.isNotEmpty &&
              SocialCubit.get(context).userModel != null,
          builder: (BuildContext context) => SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 5,
                  margin: EdgeInsets.all(8),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Image(
                        image: NetworkImage(
                          'https://image.freepik.com/free-photo/horizontal-shot-smiling-curly-haired-woman-indicates-free-space-demonstrates-place-your-advertisement-attracts-attention-sale-wears-green-turtleneck-isolated-vibrant-pink-wall_273609-42770.jpg',
                        ),
                        fit: BoxFit.cover,
                        height: 200.0,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Communicate with  friends',
                            style:
                                TextStyle(fontSize: 15, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                  itemBuilder: (context, index) => buildPostItem(
                       SocialCubit.get(context).posts[index],context, index),
                  itemCount: SocialCubit.get(context).posts.length,
                  separatorBuilder: ( context,  index) =>
                      SizedBox(
                    height: 8,
                  ),
                )
              ],
            ),
          ),
          fallback: (BuildContext context) =>
              Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildPostItem(PostModel model, context,index) => Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
                children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage('${model.image}'),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${model.name}',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  height: 1.4),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.check_circle,
                              color: Colors.blue,
                              size: 20,
                            )
                          ],
                        ),
                        Text(
                          '${model.dateTime}',
                          style: TextStyle(
                              fontSize: 15, color: Colors.grey, height: 1.3),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_horiz,
                      size: 16,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            Text(
              '${model.text}',
              style: TextStyle(
                  height: 1, fontWeight: FontWeight.bold, fontSize: 14),
            ),
            // Container(
            //   width: double.infinity,
            //   child: Wrap(
            //     children: [
            //       // Padding(
            //       //   padding: const EdgeInsets.only(
            //       //     bottom: 5,
            //       //     top: 5,
            //       //   ),
            //       //   child: Container(
            //       //     height: 20,
            //       //     child: MaterialButton(
            //       //         onPressed: () {},
            //       //         minWidth: 1,
            //       //         height: 25,
            //       //         padding: EdgeInsets.zero,
            //       //         child: Text(
            //       //           '#Software',
            //       //           style: TextStyle(color: Colors.blue),
            //       //         )),
            //       //   ),
            //       // ),
            //       // Padding(
            //       //   padding: const EdgeInsets.only(
            //       //     bottom: 5,
            //       //     top: 5,
            //       //   ),
            //       //   child: Container(
            //       //     height: 20,
            //       //     child: MaterialButton(
            //       //         onPressed: () {},
            //       //         minWidth: 1,
            //       //         height: 25,
            //       //         padding: EdgeInsets.zero,
            //       //         child: Text(
            //       //           '#Software',
            //       //           style: TextStyle(color: Colors.blue),
            //       //         )),
            //       //   ),
            //       // ),
            //     ],
            //   ),
            // ),

            if (model.postImage != '')
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      4.0,
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        '${model.postImage}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Icon(
                              IconBroken.Heart,
                              size: 14,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${SocialCubit.get(context).likes[index]}',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              IconBroken.Chat,
                              size: 14,
                              color: Colors.amber,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '0 Comment',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: myDivider(),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                            '${SocialCubit.get(context).userModel?.image}'),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Write a Comment...',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                InkWell(
                  child: Row(
                    children: [
                      Icon(
                        IconBroken.Heart,
                        size: 14,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'like',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  onTap: () {
                    SocialCubit.get(context).likePost(SocialCubit.get(context).postId[index]);
                  },
                ),
              ],
            )
          ],
        ),
      ));
}
