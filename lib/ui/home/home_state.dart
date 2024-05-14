import 'package:equatable/equatable.dart';

class HomeState extends Equatable{

  final double containerOpacity;
  final double bottomPadding;

  const HomeState({
    this.containerOpacity = 1.0,
    this.bottomPadding = 800.0
  });

  @override
  List<Object?> get props => [containerOpacity, bottomPadding,];

  HomeState copyWith({
    double? containerOpacity,
    double? bottomPadding
  }){
    return HomeState(
      containerOpacity: containerOpacity ?? this.containerOpacity,
      bottomPadding: bottomPadding ?? this.bottomPadding,
    );
  }

}