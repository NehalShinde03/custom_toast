import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/ui/home/home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit(super.initialState);

  changePositioned({required double position}){
    emit(state.copyWith(bottomPadding: position));
  }

}

/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
           /* if (state.bottomPadding == 540.0) {
              Future.delayed(const Duration(seconds: 13), () {
                cubit.changePositioned(position: 700.0);
              });
            }*/

          return Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: FloatingActionButton(
                  onPressed: state.bottomPadding == 540
                    ? (){}
                    : () {
                        cubit.changePositioned(
                            position: state.bottomPadding == 700.0 ? 540.0 : 700.0,
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
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                          colors: [Color(0xff181818), Color(0xff464343)],
                      ),
                    ),
                    child: Stack(
                      children: [

                        Positioned(
                          top: MediaQuery.of(context).size.height/80,
                          left: MediaQuery.of(context).size.width/20,
                          child: Image.asset(
                            "assets/starbuck.png",
                            scale: 3,
                            fit: BoxFit.fill,
                            colorBlendMode: BlendMode.darken,
                          ),
                        ),

                        Positioned(
                          top: MediaQuery.of(context).size.height/40,
                          left: MediaQuery.of(context).size.width/5,
                          // top: 20.0,
                          // left: 70.0,
                          child: Row(
                            children: [
                              const Text(
                                "Coffee with Music",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Pacifico",
                                    fontSize: 20
                                ),
                              ),
                              const Gap(10.0),
                              Image.asset(
                                "assets/headphones.png",
                                scale: 10.0,
                              )
                            ],
                          ),
                        ),

                        Positioned(
                          top: MediaQuery.of(context).size.height/9,
                          left: MediaQuery.of(context).size.width/2,
                          // top: 81.0,
                          // left: 180,
                          child: const Text(
                            "Powered By Starbucks®",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 7.0
                            ),
                          ),
                        )

                      ],
                    ),
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

// colors: [Color(0xffF54EA2), Color(0xffFF7676)]
// colors: [Color(0xff42E695), Color(0xff3BB2B8)]
// colors: [Color(0xff17EAD9), Color(0xff6078EA)]

/*Image.asset(
                                  "assets/winner.png",
                                  scale: 9.0,
                                  fit: BoxFit.fill,
                                  colorBlendMode: BlendMode.darken,
                              ),*/*/



/*Scaffold(
      body: SafeArea(child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          print("size ===> ${state.bottomPadding}");
           /* if (state.bottomPadding == 540.0) {
              Future.delayed(const Duration(seconds: 13), () {
                cubit.changePositioned(position: 700.0);
              });
            }*/

          return Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: FloatingActionButton(
                  onPressed: state.bottomPadding == 540
                    ? (){}
                    : () {
                        cubit.changePositioned(
                            position: state.bottomPadding == 700.0 ? 540.0 : 700.0,
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
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                          colors: [Color(0xff181818), Color(0xff464343)],
                      ),
                    ),
                    child: Stack(
                      children: [

                        Positioned(
                          top: MediaQuery.of(context).size.height/80,
                          left: MediaQuery.of(context).size.width/30,
                          child: Image.asset(
                            "assets/starbuck.png",
                            scale: 3,
                            fit: BoxFit.fill,
                            colorBlendMode: BlendMode.darken,
                          ),
                        ),

                        Positioned(
                          top: MediaQuery.of(context).size.height/40,
                          left: MediaQuery.of(context).size.width/5,
                          // top: 20.0,
                          // left: 70.0,
                          child: Row(
                            children: [
                              Text(
                                "Coffee with Music",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Pacifico",
                                    fontSize: MediaQuery.of(context).size.width/20
                                ),
                              ),
                              const Gap(10.0),
                              Image.asset(
                                "assets/headphones.png",
                                scale: MediaQuery.of(context).size.width/40,
                              )
                            ],
                          ),
                        ),


                        Positioned(
                          top: MediaQuery.of(context).size.height/9,
                          left: MediaQuery.of(context).size.width/2.1,
                          // top: 81.0,
                          // left: 180,
                          child: const Text(
                            "Powered By Starbucks®",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 7.0
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      )),
    );*/