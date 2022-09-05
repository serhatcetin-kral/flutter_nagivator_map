import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(accentColor: Colors.grey),
      //home: HomePage(),

      initialRoute:"/",
      routes: {// map olusturmak icin kullaniyoruz routes burada map olusturduk

        HomePage.routeName:(context)=> HomePage() ,
        RoutePink.routeName:(context)=>RoutePink(),
        RouteGrey.routeName:(context)=>RouteGrey(),
        RouteGreen.routeName:(context)=>RouteGreen(),
      },
      onGenerateRoute:(settings){
        if(settings.name==RoutePink.routeName){
          return MaterialPageRoute(builder:(context)=>RoutePink());
        }


      },
    );
  }
}

class Users{
late String name;
late int age;
late String address;
Users({required this.name,required this.age,required this.address});




}
class HomePage extends StatelessWidget {

  Users user_1=Users(name: "murat", age: 6, address: "malawi area 10");


  static String routeName='/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(title:Text('Sayfalar Arası Geçiş / Navigation')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('HomePage'),
            RaisedButton(
                child: Text('Git -> Route Pink'),
                onPressed: () {
                  Navigator.pushNamed(context, RoutePink.routeName,arguments:user_1 );
                })
          ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE PINK
///////////////////////////////////////////////
class RoutePink extends StatelessWidget {

  static String routeName="/routePink";
  @override
  Widget build(BuildContext context) {

    Users localUser = ModalRoute.of(context)!.settings.arguments as Users;//CONTEXTE SORUN CIKINCA UNLEM ISARETI KOYDUM NOT NULL GIBI
    //MODALROUTE  BASKA SAYFAY BILGI almak ICIN KULLANDIM
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(title: Text('Route Pink')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('User name:${localUser.name},User age:${localUser.age},User Address:${localUser.address}'),
            RaisedButton(child: Text('Git -> Route Green'), onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder:(context)=> RouteGreen() ), INSTEDEAD OF THIS USE BELOW
              Navigator.pushNamed(context, RouteGreen.routeName);



            }),
            RaisedButton(child: Text('Geri Dön'), onPressed: () {
              Navigator.pop(context);

            }),
          ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE GREEN
///////////////////////////////////////////////
class RouteGreen extends StatelessWidget {
  static String routeName='/routeGreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: Text('Route Green')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Şu an RouteGreen en üstte'),
            RaisedButton(child: Text('Git -> Route Grey'), onPressed: () {
            Navigator.pushNamed(context, RouteGrey.routeName);

            }),
            RaisedButton(child: Text('Geri Dön'), onPressed: () {
              Navigator.pop(context);
            }),
          ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE GREY
///////////////////////////////////////////////
class RouteGrey extends StatelessWidget {
  static String routeName='/routeGrey';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Route Grey')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Şu an RouteGrey en üstte'),
            RaisedButton(child: Text('Git -> ....'), onPressed: () {}),
            RaisedButton(child: Text('Geri Dön'), onPressed: () {

              Navigator.pop(context);}),
          ])),
    );
  }
}