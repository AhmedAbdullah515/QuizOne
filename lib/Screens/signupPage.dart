import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapplication/CustomWedgets/textfieldcustom.dart';
import 'package:weatherapplication/Providers/authprovider.dart';
import 'package:weatherapplication/Screens/loginpage.dart';

class Signuppage extends StatelessWidget {
  Signuppage({super.key});
  final TextEditingController namecontroller=TextEditingController();
  final TextEditingController emailcontroller=TextEditingController();
  final TextEditingController passwordcontroller=TextEditingController();
  final TextEditingController Phonecontroller=TextEditingController();
  final formkey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) 
  {
    final providerobject=context.read<Authprovider>();
    return Scaffold(
      appBar: AppBar(shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),backgroundColor: Colors.deepOrange,title: Center(child: Text("Signup",style: TextStyle(fontSize: 50,fontWeight: .bold,color: Colors.white),)),),
     body: SingleChildScrollView(
      child: Form
      (
        key: formkey,
        child: Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Icon(Icons.person_2_outlined,size: 100,),
              SizedBox(height: 30,),
              Textfieldcustom(controller:namecontroller,
               lable: "username", 
               prefixicon: Icon(Icons.person),
               validator: (value) {
                 if (value==null){
                  return "name is required";
                 }
                 return null;
               },
               ),
                         SizedBox(height: 30,),
          
               Textfieldcustom(controller:emailcontroller,
               lable: "Email", 
               prefixicon: Icon(Icons.email),
               validator: (value) {
                 if (value==null||!value.contains('@')){
                  return "enter valid email";
                 }
                 return null;
               },
               ),
                           SizedBox(height: 30,),
          
               Textfieldcustom(controller:passwordcontroller,
               lable: "password", 
               prefixicon: Icon(Icons.lock),
               sufixIcon: Icon(Icons.remove_red_eye_outlined),
               validator: (value) {
                 if (value==null||value.length<6){
                  return "enter valid password";
                 }
                 return null;
               },
               ),
                           SizedBox(height: 30,),
          
               Textfieldcustom(controller:Phonecontroller,
               lable: "Phone", 
               prefixicon: Icon(Icons.lock),
               validator: (value) {
                 if (value==null||value.length<11){
                  return "enter valid phone";
                 }
                 return null;
               },
               ),
                           SizedBox(height: 30,),
                 ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
                    minimumSize: Size(200, 60),
                    backgroundColor: Colors.deepOrange
                  ),
                  onPressed:  ()async{
                  if (formkey.currentState!.validate()){
                   final success= await providerobject.userRegister(name: namecontroller.text, email: emailcontroller.text, phone: Phonecontroller.text, password: passwordcontroller.text);
                   ScaffoldMessenger.of(context).showSnackBar
                   (
                    SnackBar(content: 
                      Text(providerobject.auth?.Message??"please try again"),
                      backgroundColor: 
                      success
                      ?Colors.green
                      :Colors.red
                    ),
                   );
                   if (success)
                   {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginpage()));
          
                   }
                  }
                 },
                  child: Text("Signup",style: TextStyle(fontSize: 30,fontWeight: .bold,color: Colors.white),)
                  )
               
             ],
          ),
        )
      ),
     ),
    );
  }
}