
import 'package:flutter/material.dart';
import 'package:socail_applcation/modules/login/loginshopScreen.dart';
import 'package:socail_applcation/shared/components/network/remote/CacheHelper.dart';
import 'package:socail_applcation/shared/styles/icon_broken.dart';


Widget defaultTextFormField({
  FocusNode? focusNode,
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String? Function(String?) validate,
  required String label,
  String? hint,
  onTap,
  onChanged,
  Function(String)? onFieldSubmitted,
  bool isPassword = false,
  bool isClickable = true,
  InputDecoration? decoration,
  IconData? suffix,
  IconData? prefix,
  Function? suffixPressed,
}) =>
    TextFormField(
      focusNode: FocusNode(),
      style: const TextStyle(),
      maxLines: 1,
      minLines: 1,
      controller: controller,
      validator: validate,
      enabled: isClickable,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      obscureText: isPassword,
      keyboardType: keyboardType,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefix,
          color: Colors.grey,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: () {
            suffixPressed!();
          },
          icon: Icon(
            suffix,
            color: Colors.grey,
          ),
        )
            : null,
        filled: true,
        isCollapsed: false,
        fillColor: Colors.white.withOpacity(0.2),
        hoverColor: Colors.red.withOpacity(0.2),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        labelText: label,
        labelStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.blue,
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
        focusColor: Colors.white,
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );

Widget defaultMaterialButton({
  required Function function,
  required String text,
  double width = double.infinity,
  Color background =Colors.blue,
  double height = 40.0,
  double radius = 3.0,
  bool isUpperCase = true,
  Function? onTap,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
        //  color: background,
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17.0,
          ),
        ),
      ),
    );

Widget defaultTextButton({
  required Function function,
  required String text,
}) =>
    TextButton(
      onPressed: () {
        function();
      },
      child: Text(text),
    );

Widget myDivider() => Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey[300],
);


// enum  كذا اختيار من حاجة

enum ToastStates { success, error, warning }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;

    case ToastStates.error:
      color = Colors.red;
      break;

    case ToastStates.warning:
      color = Colors.amber;
      break;
  }
  return color;
}

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ), (route) {
  return false;
});

void logOut(context) {
  CacheHelper.removeData(
    key: 'token',
  ).then((value) {
    if (value) {
      navigateAndFinish(context, LoginScreen());
    }
  });
}
String? uId='';
PreferredSizeWidget defaultAppBar({
  required BuildContext context,
  required String title,
   List<Widget>? actions,
}) => AppBar(
  leading: IconButton(
    onPressed: ()
    {
      Navigator.pop(context);
    },
    icon: Icon(
      IconBroken.Arrow___Left_2,
    ),
  ),
  titleSpacing: 5.0,
  title: Text(
    title,
  ),
  actions: actions,
);