import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:improw/auth/profile/profile_view.dart';
import 'package:improw/data/cubits/image_picker/image_cubit.dart';
import 'package:improw/data/cubits/register/register_cubit.dart';
import 'package:improw/widgets/auth/register_fieled.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController userController = TextEditingController();

    final TextEditingController emailController0 = TextEditingController();
    final TextEditingController passwordController0 = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            height: h,
            width: w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/r.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: h * 0.2,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) {
                          return StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return SingleChildScrollView(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(20.0),
                                  decoration: const BoxDecoration(
                                    color: Colors.black87,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(
                                              Icons.arrow_back_ios,
                                              size: h * 0.03,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            width: w * 0.23,
                                          ),
                                          Text(
                                            'Sign up',
                                            style: GoogleFonts.teko(
                                              textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: h * 0.045,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: h * 0.020),
                                      CustomRegisterField(
                                        labelText: 'user name',
                                        controller: userController,
                                      ),
                                      CustomRegisterField(
                                        labelText: 'Email',
                                        controller: emailController,
                                      ),
                                      CustomRegisterField(
                                        labelText: 'Password',
                                        controller: passwordController,
                                      ),
                                      const SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: () async {
                                          final state = ImageInitial();
                                          context.read<AuthCubit>().signUp(
                                                image: state.toString(),
                                                nic: userController.text,
                                                email: emailController.text,
                                                password:
                                                    passwordController.text,
                                              );
                                          final currentUser =
                                              FirebaseAuth.instance.currentUser;
                                          if (currentUser != null) {
                                            DocumentSnapshot userData =
                                                await FirebaseFirestore.instance
                                                    .collection('users')
                                                    .doc(currentUser.uid)
                                                    .get();
                                            emailController.clear();
                                            passwordController.clear();
                                            userController.clear();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfilePage(
                                                  userData: userData.reference,
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white70,
                                          minimumSize: Size(w * 0.6, 50),
                                        ),
                                        child: const Text(
                                          'Sign up',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      height: h * 0.065,
                      width: w * 0.7,
                      child: Center(
                        child: Text(
                          'Sign up',
                          style: GoogleFonts.teko(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: h * 0.045,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) {
                          return StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return SingleChildScrollView(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(20.0),
                                  decoration: const BoxDecoration(
                                    color: Colors.black87,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(
                                              Icons.arrow_back_ios,
                                              size: h * 0.03,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            width: w * 0.27,
                                          ),
                                          Text(
                                            'Sign in',
                                            style: GoogleFonts.teko(
                                              textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: h * 0.045,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      CustomRegisterField(
                                        labelText: 'Email',
                                        controller: emailController0,
                                      ),
                                      CustomRegisterField(
                                        labelText: 'Password',
                                        controller: passwordController0,
                                      ),
                                      const SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: () async {
                                          context.read<AuthCubit>().logIn(
                                                email: emailController0.text,
                                                password:
                                                    passwordController0.text,
                                              );
                                          final currentUser =
                                              FirebaseAuth.instance.currentUser;
                                          if (currentUser != null) {
                                            DocumentSnapshot userData =
                                                await FirebaseFirestore.instance
                                                    .collection('users')
                                                    .doc(currentUser.uid)
                                                    .get();
                                            emailController0.clear();
                                            passwordController0.clear();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfilePage(
                                                  userData: userData.reference,
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white70,
                                          minimumSize: Size(w * 0.6, 50),
                                        ),
                                        child: const Text(
                                          'Sign in',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      height: h * 0.065,
                      width: w * 0.7,
                      child: Center(
                        child: Text(
                          'Sign in',
                          style: GoogleFonts.teko(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: h * 0.045,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.1,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Skip',
                      style: GoogleFonts.teko(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: h * 0.036,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
