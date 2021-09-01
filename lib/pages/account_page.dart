import 'package:flutter/material.dart';
import 'package:shared_prefs_demo/models/account_model.dart';
import 'package:shared_prefs_demo/services/account_prefs.dart';

import 'home_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key key}) : super(key: key);
  static final String id = "account_page";

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  bool nameWriting = false;
  bool emailWriting = false;
  bool phoneWriting = false;
  bool passwordWriting = false;
  bool confPassWriting = false;



   List infohintText = [
     "FullName", "Email","Phone","Password","Confirm Password"
   ];

   final emailController = TextEditingController();
   final passwordController = TextEditingController();
   final phoneController = TextEditingController();
   final nameController = TextEditingController();
   final confPassController = TextEditingController();

   void doCreate(){
     String email = emailController.text.toString().trim();
     String name = nameController.text.toString().trim();
     String phone = phoneController.text.toString().trim();
     String password = passwordController.text.toString().trim();
     String confPassword = confPassController.text.toString().trim();

    Account account =  Account(email: email, fullName: name,phone: phone, password: password,confirmPass: confPassword);
      AccountPrefs.storeAccount(account);

      AccountPrefs.loadAccount().then((account) => {
        print(account.fullName)
      });

   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade100,
        leading: IconButton(
          onPressed: (){
            setState(() {
              Navigator.pushReplacementNamed(context, HomePage.id);
            });
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(child: Text("Let's Get Started!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)),
            SizedBox(height: 10,),
            Center(child: Text("Create an account to Q Allure to get all features", style: TextStyle(color: Colors.grey),),),
            SizedBox(height: 50,),
            registInfo( hintNum: 0,icon: Icons.person_outline_outlined, controller: nameController),
            registInfo( hintNum: 1,icon: Icons.email, controller: emailController),
            registInfo( hintNum: 2,icon: Icons.phone_android, controller: phoneController),
            registInfo( hintNum: 3,icon: Icons.lock, controller: passwordController),
            registInfo( hintNum: 4,icon: Icons.lock, controller: confPassController),
            SizedBox(height: 40,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 75),
              height: 65,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75),
                color: Colors.blue.shade800,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(.2),
                    offset:Offset(9.0,9.0),
                    blurRadius: 20,
                  )
                ]
              ),
              child: Center(
                child: TextButton(
                 onPressed: doCreate,
                  child: Text("CREATE",  style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            SizedBox(height: 45,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ", style: TextStyle(fontSize: 16),),
                Text("Login here", style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),),
              ],
            )
          ],
        ),
      )
    );
  }

  Widget registInfo( { hintNum, icon, controller}){
   return   Container(
     margin: EdgeInsets.only(bottom: 20 ),
     padding: EdgeInsets.only(left: 20, right: 20),
     height: 65,
     decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(65),
         color: Colors.white,
         border: Border.all(
             width: 2,
             color:  Colors.white
         )
     ),
     child: Center(
       child: TextField(
         controller: controller ,
         onTap: (){

         },
         decoration: InputDecoration(
             border: InputBorder.none,
             hintText: infohintText[hintNum],
             hintStyle: TextStyle(color: Colors.grey.shade400),
             icon: Icon(icon, color: Colors.grey.shade400 )
         ),
       ),
     ),
   );
  }

}