import 'package:flutter/material.dart';
import 'package:shared_prefs_demo/models/user_model.dart';
import 'package:shared_prefs_demo/pages/account_page.dart';
import 'package:shared_prefs_demo/services/prefs_servis.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isWritingEmail = true;
  bool isWritingPassword = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void doLogin(){
    String  email = _emailController.text.toString().trim();
    String  password = _passwordController.text.toString().trim();

    User user = User(email:email, password: password);
    Prefs.storeUser(user);

    Prefs.loadUser().then((user) => {
      print(user.email)
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         Stack(
           children: [
             Container(
               padding: EdgeInsets.only(top: 50),
               color: Colors.white70,
               child: Center(child: Image.asset("assets/images/login_img.jpg", height: 250)),
             ),
             Container(
               padding: EdgeInsets.only(top: 270),
               child: Center(
                 child: Text("Welcome back!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
               ),
             )
           ],
         ),
          SizedBox(height: 10,),
          Center(
            child: Text("Log in to your existant account of Q Allure", style: TextStyle(color: Colors.grey, fontSize: 15),),
          ),
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(65),
              color: Colors.white,
              border: Border.all(
                width: 2,
                color: isWritingEmail ? Colors.white :Colors.blue
              )
            ),
            child: Center(
              child: TextField(
                onTap: (){
                  setState(() {
                    isWritingEmail = !isWritingEmail;
                  });
                },
                controller: _emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Email",
                  icon: Icon(Icons.person_outline_outlined)
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 65,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(65),
                color: Colors.white,
                border: Border.all(
                    width: 2,
                  color: isWritingPassword ? Colors.white :Colors.blue
                )
            ),
            child: Center(
              child: TextField(
                onTap: (){
                  setState(() {
                    isWritingPassword = !isWritingPassword;
                  });
                },
                controller: _passwordController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                    icon: Icon(Icons.lock)
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(right: 20),
            child: Text("Forgot password?",),
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 100),
            height: 60 ,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.blue.shade900,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(.2),
                    offset:Offset(9.0,9.0),
                    blurRadius: 20,
                  )
                ]
            ),
            child: TextButton(
              onPressed: doLogin,
              child: Text("LOG IN", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(height: 40,),
          Center(
            child: Text("Or connect using", style: TextStyle(color: Colors.grey),),
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.indigo.shade700)
                      ),
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("f ", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                          Text("Facebook ", style: TextStyle(color: Colors.white, ),),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: Container(
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.red)
                      ),
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("G ", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                          Text("Google", style: TextStyle(color: Colors.white, ),),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?", style: TextStyle(fontSize: 15),),
                TextButton(onPressed: (){
                  setState(() {
                    Navigator.pushReplacementNamed(context, AccountPage.id);
                  });
                },
                  child: Text("Sign Up", style: TextStyle(color: Colors.blue.shade600,
                      fontWeight: FontWeight.bold,
                    fontSize: 15
                  ),
                ),
                )
              ],
            ),
        ],
      )
    );
  }
}
