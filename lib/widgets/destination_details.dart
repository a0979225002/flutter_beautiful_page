import 'package:flutter/material.dart';
import 'package:flutterbeautifulpage/models/activity_model.dart';
import 'package:flutterbeautifulpage/models/destination_model.dart';
import 'package:flutterbeautifulpage/models/destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class DestinationDetails extends StatefulWidget {
  int Index;
  final Destination destination;

  DestinationDetails(this.Index,{this.destination,Key key}) : super(key: key);

  @override
  _DestinationDetailsState createState() => _DestinationDetailsState(Index,destination: destination);
}

class _DestinationDetailsState extends State<DestinationDetails> {
  int Index;
  final Destination destination;
  _DestinationDetailsState(this.Index,{this.destination});

  Text _buildRaringStars(int rating){
    String stars ='';
    for(int i = 0; i<rating; i++){
      stars +='⭐';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor:Color.fromRGBO(255, 255, 255,0),
            expandedHeight:MediaQuery.of(context).size.width-10,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(""),
              centerTitle: true,
              collapseMode: CollapseMode.pin,
              background: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                          height:(MediaQuery.of(context).size.width),//查詢目前的手機螢幕寬
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(5.0,8.0),
                                    blurRadius: 6.0
                                )
                              ]
                          ),
                          child: Hero(
                            tag:widget.destination.imageUrl,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                this.widget.destination.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 47,horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.search),
                                  iconSize: 35,
                                  color: Colors.black,
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(FontAwesomeIcons.sortAmountDown),
                                  iconSize: 35,
                                  color: Colors.black,
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        left: 20,
                        bottom: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              destination.city,
                              style: TextStyle(
                                  fontSize: 45,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.label_important,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Text(
                                 destination.country,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 20,
                        bottom: 15,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              IconButton(
                                icon:Icon(
                                  Icons.place,
                                  size: 30,
                                  color: Colors.white70,
                                ),
                                onPressed: (){
                                  print("123");
                                },
                              ),
                            ],
                          ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverFixedExtentList(//使用CustomScrollView 只能使用SliverFixedExtentList來創造listView屬性
            itemExtent: 220,//設置個子件之間的寬度
           delegate: SliverChildBuilderDelegate(
               (BuildContext context,int index){
                 Activity activity = widget.destination.activities[index];
                 print("123123${activity.name}");
                 return Stack(
                   children: <Widget>[
                     Container(
                       margin: EdgeInsets.only(left: 70,right: 15,bottom: 20),
                       decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(30)
                       ),
                       child: Padding(
                         padding: const EdgeInsets.fromLTRB(95, 20, 20, 20),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                              Expanded(
                                flex: 6,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      width: 110,
                                      child: Text(
                                          activity.name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20
                                          ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                        "\$${activity.price}",
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600
                                        ),
                                    )
                                  ],
                                ),
                              ),
                             SizedBox(height: 10,),
                             Expanded(
                                 flex: 2,
                                 child: Text(activity.type),
                             ),
                             Expanded(
                               flex: 5,
                                 child: _buildRaringStars(activity.rating)
                             ),
                           SizedBox(height: 10,),
                             Expanded(
                               flex: 2,
                               child: Row(
                                 children: <Widget>[
                                   Container(
                                     width: 70,
                                     decoration: BoxDecoration(
                                       color: Theme.of(context).accentColor,
                                       borderRadius: BorderRadius.circular(10)
                                     ),
                                     alignment: Alignment.center,
                                     child: Text(
                                       activity.startTimes[0],
                                     ),
                                   ),
                                   SizedBox(width: 10 ,),
                                   Container(
                                     width: 70,
                                     decoration: BoxDecoration(
                                         color: Theme.of(context).accentColor,
                                         borderRadius: BorderRadius.circular(30)
                                     ),
                                     alignment: Alignment.center,
                                     child: Text(
                                       activity.startTimes[1],
                                     ),
                                   ),
                                 ],
                               ),
                             )
                           ],
                         ),
                       ),
                     ),
                     Positioned(
                       left: 20,
                       top: 10,
                       bottom: 30,
                       child: ClipRRect(
                         borderRadius: BorderRadius.circular(30),
                         child: Image(
                           width: 130,
                           image: AssetImage(
                             activity.imageUrl,
                           ),
                           fit: BoxFit.cover,
                         ),
                       ),
                     )
                   ],
                 );
               },
               childCount: destination.activities.length
           ),
          ),
        ],
      ),
    );
  }}