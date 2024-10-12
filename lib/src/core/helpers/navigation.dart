import 'package:flutter/material.dart';

push(BuildContext context, page) {
  Navigator.push(
    context,
     createRoute(page)
     
  );
}


pushSlide(BuildContext context, page) {
  Navigator.push(
    context,
     slideTransitionRoute(page)
     
  );
}

pushAndReplace(BuildContext context, page) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => page,
    ),
  );
}


pushAndRemoveUntil(BuildContext context, page) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (_) => page,
    ),
    (_) => false,
  );
}

pop(BuildContext context){
  Navigator.pop(context);
}


Route createRoute( route) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => route  ,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // const begin = Offset(0.0, 1.0);
      // const end = Offset.zero;
      // const curve = Curves.ease;

      // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return FadeTransition(
        opacity: animation,
      //  position: animation.drive(tween),
        child: child,
      );
    },
  );
}

// Route createSlideRoute( route) {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => route  ,
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       // const begin = Offset(0.0, 1.0);
//       // const end = Offset.zero;
//       // const curve = Curves.ease;

//       // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//       return SlideTransition(
//         position: ,
//         opacity: animation,
//       //  position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }


slideTransitionRoute(Widget page){
return PageRouteBuilder(
    opaque: true,
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (BuildContext context, _, __) {
      return page;
    },
    transitionsBuilder: (_, Animation<double> animation, __, Widget child) {

      return new SlideTransition(
      child: child,
        position: new Tween<Offset>(
          begin: const Offset(1, 1),
          end: Offset.zero,
        ).animate(animation),
      );
    }
);
}
