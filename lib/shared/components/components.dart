import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/shared/cubit/cubit.dart';

Widget defaultButton({
  double width = double.infinity ,
  Color background = Colors.blue,
  required function ,
  required String text ,
}) => Container(
  width: width,
  color: background,
  child: MaterialButton(
    onPressed: function,
    child: Text(
      text.toUpperCase(),
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);

Widget defaultFormField (
    {
  required TextEditingController controller,
  required TextInputType type ,
   onSubmit ,
      onTap ,
  bool ispassword = false,
  required dynamic validate,
  required String label,
  required IconData prefix ,
   IconData ? suffix,
       suffixPressed ,
      bool isClickable = true ,
})=> TextFormField(
  controller: controller,
  keyboardType: type ,
  obscureText: ispassword,
  enabled:isClickable ,
  onFieldSubmitted:  onSubmit,
  onTap:onTap ,
  validator: validate ,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon( prefix,),
    suffixIcon: suffix != null ? IconButton(
      onPressed:suffixPressed ,
        icon: Icon( suffix,)) : null,
    border: OutlineInputBorder(),
  ),
);


Widget buildTaskItem (Map model, context) => Dismissible(
  key: Key(model["id"].toString()),
  child:  Padding(
  
    padding: const EdgeInsets.all(20.0),
  
    child: Row(
  
      children: [
  
        CircleAvatar(
  
          radius: 40.0,
  
          child: Text(
  
            "${model['time']}",
  
          ),
  
        ),
  
        SizedBox(
  
          width:15.0 ,
  
        ),
  
        Expanded(
  
          child: Column(
  
            mainAxisSize: MainAxisSize.min,
  
            children: [
  
              Text(
  
                "${model['title']}",
  
                style:TextStyle(
  
                  fontSize: 20,
  
                  fontWeight: FontWeight.bold,
  
  
  
                ),
  
              ),
  
              Text(
  
                "${model['date']}",
  
                style:TextStyle(
  
                  color: Colors.grey,
  
                  fontSize: 12,
  
                  fontWeight: FontWeight.bold,
  
                ),
  
              ),
  
            ],
  
          ),
  
        ),
  
        SizedBox(
  
          width:15.0 ,
  
        ),
  
        IconButton(
  
            onPressed: ()
  
            {
  
              AppCubit.get(context).updateData(
  
                status: "done",
  
                id : model["id"] ,
  
              );
  
            },
  
            icon: Icon(
  
              Icons.check_box,
  
              color: Colors.green,
  
            ),
  
        ),
  
        IconButton(
  
            onPressed: ()
  
            {
  
              AppCubit.get(context).updateData(
  
                status: "archive",
  
                id : model["id"] ,
  
              );
  
            },
  
            icon: Icon(
  
              Icons.archive,
  
              color: Colors.black45,
  
            ),
  
        ),
  
      ],
  
    ),
  
  ),
  onDismissed: (direction)
  {
    AppCubit.get(context).deleteData(id: model["id"],);
  }
);

Widget taskesBuilder({
  required List<Map> taskes,
})=> ConditionalBuilder(
  condition: taskes.length>0,
  builder: (context)=>ListView.separated(
    itemBuilder: (context,index)=>buildTaskItem(taskes [index], context),
    separatorBuilder: (context,index)=>Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    ),
    itemCount: taskes.length,
  ),
  fallback: (context)=>Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.menu,
          size: 100.0,
          color: Colors.grey,
        ),
        Text(
          "No Taskes Yet , Please Add Some Taskes ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  ),
);
