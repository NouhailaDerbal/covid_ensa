import 'package:covidensa/core/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'form_page.dart';
import 'formu_page.dart';

import 'package:covidensa/services/auth.dart';

class SignUpPage  extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();

}

/*class _SignUpPageState extends State<SignUpPage> {
  //inputs state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}*/
class _SignUpPageState extends State<SignUpPage>  {
  //objet authService
  final AuthService _auth = AuthService();

  //inputs state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/virus.png",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (val) {
                setState(() => email = val);
              },
            ),
            RoundedPasswordField(
              onChanged: (val) {
                setState(() => password = val);
              },
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {
                //Navigator.of(context).push(MaterialPageRoute(builder:(_) => ForPage(), ),);
                //print(this.email);
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.of(context).push(MaterialPageRoute(builder:(_) =>FormPage(), ),);

                    },
                  ),
          ],
        ),
    );

  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = Colors.purple,
    this.textColor = Colors.white,
  }) : super(key: key);

  get kPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor:Colors.white54,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.deepPurpleAccent,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: Colors.white70,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: Colors.deepPurpleAccent,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color:Colors.grey,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: TextStyle(color: Colors.grey),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
