import 'package:flutter/material.dart';
import 'package:flutterbeautifulpage/models/destination_model.dart';
import 'package:flutterbeautifulpage/models/hotel_model.dart';
class HotelCarousel extends StatefulWidget {
  HotelCarousel({Key key}) : super(key: key);

  @override
  _HotelCarouselState createState() => _HotelCarouselState();
}

class _HotelCarouselState extends State<HotelCarousel> {
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
                "推薦旅館",
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
            scrollDirection: Axis.horizontal,//橫向listView
            itemCount: hotels.length,
            itemBuilder:(BuildContext context,int index){
              Hotel hotel = hotels[index];
              //destination = destinations的索引,在這裡呼叫destinations
              //等於直接將list內的該個索引值給予destination的建構參數
              //因此可以以destinations[index].city來呼叫該索引的值
              return Container(
                margin: EdgeInsets.all(10),
                width: 280,
//                  color: Colors.deepOrange,// 一開始撰寫時創立需要
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Positioned(
                      bottom:15,
                      child: Container(
                        height: 130,
                        width: 270,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "${hotel.name}",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "${hotel.address}",
                                style: TextStyle(
                                    color: Colors.blueGrey
                                ),
                              ),
                              SizedBox(height: 2,),
                              Text(
                                "${"\$${hotel.price}/Night"}",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
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
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image(
                              height: 215,
                              width: 260,
                              image: AssetImage(hotel.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 10,
                            bottom: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[

                              ],
                            ),
                          )
                        ],
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