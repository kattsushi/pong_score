import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pong_score/domain/core/utils/app_localizations.dart';
import 'package:pong_score/presentation/core/base_widget.dart/base_widget_model.dart';
import 'package:pong_score/presentation/pages/auth/auth_view_model.dart';
import 'package:pong_score/presentation/widgets/header.dart';
import 'package:pong_score/presentation/widgets/input_text.dart';

class AuthMobileViewPortrait extends BaseModelWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context, AuthViewModel model) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: <Widget>[Header(), LoginForm(size: size)],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key key, @required this.size}) : super(key: key);

  final Size size;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  static final _formKey = new GlobalKey<FormState>();

  /// just  define _formkey with static final
  Key _k1 = new GlobalKey();
  Key _k2 = new GlobalKey();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    var translate = Applocalizations.of(context).translate;
    return SingleChildScrollView(
      child: Container(
        width: widget.size.width,
        height: widget.size.height,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: widget.size.width * 0.3),
                    child: Image.asset('images/login_logo_light.png'),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    translate('login-with'),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ConstrainedBox(
                        constraints:
                            BoxConstraints(maxWidth: 170, minWidth: 170),
                        child: FlatButton.icon(
                          color: Theme.of(context).primaryColor,
                          onPressed: () {},
                          label: Text(
                            translate('login-facebook'),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          icon: FaIcon(
                            FontAwesomeIcons.facebookF,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints(maxWidth: 160, minWidth: 160),
                        child: FlatButton.icon(
                          color: Theme.of(context).primaryColor,
                          onPressed: () {},
                          label: Text(
                            translate('login-google'),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          icon: FaIcon(
                            FontAwesomeIcons.google,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    translate('or'),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 350, minWidth: 350),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            InputText(
                              label: 'Email',
                              key: _k1,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            InputText(
                              label: 'Password',
                              key: _k2,
                            )
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 350, minWidth: 350),
                    child: MaterialButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {},
                      child: Text(
                        translate('login'),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Switch(
                        activeColor: Theme.of(context).primaryColor,
                        onChanged: (bool value) {},
                        value: true,
                      ),
                      Text(
                        translate('rememberme'),
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 350, minWidth: 350),
                    child: MaterialButton(
                      color: Colors.transparent,
                      elevation: 0,
                      onPressed: () {},
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AuthMobileViewLandscape extends BaseModelWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context, AuthViewModel model) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(child: Text('Login mobile landscape')),
        ],
      ),
    );
  }
}
