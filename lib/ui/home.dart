import 'package:flutter/material.dart';
import 'subpage.dart';


class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  final _formkey = GlobalKey<FormState>();
    String quantcon;
    String pricecon;
  int aa;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Container(
          //alignment: Alignment.centerRight,
          child: new ListView(
            children: <Widget>[
              Container(
                child: new Column(
                  children: <Widget>[
                    Image.asset("image/face.png",
                      height: 150,
                      width: 150,
                      alignment: Alignment.center,
                    ),
                    new Container(

                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: new TextFormField(
                             textDirection: TextDirection.ltr,
                             style: new TextStyle(
                                        fontSize: 18.0,
                                        height: 1.0,
                                        color: Colors.black,),
                            controller: null,
                            //keyboardType: TextInputType.number,
                            decoration: new InputDecoration(
                                        labelText: "Product Name",
                                        hintText: "Mark Juckerburg",
                                        icon: Icon(Icons.people_outline),
                             border: OutlineInputBorder(
                                 gapPadding: 3,
                                 borderRadius: BorderRadius.circular(25)
                             ),),
                            validator:(value){
                              if(value.isEmpty)
                              {
                                return "Please Enter Name";
                              }
                              else if( value.length >= 10)
                              {
                                return "name is too long";
                              }
                              else{
                                return null;
                              }
                            }
                      ),
                       ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        onSaved: (_)=>pricecon=_,
                        decoration: new InputDecoration(
                            labelText: "Price",
                            icon: Icon(Icons.people_outline),
                            border: OutlineInputBorder(
                              gapPadding: 3,
                              borderRadius: BorderRadius.circular(25)
                            )),
                        validator: (value){
                          if(value.isEmpty){
                            return "Enter Price";}
                          else{
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                            labelText: "Quantity",
                            icon: Icon(Icons.people_outline),
                            border: OutlineInputBorder(
                                gapPadding: 3,
                                borderRadius: BorderRadius.circular(25)
                            )),
                        onSaved: (_)=>quantcon=_,
                        validator: (value){
                          String var1="";
                          var1=value;

                          int a=int.parse(value);
                          if(var1.isEmpty){
                            return "Enter quantity";
                          }
                          else if(a > 10)
                          {
                            return "please enter the value lessthan 11 ";
                          }
                          else
                            return null;
                        },
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: null,
                        //keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                            labelText: "Description",
                            hintText: "About product",
                            border: OutlineInputBorder(
                                gapPadding: 3,
                                borderRadius: BorderRadius.circular(25),),
                                icon: Icon(Icons.people_outline),),
                        validator: (value){
                          if(value.isEmpty){
                            return "Enter Description";
                          }
                          else if(value.length >= 5)
                          {
                            return "Size should be less than 5";
                          }
                          else
                            return null;
                        }

                        ),
                    ),
                    Row(
                      children: <Widget>[
                        Radio<int>(value: 1, groupValue: aa, onChanged: (int a){setState(() {aa=a;print(aa);});},),
                        new Text("Active"),

                        Radio<int>(value: 2, groupValue: aa, onChanged: (int a){setState(() {aa=a; print(aa);});}),new Text("Inactive"),
                      ],
                    ),


                    Padding(
                      padding: new EdgeInsets.all(16.0),
                    ),
                    RaisedButton(
                      onPressed: () {
                        if (_formkey.currentState.validate()) {
                          _formkey.currentState.save();
                          // If form is valid, display .

                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')));
                        }
                        if(_formkey.currentState.validate()) {
                          _formkey.currentState.save();
                          Navigator.of(context).push(
                              new MaterialPageRoute(builder: (
                                  BuildContext context) =>
                                  SubPage(
                                      quantcon: int.parse(quantcon),pricecon: int.parse(pricecon),inactive:(aa))
                              ));
                        }else{
                          print('enter all detaisl  correctly');}

                      },
                      child: Text("submit"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        _formkey.currentState.reset();


                      },
                      child: Text(
                        "clear",,
                      ),
                    ),
//
////

                  ],

                ),
              ),
            ],
          ),
        )
    );
  }
}
