import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading(BuildContext context,String message){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context){
          return AlertDialog(
            backgroundColor: Colors.white,
            content: Column(
              children: [
                Row(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(width: 5,),
                    Expanded(
                      child: Text(message,
                        style:TextStyle(color: Colors.black),),
                    ),
                  ],
                ),
                
              ],
            ),
          );
        }
    );
  }

  static void hideDialog(BuildContext context ){
    Navigator.pop(context);
  }

  static void showMessage(BuildContext context,
      String message,
      {String? title = 'title',
        String? posActionName,
        VoidCallback? posAction,
        String? negActionName,
        VoidCallback? negAction,
        bool isDismisable =false,
      } ){
    List<Widget>actions=[];
    if(posActionName !=null){
      actions.add(TextButton(
        onPressed:(){
          Navigator.pop(context);
          posAction?.call();
        },
        child: Text(posActionName,style:Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Colors.white,
        ),),
      ),);
    }
    if(negActionName !=null){
      actions.add(TextButton(
        onPressed:(){
          Navigator.pop(context);
          negAction?.call();
        },
        child: Text(negActionName),
      ),);
    }
    showDialog(context: context,
        barrierDismissible: isDismisable,
        builder:(context){
          return AlertDialog(
            backgroundColor:Colors.blue,
            title: Text(title!,style:Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.blue,
            )),
            content:Text(message,style:Theme.of(context).textTheme.titleMedium) ,
            actions: actions,
            titleTextStyle: TextStyle(
                color: Theme.of(context).primaryColor
            ),
            contentTextStyle: const TextStyle(
              color: Colors.black,
            ),
          );
        }
    );
  }
}