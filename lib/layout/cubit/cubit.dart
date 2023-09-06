import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socail_applcation/layout/cubit/states.dart';
import 'package:socail_applcation/models/postmodel.dart';
import 'package:socail_applcation/models/social_user_model.dart';
import 'package:socail_applcation/modules/chats/chats_screen.dart';
import 'package:socail_applcation/modules/feeds/feeds_screen.dart';
import 'package:socail_applcation/modules/newpost/new_post_screen.dart';
import 'package:socail_applcation/modules/settings/setting_screen.dart';
import 'package:socail_applcation/modules/users/users_screen.dart';
import 'package:socail_applcation/shared/components/widgets/components.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  Social_User_Model? userModel;
  void getUserData() {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      //print(value.data());
      userModel = Social_User_Model.fromJson(value.data()!);
      emit(SocialGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialGetUserErrorState(error.toString()));
    });
  }

  int currentIndex = 0;
  List<Widget> screens = [
    Feeds_Screen(),
    Chats_Screen(),
    NewPostScreen(),
    Users_Screen(),
    Setting_Screen(),
  ];

  List<String> titles = [
    'Home',
    'Chats',
    'Post',
    'Users',
    'Settings',
  ];

  void changeBottomNav(int index) {
    if (index == 2) {
      emit(SocialNewPostState());
    } else {
      currentIndex = index;

      emit(SocialChangeBottomNavState());
    }
  }

  File? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      debugPrint(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      debugPrint('No image selected.');
      emit(SocialProfileImagePickedErrorState());
    }
  }

  File? coverImage;

  Future<void> getCoverImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(SocialCoverImagePickedSuccessState());
    } else {
      debugPrint('No image selected.');
      emit(SocialCoverImagePickedErrorState());
    }
  }

  void uploadprofileImage({
    required String name,
    required String phone,
    required String bio,
}) {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {

        emit(SocialUploadProfileImageSuccessState());
        print(value);
        updateUser(name: name,phone: phone,bio: bio,image: value);
      }).catchError((error) {
        emit(SocialUploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(SocialUploadProfileImageErrorState());
    });
  }



  void uploadcoverImage(
  {
    required String name,
    required String phone,
    required String bio,
}
      ) {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(SocialUploadCoverImageSuccessState());
        updateUser(name: name,phone: phone,bio: bio,cover: value);

      }).catchError((error) {
        emit(SocialUploadCoverImageErrorState());
      });
    }).catchError((error) {
      emit(SocialUploadCoverImageErrorState());
    });
  }

  // void UpdateUserImage({
  //   required String name,
  //   required String phone,
  //   required String bio,
  // }) {
  //   emit(SocialUserUpdateLoadingState());
  //   if (coverImage != null) {
  //     uploadcoverImage();
  //   } else if (profileImage != null) {
  //     uploadprofileImage();
  //   } else if(coverImage != null&&profileImage != null){
  //
  //   }
  //   else {
  //    updateUser(name: name, phone: phone, bio: bio);
  //   }
  // }
  void updateUser({
    required String name,
    required String phone,
    required String bio,
    String? cover ,
    String? image ,

  }){
    Social_User_Model model = Social_User_Model(
        name: name,
        phone: phone,
        UId: uId,
        cover:cover ?? userModel!.cover,
        bio: bio,
        image: image ?? userModel!.image,
        email: userModel!.email,
        isEmailvarified: false);
    FirebaseFirestore.instance
        .collection('users')
        .doc(model!.UId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError(() {
      emit(SocialUserUpdateErrorState());
    });
  }
  File? postImage;

  Future<void> getPostImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(SocialPostImagePickedSuccessState());
    } else {
      debugPrint('No image selected.');
      emit(SocialPostImagePickedErrorState());
    }
  }

  void UploadPostImage({

    required String dateTime,
    required String text ,


  }) {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('Posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {

        emit(SocialCreatePostSuccessState());
        print(value);
        CreatePost(dateTime: dateTime, text: text,postImage: value);
      }).catchError((error) {
        emit(SocialCreatePostErrorState());
        print(error.toString());
      });
    }).catchError((error) {
      emit(SocialCreatePostErrorState());
      print(error.toString());
    });
  }
  void CreatePost({
    required String dateTime ,
    required String text ,

    String? postImage,



  }){
    PostModel model = PostModel(
        name: userModel!.name,
       text:text ,
        UId: userModel!.UId,
        dateTime:dateTime ,
        image: userModel!.image,
      postImage: postImage ?? '',
        );
    FirebaseFirestore.instance
        .collection('Posts')
        .add(model.toMap())
        .then((value) {
    }).catchError(() {
      emit(SocialCreatePostErrorState());
    });
  }
  void removePostImage(){
    postImage =null;
    emit(SocialRemovePostImageState());
  }

}
