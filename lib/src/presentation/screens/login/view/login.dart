import 'package:adhoc/exports_main.dart';
import 'package:adhoc/src/core/constants/app_images.dart';
import 'package:adhoc/src/presentation/screens/login/bloc/login_bloc.dart';
import 'package:adhoc/src/presentation/screens/login/view/login_form.dart';
import 'package:adhoc/src/presentation/widgets/app_space_widget.dart';
import 'package:adhoc/src/presentation/widgets/custom_button.dart';
import 'package:adhoc/src/presentation/widgets/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // // password
    // final displayErrorPassword = context.select(
    //   (LoginBloc bloc) => bloc.state.password.displayError,
    // );
    // // username
    // final displayErrorUsername = context.select(
    //   (LoginBloc bloc) => bloc.state.username.displayError,
    // );
    // // sucess / failure
    // final isInProgressOrSuccess = context.select(
    //   (LoginBloc bloc) => bloc.state.status.isInProgressOrSuccess,
    // );

    // // validation

    // final isValid = context.select((LoginBloc bloc) => bloc.state.isValid);

    return 
    // Scaffold(
    //   body: Padding(
    //     padding: const EdgeInsets.all(12),
    //     child: const LoginForm(),
    //   ),
    // );
    Scaffold(
      body: CustomScrollView(
        slivers: [
          // const SliverAppBar(
          //   title: Text('Login'),
          // ),
          //  SliverFillRemaining()
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.logo,
                  height: 300,
                ),
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        CustomTextfield(
                          // errorText: displayErrorUsername != null
                          //     ? 'invalid username'
                          //     : null,
                          key: const Key('loginForm_usernameInput_textField'),
                          height: 45,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.primary,
                          ),
                          name: "Username",
                          controller: TextEditingController(),
                          onChanged: (username) {
                            context
                                .read<LoginBloc>()
                                .add(LoginUsernameChanged(username));
                          },
                        ),
                        setHeight(10),
                        CustomTextfield(
                          // errorText: displayErrorPassword != null
                          //     ? 'invalid password'
                          //     : null,
                          key: const Key('loginForm_passwordInput_textField'),
                          height: 45,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.primary,
                          ),
                          controller: TextEditingController(),
                          name: "Password",
                          onChanged: (password) {
                            context
                                .read<LoginBloc>()
                                .add(LoginPasswordChanged(password));
                          },
                        ),
                        setHeight(20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text('Authentication Failure'),
                ),
              );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomButton(
            key: const Key('loginForm_continue_raisedButton'),
            label: "Login",
            borderRadius: BorderRadius.circular(10),
            onPressed: (){
              navigator?.pushNamed(RouteName.home);
            }
                   
                
          ),
        ),
      ),
    );
  }
}
