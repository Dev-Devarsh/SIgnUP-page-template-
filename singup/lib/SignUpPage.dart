// ignore_for_file: prefer_const_literals_to_create_immutables , prefer_const_constructors,unused_field, prefer_final_fields, unused_element
import 'package:flutter/material.dart';
import 'package:singup/HomePage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _key = GlobalKey();
  bool _autovalidate = false;
  late String name, email, mobile, collegename, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _key,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10.0)),
                  Image(
                    image: AssetImage('images/logo.png'),
                    height: 100.0,
                    width: 100.0,
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: TextFormField(
                      validator: (input) {
                        if (input!.isEmpty) {
                          //add "!" to ensure that Enterd value will not be null , all the stings are defined like input , name above
                          return 'Enter name';
                        }
                      },
                      decoration: InputDecoration(labelText: 'Name'),
                      onSaved: (input) => name =
                          input! //add "!" to ensure that Enterd value will not be null
                      ,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: TextFormField(
                      validator: (input) {
                        if (input!.isEmpty) {
                          //add "!" to ensure that Enterd value will not be null
                          return 'Enter Email';
                        }
                      },
                      decoration: InputDecoration(labelText: 'Email'),
                      onSaved: (input) => email =
                          input!, //add "!" to ensure that Enterd value will not be null
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: TextFormField(
                      validator: (input) {
                        if (input!.isEmpty) {
                          //add "!" to ensure that Enterd value will not be null
                          return 'Enter Phone number';
                        }
                      },
                      decoration: InputDecoration(labelText: 'Mobile'),
                      onSaved: (input) => mobile =
                          input!, //add "!" to ensure that Enterd value will not be null
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.school_rounded),
                    title: TextFormField(
                      validator: (input) {
                        if (input!.isEmpty) {
                          //add "!" to ensure that Enterd value will not be null
                          return 'Enter College Name';
                        }
                      },
                      decoration: InputDecoration(labelText: 'College Name'),
                      onSaved: (input) => collegename =
                          input!, //add "!" to ensure that Enterd value will not be null
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.password),
                    title: TextFormField(
                      obscureText: true,
                      obscuringCharacter: "*",
                      validator: (input) {
                     /*instaed "input" we can take string but make sure you use same string 
                      in  if condition ex, validator: (value){ if (value!.isEmpty)} ext  */
                        if (input!.isEmpty) {    // ".isEmpty is property"
                          //add "!" to ensure that Enterd value will not be null
                          return 'Enter Password';
                        }
                      },
                      decoration: InputDecoration(labelText: 'Password'),
                      onSaved: (input) => password =
                          input!, //add "!" to ensure that Enterd value will not be null
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ButtonTheme(
                    height: 40.0,
                    minWidth: 200.0,
                    child: RaisedButton(
                      onPressed:
                          _sendToNextPage, //to avoid errors sometime just wite onpressed method as later we can edit
                      color: Colors.amber,
                      splashColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 220))
                ],
              ),
            )),
      ),
    );
  }

  _sendToNextPage() {
    if (_key.currentState!.validate()) {
      // use ! for null cheack
      // saves to Globle keys
      _key.currentState!.save();
      // send to next screen
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              //name , mobile , email , collegename Diclrerd in String as above
              Name: name,
              Mobile: mobile,
              Email: email,
              Collegename: collegename,
              Password: password,
            ),
          ));
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }
}
