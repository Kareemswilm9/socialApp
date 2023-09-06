import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socail_applcation/layout/cubit/cubit.dart';
import 'package:socail_applcation/layout/cubit/states.dart';
import 'package:socail_applcation/shared/components/widgets/components.dart';
import 'package:socail_applcation/shared/styles/icon_broken.dart';

class NewPostScreen extends StatelessWidget {
  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates >(
      listener: (BuildContext context, state) {  }
      , builder: (BuildContext context, Object? state) {
      final now = DateTime.now();

        return Scaffold(
          appBar: defaultAppBar(context: context, title: 'Create Post',actions: [
            defaultTextButton(function: (){
              if (SocialCubit.get(context).postImage ==null){
                SocialCubit.get(context).CreatePost(dateTime: now.toString(), text: textController.text);
              }else {
                SocialCubit.get(context).UploadPostImage(
                    dateTime: now.toString(), text: textController.text );
              }
            }
            , text: 'post')

          ] ),
          body:  Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if(state is SocialCreatePostLoadingState)
                LinearProgressIndicator(),
                if(state is SocialCreatePostLoadingState)

                  SizedBox(
                  height:10,
                ),
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
                        child:  Text(
                          'Kareem swilm',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              height: 1.3),
                        ),
                      ),
                    ),

                  ],
                ),
                Expanded(
                  child: TextFormField(
                     controller: textController,
                    decoration: InputDecoration(
                        hintText: 'what is on your mind,',
                      border: InputBorder.none
                    ),
                  ),
                ),
                if(SocialCubit.get(context).postImage != null)
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                        height: 140,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                             4
                            ),
                            image: DecorationImage(
                                image: FileImage(SocialCubit.get(context).postImage!)
                                as ImageProvider,
                                fit: BoxFit.cover))),
                    IconButton(
                        onPressed: () {
                          SocialCubit.get(context).removePostImage();
                        },
                        icon: CircleAvatar(
                          child: Icon(
                            Icons.close,
                            size: 16,
                          ),
                          radius: 20,
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(

                  children: [
                    Expanded(
                      child: TextButton(onPressed:(){
                        SocialCubit.get(context).getPostImage();
                      }, child: Row(
                        children: [
                          Icon(IconBroken.Image,),
                          Text('Add photo',)
                        ],
                      )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: TextButton(onPressed:(){}, child: Text('# Tages')),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
    },

    );
  }
}
