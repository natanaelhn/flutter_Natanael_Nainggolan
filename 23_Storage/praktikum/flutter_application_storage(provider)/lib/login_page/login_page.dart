import 'package:flutter/material.dart';
import 'package:flutter_application_storage/api_response/api_response.dart';
import 'package:flutter_application_storage/login_page/login_provider.dart';
import 'package:flutter_application_storage/main_page/main_page.dart';
import 'package:flutter_application_storage/my_colors.dart';
import 'package:flutter_application_storage/scale_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: MyColors.pagePrimaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Form(
              key: keyForm,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    ConstrainedBox(
                                      constraints: const BoxConstraints(
                                        maxHeight: 70,
                                      ),
                                      child: const Image(image: AssetImage('assets/logo2.png'))
                                    ),
                                    const Text('Story API', style: TextStyle(color: Colors.white, fontSize: 20),)
                                  ],
                                ),
                              ),
                              const SizedBox(height: 32,),
                              Consumer<LoginProvider>(
                                builder: (context, value, child) => Text(
                                  (loginProvider.isLogin) ? 'LOGIN' : 'REGISTER', 
                                  style: const TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(height: 32,),

                              //NAMA FORM FIELD         
                              ConstrainedBox(
                                constraints: const BoxConstraints(maxWidth: 500),
                                child: Column(
                                  children: [
                                    Consumer<LoginProvider>(
                                      builder: (context, value, child) => (loginProvider.isLogin) ? const SizedBox() : Column(
                                        children: [
                                          TextFormField(
                                            controller: nameController,
                                            style: const TextStyle(color: Colors.white),
                                            decoration: const InputDecoration(
                                              labelText: 'Nama',
                                              labelStyle: TextStyle(color: Colors.white),
                                              floatingLabelStyle: TextStyle(color: Colors.amber),
                                              hintText: 'Masukkan Nama',
                                              hintStyle: TextStyle(color: Colors.white54),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.amber)
                                              )
                                            ),
                                          ),
                                          const SizedBox(height: 16,),
                                        ],
                                      ),
                                    ),
                                              
                                              
                                    //EMAIL FORM FIELD
                                    TextFormField(
                                      controller: emailController,
                                      style: const TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(
                                        labelText: 'Email',
                                        labelStyle: TextStyle(color: Colors.white),
                                        floatingLabelStyle: TextStyle(color: Colors.amber),
                                        hintText: 'Masukkan Email',
                                        hintStyle: TextStyle(color: Colors.white54),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.amber)
                                        )
                                      ),
                                    ),
                                    const SizedBox(height: 16,),
                                              
                                    //PASSWORD FORM FIELD
                                    Consumer<LoginProvider>(
                                      builder: (context, value, child) => TextFormField(
                                        controller: passwordController,
                                        style: const TextStyle(color: Colors.white),
                                        obscureText: (loginProvider.isVisible) ? false : true,
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          labelStyle: const TextStyle(color: Colors.white),
                                          floatingLabelStyle: const TextStyle(color: Colors.amber),
                                          hintText: 'Masukkan Password',
                                          hintStyle: const TextStyle(color: Colors.white54),
                                          suffixIcon: TextButton(
                                            onPressed: ()=> loginProvider.changeIsVisible(), 
                                            style: ButtonStyle(
                                              overlayColor: MaterialStatePropertyAll(Colors.amber.withOpacity(0.05))
                                            ),
                                            child: Icon( 
                                              (loginProvider.isVisible)? Icons.visibility : Icons.visibility_off,
                                              color: Colors.white,
                                            ),
                                          ),
                                          enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                          ),
                                          focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.amber)
                                          )
                                        ),
                                      ),
                                    ),
                                    
                                    //TEXT BUTTON
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        onPressed: (){
                                          loginProvider.changeIsLogin();
                                        }, 
                                        child: Text(
                                          (loginProvider.isLogin) ? 'Register a new account?' : 'Have an existing account?', 
                                          style: const TextStyle(color: Colors.amber,),
                                          ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                                        
                            ],
                          ),
                        ],
                      ),
                    ),


                    //BUTTON
                    Column(
                      children: [
                        Consumer<LoginProvider>(
                          builder: (context, value, child) => ElevatedButton(
                            onPressed: () async {
                                
                              loginProvider.changeIsLoading(true);
                              if(loginProvider.isLogin){
                                await loggingIn();
                              }
                              else{
                                final futureRegisterObject = await APIResponse.fetchRegister(
                                  name: nameController.text, 
                                  email: emailController.text, 
                                  password: passwordController.text
                                );

                                if(mounted){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(futureRegisterObject.message)
                                  ));
                                }

                                if(futureRegisterObject.error == false){
                                  await loggingIn();
                                }
                              
                              }
                              loginProvider.changeIsLoading(false);

                            },
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Colors.amber)
                            ),
                            child: Text(
                              (loginProvider.isLogin)? 'Login' : 'Register', 
                              style: TextStyle(color: MyColors.pagePrimaryColor),
                            )
                          ),
                        ),
                        const SizedBox(height: 16,),
                      ],
                    )
                  ],
                ),
              )
            ),

            //CIRCULAR PROGRESS
            Consumer<LoginProvider>(
              builder: (context, value, child) =>  (loginProvider.isLoading)? Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.black45
                ),
                child: const FittedBox(fit: BoxFit.none, child: CircularProgressIndicator( color: Colors.amber,))
              ) :  const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loggingIn() async{
    final futureLoginObject = await APIResponse.fetchLogin(
      email: emailController.text,
      password: passwordController.text,
    );

    if(futureLoginObject.error == false){

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userId', futureLoginObject.loginResult!['userId']!);
      await prefs.setString('name', futureLoginObject.loginResult!['name']!);
      await prefs.setString('token', futureLoginObject.loginResult!['token']!);

      if (mounted) Navigator.pushReplacement(context, scaleTransition(const MainPage()));
    }
    else{
      if (mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(futureLoginObject.message)
        ));
      }
    }
  }
}