import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:platzi_app/User/bloc/bloc_user.dart';
import 'package:platzi_app/platzi_trips_cupertino.dart';
import 'package:platzi_app/widgets/button_green.dart';
import 'package:platzi_app/widgets/gradient_back.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession(){
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        //snapshot-data object user
        if(!snapshot.hasData || snapshot.hasError ){

          return signInGoogleUI();
        }
        else{
          return PlatziTripsCupertino();
        }
      },
    );
  }

  Widget signInGoogleUI(){
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack('', MediaQuery.of(context).size.height),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome \n This is your Travel App',
              style: TextStyle(
                fontSize: 32.0,
                fontFamily: 'Lato',
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
              ),
              ButtonGreen(text: 'Login with Gmail',
                onPressed: (){
                userBloc.signOut();
                userBloc.SignIn().then((User) => print('el usuario es ${User.additionalUserInfo}'));
                },
                width: 300.0,
                heigth: 50.0,)
            ],
          )
        ],
      ),
    );
  }


}
