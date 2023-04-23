import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:gdsc/layout/news_app/Cubit/statse.dart';

var emailController = TextEditingController();
var passwordController = TextEditingController();

Widget defoultBotton({
  required double width,
  required Color background,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      color: background,
      child: MaterialButton(
        onPressed: () {
          print(emailController.text);
          print(passwordController.text);
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onChanged: (s) {
        onChange!(s);
      },
      onTap: () {
        onTap!();
      },
      validator: (s) {
        validate(s);
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );
Widget buildArticalItems(dynamic artical, context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          // if (artical['urlToImage'] == artical['null'])
          //   Container(
          //     height: 120.0,
          //     width: 120.0,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(
          //         10,
          //       ),
          //       image: DecorationImage(
          //         image: NetworkImage(
          //           'https://img.freepik.com/premium-vector/system-software-update-upgrade-concept-loading-process-screen-vector-illustration_175838-2182.jpg?w=360',
          //         ),
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
          Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              image: DecorationImage(
                image: NetworkImage(
                  '${artical['urlToImage']}',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${artical['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${artical['publishedAt']}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

Widget articalBuilder(list, context) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildArticalItems(list[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: 10),
      fallback: (context) => Center(child: CircularProgressIndicator()),
    );
