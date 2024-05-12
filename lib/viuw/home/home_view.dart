import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:improw/data/cubits/tap/tap_cubit.dart';
import 'package:improw/viuw/kkals/kkal_view.dart';
import 'package:improw/viuw/kkals/save_view.dart';
import 'package:improw/widgets/components/string-class.dart';
import 'package:improw/widgets/more.dart';
import 'package:improw/widgets/sub_home/avarage/muscle_avarge.dart';
import 'package:improw/widgets/sub_home/beginner/beginer/muscle_begimmer.dart';
import 'package:improw/widgets/sub_home/experiente/muscle_experienced.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> subHome = [
    const MuscleBeginnerPage(),
    const MuscleAveragePage(),
    const MuscleExperiencePage()
  ];
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final string = StringClass();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Improvement',
                      style: GoogleFonts.teko(
                          textStyle: TextStyle(
                              color: Colors.white70, fontSize: h * 0.06)),
                    ),
                  ),
                ],
              ),
              Container(
                height: h * 0.3,
                width: w,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: FittedBox(
                    child: Text(
                      'Здесь главный план',
                      style: GoogleFonts.teko(
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: h * 0.06),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                    child: Text(
                      'These will help you',
                      style: GoogleFonts.teko(
                          textStyle: TextStyle(
                              color: Colors.white, fontSize: h * 0.035)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: SizedBox(
                  height: h * 0.09,
                  width: w,
                  child: ListView.builder(
                    itemCount: string.icon1.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const KkalView(),
                              ),
                            );
                          } else if (index == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SaveViuw(),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: h * 0.03,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: w * 0.21,
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: SizedBox(
                              height: h * 0.065,
                              width: h * 0.065,
                              child: Image.asset(
                                string.icon1[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                    child: Text(
                      'O  P  T  I  O  N  S',
                      style: GoogleFonts.teko(
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: h * 0.037),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: h * 0.30,
                width: w,
                child: const MorePage(),
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                    child: Text(
                      'Muscle training by fitness level',
                      style: GoogleFonts.teko(
                          textStyle: TextStyle(
                              color: Colors.white, fontSize: h * 0.035)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  height: h * 0.05,
                  width: w,
                  child: BlocBuilder<TapCubit, int>(
                    builder: (context, state) {
                      return ListView.builder(
                        itemCount: string.text5.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.read<TapCubit>().tapIndex(index);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 270),
                              height: h * 0.05,
                              width: w * 0.25,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  color: state == index
                                      ? Colors.white70
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(
                                      state == index ? 30 : 20)),
                              child: Center(
                                child: FittedBox(
                                  child: Text(
                                    string.text5[index],
                                    style: GoogleFonts.teko(
                                      textStyle: TextStyle(
                                          color: state == index
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: h * 0.025),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: SizedBox(
                  height: h * 0.32,
                  width: w,
                  child: BlocBuilder<TapCubit, int>(
                    builder: (context, current) {
                      if (current >= 0 && current < subHome.length) {
                        return subHome[current];
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
