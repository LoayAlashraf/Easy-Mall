import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shoping_3rd_try/Network/local/cache_helper.dart';
import 'package:online_shoping_3rd_try/componants/components.dart';
import 'package:online_shoping_3rd_try/layout/ShopLayout.dart';
import '../regester_screen/regester_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ShopLoginScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ShopLoginCubit() ,
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>
        (
          listener: (context, state)
          {
            if(state is ShopLoginSuccessState)
            {
              if(state.LoginModel.status!)
              {
                print(state.LoginModel.message);
                print(state.LoginModel.data!.token);
                showToast(
                    text: '${state.LoginModel.message}',
                    state: ToastStates.SUCCESS
                );
                CacheHelper.saveData(key: 'token', value: state.LoginModel.data?.token);
                navigateAndFinish(context, ShopLayout() );
              }
              else
                {
                  print(state.LoginModel.message);
                  showToast(
                      text: '${state.LoginModel.message}',
                      state: ToastStates.ERROR
                  );
                }
            }
          },
          builder: (context, state)
          {
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('LOGIN',
                            style: TextStyle(
                              fontSize: 30.0,
                            ),
                          ),
                          Text('Login Now to browes our hot offers',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          defaultFormField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              label: 'Email Address',
                              prefix: Icons.email,
                              validate: (value){
                                if(value!.isEmpty){
                                  return'Please Inter your Email Adress ';
                                }
                                return null;
                              }

                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          defaultFormField(
                              controller: passwordController,
                              type: TextInputType.emailAddress,
                              label: 'Password',
                              suffix:  ShopLoginCubit.get(context).suffix,
                              isPassword:  ShopLoginCubit.get(context).isPassword,
                              suffixPressed: ()
                              {
                                ShopLoginCubit.get(context).changePassowrdVisibility();
                              },
                              onSubmit: (value)
                              {
                                if (formkey.currentState!.validate())
                                {
                                  ShopLoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text
                                  );
                                }
                              },
                              prefix: Icons.lock_outline,
                              validate: (value){
                                if(value == null || value.isEmpty){
                                  return'Password is too short  ';
                                }
                                return null;
                              }

                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                           ConditionalBuilderRec(
                             condition: state is! ShopLoginLoadingState,
                             builder: (BuildContext context) =>defaultButton(
                               function: ()
                               {
                                 if (formkey.currentState!.validate())
                                 {
                                   ShopLoginCubit.get(context).userLogin(
                                       email: emailController.text,
                                       password: passwordController.text
                                   );
                                 }

                               },
                               text: 'Login',
                               isUpperCase: true,),
                             fallback: (BuildContext context) => Center(child: CircularProgressIndicator()),

                           ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              Text('Don\'t have an account'),
                              defaultTextButton(
                                  function: ()
                                  {
                                    navigateTo(context, ShopRegisterScreen());
                                  },
                                  text: 'regist now')
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } ,
      ),
      );
  }
}
