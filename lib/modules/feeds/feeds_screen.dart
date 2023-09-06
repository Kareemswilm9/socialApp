import 'package:flutter/material.dart';
import 'package:socail_applcation/shared/components/widgets/components.dart';
import 'package:socail_applcation/shared/styles/icon_broken.dart';

class Feeds_Screen extends StatelessWidget {
  const Feeds_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                      'https://imagedelivery.net/WS9ABFRS6TfdqDudkFOT3w/grrraphic/previews/3n0drd9pvuoNiRD6GKeD8s1bsv2SQT5jnAc3If0D.jpeg/public'),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Communicate with  friends',
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                ),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => buildPostItem(context),
            itemCount: 10,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 8,
            ),
          )
        ],
      ),
    );
  }

  Widget buildPostItem(context) => Card(
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
                  backgroundImage: NetworkImage(
                      'https://imagedelivery.net/WS9ABFRS6TfdqDudkFOT3w/grrraphic/previews/Qd7vc1PqLhldbHjcTku63QJDklP3WzeAJldG0IvT.jpeg/public'),
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
                              'Kareem swilm',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  height: 1.3),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.check_circle,
                              color: Colors.blue,
                              size: 20,
                            )
                          ],
                        ),
                        Text(
                          '18/1/2002',
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
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: myDivider(),
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting inmbled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: TextStyle(
                  height: 1, fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Container(
              width: double.infinity,
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 5,
                      top: 5,
                    ),
                    child: Container(
                      height: 20,
                      child: MaterialButton(
                          onPressed: () {},
                          minWidth: 1,
                          height: 25,
                          padding: EdgeInsets.zero,
                          child: Text(
                            '#Software',
                            style: TextStyle(color: Colors.blue),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 5,
                      top: 5,
                    ),
                    child: Container(
                      height: 20,
                      child: MaterialButton(
                          onPressed: () {},
                          minWidth: 1,
                          height: 25,
                          padding: EdgeInsets.zero,
                          child: Text(
                            '#Software',
                            style: TextStyle(color: Colors.blue),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://imagedelivery.net/WS9ABFRS6TfdqDudkFOT3w/grrraphic/previews/Qd7vc1PqLhldbHjcTku63QJDklP3WzeAJldG0IvT.jpeg/public'),
                        fit: BoxFit.cover))),
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
                              '120',
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
                              '120 Comment',
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
                              'https://imagedelivery.net/WS9ABFRS6TfdqDudkFOT3w/grrraphic/previews/Qd7vc1PqLhldbHjcTku63QJDklP3WzeAJldG0IvT.jpeg/public'),
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
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ));
}
