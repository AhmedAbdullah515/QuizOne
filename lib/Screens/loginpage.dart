import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapplication/CustomWedgets/textfieldcustom.dart';
import 'package:weatherapplication/Providers/authprovider.dart';
import 'package:weatherapplication/Screens/homepage.dart';

class Loginpage extends StatelessWidget 
{
  
  Loginpage({super.key});
  
 final TextEditingController Passwordcontroller=TextEditingController();
   final TextEditingController usernamecontroller=TextEditingController();
  final formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context)
   {
    final authprovider=context.read<Authprovider>();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepOrange,title: Center(child: Text("Login",style: TextStyle(fontSize: 40,fontWeight: .bold,color: Colors.white),
      ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
      ),
      body: SingleChildScrollView(
        child: Form
        (
          key: formkey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock,size: 100,),
                SizedBox(height: 40,),
                Textfieldcustom
                (
                  controller: usernamecontroller, 
                  lable: "username",
                   prefixicon: Icon(Icons.person),
                    validator:(value) 
                    {
                      if (value==null){
                        return "enter valid name";
                      } 
                      return null;
                    } ,
                  ),
                  SizedBox(height: 30   ,),
                  Textfieldcustom(controller:Passwordcontroller , 
                  lable: "Password",
                   prefixicon: Icon(Icons.lock),
                   validator: (value) {
                     if (value==null||value.length<6){
                      return "enter valid password";
                     }
                     return null;
                   },
                   ),
                   SizedBox(height: 40,),
                   ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
                      minimumSize: Size(200,60)
                    ),
                    onPressed: () async{
                     if (formkey.currentState!.validate()) {
                     {
                      final data= await authprovider.userlogin(email: usernamecontroller.text, password: Passwordcontroller.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: 
                        Text(authprovider.auth?.Message??"please try again"),
                        backgroundColor: 
                        data
                        ?Colors.green
                        :Colors.red
                        
                        ),
                      );
                      if (data){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
                      }
                     }
                     
                   }
                   }, 
                    child: Text("Login",style: TextStyle(fontSize: 30,fontWeight: .bold),),
            
                   )
              ],
            ),
          ),
        ),
      ),
    );
  }
}