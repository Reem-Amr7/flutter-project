import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utilis/vlidation.dart';

class Data_widget extends StatelessWidget {
   Data_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
       child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: [
        Column(
          children: [
           
             Image.network("assets/images/logojpg.jpg",
                 height: 120,
                width: 120,
            
                
              ),

             Text("Sign up here", style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,),)
              ],
      
     
      ),
      SizedBox(height: 45),

        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: TextEditingController(),
          keyboardType: TextInputType.name,
          validator:Rgisteration_validation().name_validate ,
          decoration: InputDecoration(
             contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
               constraints: BoxConstraints(maxWidth: 450),
            label: Text("First Name"),
            hintText: "Enter your first name",
            prefix: Icon(Icons.abc),
            border:OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.green,
                width: 2
              ),
              borderRadius: BorderRadius.circular(25)
            ),
               focusedBorder:OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 34, 177, 39),
                width: 2
              ),
              borderRadius: BorderRadius.circular(10)
            ),
               errorBorder:OutlineInputBorder(
              borderSide:const BorderSide(
                color: Colors.red,
                width: 2
              ),
              borderRadius: BorderRadius.circular(25)
            )
          ),
        ),
        SizedBox(height:22,),
         TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: TextEditingController(),
          keyboardType: TextInputType.name,
          validator:Rgisteration_validation().name_validate ,
          decoration:decoration.copyWith(
            labelText: "Last Name",
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            constraints: BoxConstraints(maxWidth: 450),
          )
        ),
                SizedBox(height:22,),

          TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: TextEditingController(),
          keyboardType: TextInputType.name,
          validator:Rgisteration_validation_email().email_validate ,
          decoration:decoration.copyWith(
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            constraints: BoxConstraints(maxWidth: 450),
            labelText: "Email",
            hintText: "xxxxx @gmail.com",
            prefixIcon: Icon(Icons.mail),

          )
          ),
          SizedBox(height: 22),
            TextFormField(

          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: TextEditingController(),
          keyboardType: TextInputType.name,
          validator:Rgisteration_validation_password().password_validate ,
          decoration:decoration.copyWith(
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            constraints: BoxConstraints(maxWidth: 450),
            labelText: "Password",
            hintText: "Enter your password",
            prefixIcon: Icon(Icons.lock),
            

          ),
          obscureText: true,
          obscuringCharacter: "*",
          ),

        
      ],
    ));
  }
  InputDecoration decoration=InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            hintText: "Enter your last name",
            prefix: Icon(Icons.abc),
            border:OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.green,
                width: 2
              ),
              borderRadius: BorderRadius.circular(25)
            ),
               focusedBorder:OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 34, 177, 39),
                width: 2
              ),
              borderRadius: BorderRadius.circular(10)
            ),
               errorBorder:OutlineInputBorder(
              borderSide:const BorderSide(
                color: Colors.red,
                width: 2
              ),
              borderRadius: BorderRadius.circular(15)
            ),
          );
}