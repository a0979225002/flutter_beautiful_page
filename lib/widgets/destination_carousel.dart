import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeautifulpage/models/destination_model.dart';
import 'package:flutterbeautifulpage/widgets/destination_details.dart';
/*
  輪播
 */
class DestinationCarousel extends StatefulWidget {

  DestinationCarousel({Key key}) : super(key: key);

  @override
  _DestioationCardState createState() => _DestioationCardState();
}


class _DestioationCardState extends State<DestinationCarousel> {
  List list;
  List newList(){
    if (list == null) {
      list = new List();
      for(int i = 0; i<destinations.length;i++){

        int num = Random().nextInt(destinations.length);
        if (list.length>0) {
          if (list.contains(num)) {
            i--;
          }else {
            list.add(num);
          }
        } else if(list.length<1){
          list.add(num);
        }
      }
      return list;
    } else{
      return list;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "熱門地點",
                style: TextStyle(
                    fontSize:25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3 //字間寬
                ),
              ),
              GestureDetector(
                onTap: ()=>{
                  print("See All")
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600
                  ),
                ),
              )
            ],
          ),
        ),
         Container(
            height: 350,
            padding: EdgeInsets.only(left: 10),
//          color: Colors.blue,// 一開始撰寫時創立需要
            child: ListView.builder(
              scrollDirection: Axis.horizontal,//橫向listViewd
              itemCount: destinations.length,
              itemBuilder:(BuildContext context,int index){
                Destination destination = destinations[newList()[index]];//隨機展示
                //destination = destinations的索引,在這裡呼叫destinations
                //等於直接將list內的該個索引值給予destination的建構參數
                //因此可以以destinations[index].city來呼叫該索引的值
                return Container(
                  margin: EdgeInsets.all(10),
                  width: 240,
//                  color: Colors.deepOrange,// 一開始撰寫時創立需要
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom:15,
                        child: Container(
                          height: 130,
                          width: 240,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "活動:${destination.activities.length}個",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2
                                  ),
                                ),
                                Text(
                                  "${destination.description}",
                                  style: TextStyle(
                                      color: Colors.blueGrey
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:BorderRadius.circular(30),
                          boxShadow:[
                            BoxShadow(//偏移
                                color: Colors.black54,
                                offset: Offset(4.0,8.0),
                                blurRadius: 6.0
                            )
                          ],
                        ),
                        child:GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(
                             MaterialPageRoute(
                              builder: (context)=>DestinationDetails(index,destination: destination,),
                             )
                            );
                          },
                          child: Stack(
                            children: <Widget>[
                              Hero(
                                tag:destination.imageUrl,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image(
                                    height: 215,
                                    width: 230,
                                    image: AssetImage(destination.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                bottom: 10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      destination.city,
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.place,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          destination.country,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

      ],
    );
  }
}