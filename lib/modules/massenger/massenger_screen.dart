import 'package:flutter/material.dart';

class MassengerScreen extends StatelessWidget {
  const MassengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage("https://docs.flutter.dev/assets/images/dash/dash-fainting.gif?fbclid=IwAR3Hg6YgFQ_0uBUqFee90d0oiQuloY5IuKXmZxjptXduPtQjv87bXtohJD8"),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
                "serch",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,

              ),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              IconButton(onPressed: (){}, icon: CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.camera_alt,
                  size: 16.0,
                  color: Colors.white,
                ),
              ),
              ),
              IconButton(onPressed: (){}, icon: CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.edit,
                  size: 16.0,
                  color: Colors.white,
                ),
              ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Icon(
                        Icons.search,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "search"
                    ),
                  ],
                ),
              ),
              SizedBox(
                height:15.0,),
              Container(
                height: 100.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => biuldStoryItems (),
                  separatorBuilder:(context,index)=>SizedBox(
                    width: 15.0,
                  ) ,
                  itemCount: 7,
                  ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder:      (context,index)=>biuldChatItems(),
                separatorBuilder: (context,index)=> SizedBox(
                  height: 20,
                ),
                itemCount: 15,),
          ],
          ),
        ),
      ),
    );
  }
  Widget biuldChatItems () =>  Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage("https://docs.flutter.dev/assets/images/dash/dash-fainting.gif?fbclid=IwAR3Hg6YgFQ_0uBUqFee90d0oiQuloY5IuKXmZxjptXduPtQjv87bXtohJD8"),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 3.0,
              end: 3.0,
            ),
            child: CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
      SizedBox(
        width: 15,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "mohamedIbrahim",
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "في عشق البنات انا فوقت نابليون ",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    width: 5.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text(
                  " 08:5 Pm",
                ),
              ],
            ),

          ],
        ),
      ),

    ],
  );
Widget biuldStoryItems() =>   Container(
  decoration: BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(5.0),
  ),
  padding: EdgeInsets.all(5.0),
  child: Row(
    children: [
      Icon(
        Icons.search,
      ),
      SizedBox(
        width: 15.0,
      ),
      Text(
          "search"
      ),
    ],
  ),
);

}
