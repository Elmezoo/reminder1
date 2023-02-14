import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
var emailController    = TextEditingController();
var passwordController = TextEditingController();
var formKey = GlobalKey<FormState>();
bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key:formKey ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  defaultFormField(
                   controller: emailController,
                   label: "email",
                   prefix: Icons.email,
                   type: TextInputType.emailAddress,
                   validate: (valeu)
                   {
                     if (valeu.isEmpty)
                     {
                       return "email must not be empty";
                     }
                     return null ;
                   },
                  ),
                  SizedBox(
                    height: 15,
                  ),

              defaultFormField(
                controller: passwordController,
                label: "password",
                prefix: Icons.lock,
                suffix:  isPassword ?Icons.visibility:Icons.visibility_off,
                ispassword : isPassword,
                suffixPressed: ()
                {
                  setState(() {
                    isPassword = !isPassword ;
                  });
                },
                type: TextInputType.visiblePassword,
                validate: (valeu)
                {
                  if (valeu.isEmpty)
                  {
                    return "password is too short";
                  }
                  return null ;
                },
              ),
                  SizedBox(
                    height: 30,
                  ),

                  defaultButton(
                    text: "login",
                    width: double.infinity,
                    background: Colors.blue,
                    function: ()
                    {
                     if (formKey.currentState!.validate())
                     {
                       print(emailController.text);
                       print(passwordController.text );
                     }
                    }
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  defaultButton(
                    text: "REGISTER",
                    background: Colors.blue,
                    width: double.infinity,
                    function: (){
                    }
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don/t have an acount ?",
                      ),
                      TextButton(onPressed: (){}, child:
                      Text(
                        "Register Now",
                      ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
