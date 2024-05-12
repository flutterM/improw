import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:improw/data/cubits/bmi/bmi_cubit.dart';
import 'package:improw/data/cubits/calories/kkal_cubit.dart';
import 'package:improw/data/cubits/calories/kkaltap_cunit.dart';
import 'package:improw/data/cubits/calories/saveKkla_cubit.dart';
import 'package:improw/data/cubits/click/click_cubit.dart';
import 'package:improw/data/cubits/image_picker/image_cubit.dart';
import 'package:improw/data/cubits/register/register_cubit.dart';
import 'package:improw/data/cubits/tap/tap_cubit.dart';
import 'package:improw/firebase_options.dart';
import 'package:improw/viuw/home/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Improv());
}

class Improv extends StatelessWidget {
  const Improv({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TapCubit(),
        ),
        BlocProvider(
          create: (context) => KkalTapCubit(),
        ),
        BlocProvider(
          create: (context) => KkalCubit(),
        ),
        BlocProvider(
          create: (context) => SaveKkalCubit(),
        ),
        BlocProvider(
          create: (context) => ImageCubit(),
        ),
        BlocProvider(
          create: (context) => ClickCubit(),
        ),
        BlocProvider(
          create: (context) => BodyQuizCubit(),
        ),
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
