import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:matitation_app/constants.dart';
import 'package:matitation_app/widgets/search_bar.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children:<Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color:kBlueLightColor,
              image:DecorationImage(
                image: AssetImage("assets/images/meditation_bg.png"),
                fit: BoxFit.fitWidth,
              )
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    "Meditation",
                    style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height:10),
                  Text(
                    "3-10 MIN Course",
                    style: TextStyle(fontWeight:FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: size.width * .6,
                    child: Text(
                      "Live happier and healthier by learning the fundamentals of meditaion and mindfulness"
                    ),
                  ),
                  SizedBox(
                    width: size.width * .5,
                    child: SearchBar()
                  ),
                  Wrap(
                    children: <Widget>[
                      SessionCard()
                    ]
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int sessionNum;
  final bool isDone;
  const SessionCard({
    Key key, this.sessionNum, this.isDone=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, Constraint) {
        return Container(
          width: Constraint.maxWidth / 2-10,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset:Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,

              ),
            ]
          ),
          child: Row(
            children: <Widget>[
              Container(
                height: 42,
                width: 43,
                decoration: BoxDecoration(
                  color: isDone ? kBlueColor : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color:kBlueColor),
                ),
                child: Icon(
                  Icons.play_arrow,
                  color: isDone ? Colors.white : kBlueColor,
                ),
              ),
              SizedBox(width: 10,),
              Text(
                "Session $sessionNum",
                style: Theme.of(context).textTheme.subtitle,
              ),
            ],
          ),
        );
      }
    );
  }
}