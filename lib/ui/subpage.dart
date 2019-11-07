import 'package:flutter/material.dart';


class SubPage extends StatefulWidget {
  final  int quantcon;
  final int pricecon;
  final int inactive;
  SubPage({this.quantcon,this.pricecon,this.inactive});
  @override
  _SubPageState createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  int quant;
  int ab;
  int res;
int clicked=0;
int inact;
  List<int> item = new List();
  List<bool> click = new List();
  void initState() {
    inact=(widget.inactive);
    res=(widget.pricecon*widget.quantcon);
    print("result =$res");
    print("wiget value is call ${widget.quantcon} ${widget.pricecon}");
    quant=widget.quantcon;
    print('value of quant is $quant');
    for(int j =0 ;j< quant;j++)
      {
        click.add(false);
      }
    for(int j =0 ;j<quant;j++)
    {
      print(click);
    }
    for (int i = 0; i <= quant; i++) {
      item.add(i);
    }
    if(inact == 2){
      res=0;
      for(int j =0 ;j< quant;j++)
      {
        click.add(false);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Summary'),actions: <Widget>[


          RaisedButton(onPressed: () {
            Navigator.pop(context);
          },
            child: Text("+"),
          )

        ],


          backgroundColor: Colors.redAccent,
        ),
        body: Container(
          child:Column(

            children: <Widget>[
              
              Expanded(
                child: Container(
                  //color: Colors.red,

                child:ListView.builder(
                    itemCount: widget.quantcon,
                    itemBuilder: (BuildContext context,int index){
                      return new Column(
                        children: <Widget>[

                          ListTile(
                            title: Text("Total price=$res"),
                            trailing: IconButton(icon: Icon(Icons.radio_button_checked),
                                color: click[index]==true? Colors.red:Colors.black
                                , onPressed: (){
                              debugPrint("hello from1");
                              setState(() {
                                clicked=index;
                                if(inact == 1){
                                  if(click[clicked]== true) {
                                    click[clicked] = false;
                                    res=res+(widget.pricecon);
                                  }
                                  else{
                                    if(click[clicked]== false)
                                    {
                                      click[clicked]=true;
                                      res=res-(widget.pricecon);
                                      print(res);
                                    }
                                  }
                                }
                                else
                                  {
                                    if(inact==2)
                                      {
                                        if(click[clicked]==false) {
                                          click[clicked] = true;
                                          res=res+(widget.pricecon);
                                        }
                                        else
                                          {
                                            if(click[clicked]==true){
                                              click[clicked] = false;
                                              res=res-(widget.pricecon);

                                            }
                                          }
                                      }
                                  }


                                print("modified result is res=${widget.pricecon}");
                              });
                            }),

                          ),

                        ],
                      ) ;
                    }
                ),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                height: 45,
              width: 200,
              decoration: BoxDecoration(
              gradient: LinearGradient(
              colors: [Colors.red, Colors.cyan, Colors.yellow],
                        ),) ,
                child: Text("Total price=$res",style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),),
                ),



            ],
          ),



              //

          ),
        );
  }
}