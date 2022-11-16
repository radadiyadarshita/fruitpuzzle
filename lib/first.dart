import 'package:flutter/material.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  List imglist=["apple.png","cherries.png","dragon-fruit.png","durian.png","grapes.png","lemon.png","orange-juice.png","strawberry.png","passion-fruit.png","watermelon.png","apple.png","cherries.png","dragon-fruit.png","durian.png","grapes.png","lemon.png","orange-juice.png","strawberry.png","passion-fruit.png","watermelon.png"];
  List visiblelist=List.filled(20,true);
  int t=1;
  String img1="",img2="";
  int pos1=0,pos2=0;
  @override
  void initState(){
    super.initState();
    imglist.shuffle();
    Future.delayed(Duration(seconds: 5)).then((value){
      setState((){
        visiblelist=List.filled(20,false);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PUZZLE"),),
      body:GridView.builder(itemCount: imglist.length,itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          child:InkWell(
            onTap: () {
          setState((){
            if(t==1){
              print("firstclick");
              visiblelist[index]=true;
              img1=imglist[index];
              pos1=index;
              t=2;
            }
            else if(t==2){
              print("secondclick");
              visiblelist[index]=true;
              img2=imglist[index];
              pos2=index;
              if(img1==img2){
                print("match");
                if(!visiblelist.contains(false))
                {
                  print("win");
                  showDialog(context: context, builder:(context){
                    return AlertDialog(
                      title: Text("you are win..!"),);
                  });
                }
              }
              else{
                Future.delayed(Duration(milliseconds: 500)).then((value){
                  setState((){
                    visiblelist[pos1]=false;
                    visiblelist[pos2]=false;
                  });
                });
              }
              t=1;
            }
          });
        },
        child: Visibility(
        visible: visiblelist[index],
        child: Image.asset("img/${imglist[index]}",height: 100,width: 100),
        replacement: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
        shape:BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
        ),
        ),
        ),
        ),
        );
      },gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 100,
          crossAxisCount:4,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
      ), ),
    );
  }
}
