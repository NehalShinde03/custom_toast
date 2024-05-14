import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:untitled/ui/home/home_cubit.dart';
import 'package:untitled/ui/home/home_state.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  static const String routeName = '/home_ui';

  static Widget builder(BuildContext context) => BlocProvider(
        create: (context) => HomeCubit(
          const HomeState(),
        ),
        child: const HomeUi(),
      );

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  HomeCubit get cubit => context.read<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          print("size ===> ${state.bottomPadding}");
            if (state.bottomPadding == 540.0) {
              Future.delayed(const Duration(seconds: 3), () {
                cubit.changePositioned(position: 800.0);
              });
            }

          return Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: FloatingActionButton(
                  onPressed: state.bottomPadding == 540
                    ? (){}
                    : () {
                        cubit.changePositioned(
                            position: state.bottomPadding == 800.0 ? 540.0 : 800.0,
                        );
                      },
                  child: const Icon(Icons.arrow_downward_outlined),
                ),
              ),

              AnimatedPositioned(
                top: state.bottomPadding,
                right: 0.0,
                left: 0.0,
                duration: const Duration(seconds: 2),
                curve: Curves.fastEaseInToSlowEaseOut,
                child: Card(
                  elevation: 20.0,
                  margin: EdgeInsetsDirectional.symmetric(
                          horizontal: MediaQuery.of(context).size.width/9,
                      ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    // width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height / 8,
                    padding: const EdgeInsetsDirectional.only(
                      start: 22.0,
                      end: 20.0,
                      top: 13.0
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                          colors: [Color(0xff181818), Color(0xff464343)],
                      ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Transform.scale(
                        scale: 1.5,
                        child: Image.asset(
                          "assets/starbuck.png",
                          fit: BoxFit.fill,
                          colorBlendMode: BlendMode.darken,
                        ),
                      ),

                      trailing: Padding(
                        padding: const EdgeInsetsDirectional.only(bottom: 20.0),
                        child: Image.asset(
                          "assets/headphones.png",
                          scale: 10.0,
                        ),
                      ),

                      title: const Text(
                        "Coffee with Music",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Pacifico",
                            fontSize: 17,
                        ),
                      ),

                      subtitle: const Padding(
                        padding: EdgeInsetsDirectional.only(
                            top: 25.0,
                        ),
                        child: Text(
                          "Powered By Starbucks®",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 7.0
                          ),
                        ),
                      ),
                    )
                  ),
                ),
              ),
            ],
          );
        },
      )),
    );
  }
}
