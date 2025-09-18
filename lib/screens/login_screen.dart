import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/bloc/authentication/auth_bloc.dart';
import 'package:shop/constants/colors.dart';
import 'package:shop/main.dart';
import 'package:shop/screens/dashbord_screen.dart';
import 'package:shop/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController(
      text: 'amirahmad',
    );
    TextEditingController passwordController = TextEditingController(
      text: '12345678',
    );

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 90),
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset("assets/images/login_photo.jpg"),
              ),
              SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "نام کاربری",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: "SM",
                      ),
                    ),
                    Container(
                      color: Colors.grey[200],
                      child: TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelStyle: TextStyle(
                            fontSize: 18,
                            fontFamily: "SM",
                            color: ColorApplication.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "رمز عبور",

                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: "SM",
                      ),
                    ),
                    Container(
                      color: Colors.grey[200],
                      child: TextField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelStyle: TextStyle(
                            fontSize: 18,
                            fontFamily: "SM",
                            color: ColorApplication.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthenticationInitial) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 50),
                        backgroundColor: ColorApplication.blueIndicator,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(
                          AuthLoginRequest(
                            usernameController.text,
                            passwordController.text,
                          ),
                        );
                      },
                      child: Text(
                        "ورود ",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "dana",
                          fontSize: 20,
                        ),
                      ),
                    );
                  }
                  if (state is AuthSateLoading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (state is AuthResponseState) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      state.response.fold((error) {}, (success) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => DashBoordScreen(),
                          ),
                        );
                      });
                    });
                    return state.response.fold(
                      (error) => Text(
                        error,
                        style: TextStyle(
                          color: Colors.red,
                          fontFamily: "SM",
                          fontSize: 16,
                        ),
                      ),
                      (success) => Text(
                        success,
                        style: TextStyle(
                          color: Colors.green,
                          fontFamily: "SM",
                          fontSize: 16,
                        ),
                      ),
                    );
                  }

                  return Text("خطای نا مشخص");
                },
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return BlocProvider(
                          create: (context) {
                            var authBloc = AuthBloc();
                            authBloc.stream.forEach((state) {
                              if (state is AuthResponseState) {
                                state.response.fold(
                                  (error) {
                                    // Show error message
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          error,
                                          style: TextStyle(
                                            fontFamily: "SM",
                                            fontSize: 16,
                                          ),
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  },
                                  (success) {
                                    globalNavigationKey.currentState
                                        ?.pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DashBoordScreen(),
                                          ),
                                        );
                                  },
                                );
                              }
                            });

                            return authBloc;
                          },
                          child: RegisterScreen(),
                        );
                      },
                    ),
                  );
                },
                child: Text("اگبر حساب کاربری ندارید ثبت نام کنید"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
