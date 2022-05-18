import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../bloc/auth/login_page/login_page_cubit.dart';
import '../../di/injection_container.dart';
import '../../l10n/clean_digital_localizations.dart';
import '../../router/clean_digital_router.dart';
import '../../utils/clean_digital_toasts.dart';
import '../../utils/validators.dart';
import '../../views/buttons/primary_button.dart';
import '../../views/rounded_container.dart';

enum _LoginFields { email, password }

class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<LoginPageCubit>(),
      child: this,
    );
  }
}

class _LoginPageState extends State<LoginPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  LoginPageCubit get cubit => context.read();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  void _onStateChanged(
    BuildContext context,
    LoginPageState state,
  ) {
    switch (state.status) {
      case LoginPageStatus.error:
        CleanDigitalToasts.of(context).showError(
          message: state.errorMessage,
        );
        break;
      case LoginPageStatus.successAdmin:
        router.replaceAdminMainPage();
        break;
      case LoginPageStatus.successEmployee:
        router.replaceEmployeeMainPage();
        break;
      case LoginPageStatus.successLaundry:
        router.replaceLaundryMainPage();
        break;
      case LoginPageStatus.successRepairCompany:
        router.replaceRepairCompanyMainPage();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: BlocConsumer<LoginPageCubit, LoginPageState>(
        listener: _onStateChanged,
        builder: (context, state) {
          return Center(
            child: RoundedContainer(
              child: FormBuilder(
                key: _fbKey,
                onChanged: _fbState?.save,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildEmailField(),
                    const SizedBox(height: 16),
                    _buildPasswordField(state),
                    const SizedBox(height: 64),
                    _buildLoginButton(state),
                    const SizedBox(height: 16),
                    _buildForgetPasswordButton(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmailField() {
    return FormBuilderTextField(
      name: _LoginFields.email.name,
      decoration: InputDecoration(
        prefixIcon: const Icon(Typicons.mail),
        labelText: CleanDigitalLocalizations.of(context).email,
      ),
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(
            context,
            errorText: CleanDigitalLocalizations.of(context).requiredField,
          ),
          FormBuilderValidators.email(
            context,
            errorText: CleanDigitalLocalizations.of(context).emailIsNotValid,
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField(LoginPageState state) {
    return FormBuilderTextField(
      name: _LoginFields.password.name,
      obscureText: state.obscureText,
      validator: passwordValidator(context),
      decoration: InputDecoration(
        prefixIcon: const Icon(Typicons.key_outline),
        labelText: CleanDigitalLocalizations.of(context).password,
        suffixIcon: IconButton(
          icon: Icon(
            state.obscureText ? FontAwesome5.eye_slash : FontAwesome5.eye,
          ),
          onPressed: cubit.changeObscureText,
        ),
      ),
    );
  }

  Widget _buildLoginButton(LoginPageState state) {
    return PrimaryButton(
      title: CleanDigitalLocalizations.of(context).login,
      isLoading: state.status == LoginPageStatus.loading,
      onPressed: () {
        if (_fbState?.saveAndValidate() ?? false) {
          cubit.login(
            _fbValue[_LoginFields.email.name],
            _fbValue[_LoginFields.password.name],
          );
        }
      },
    );
  }

  Widget _buildForgetPasswordButton() {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: router.pushRestorePasswordPage,
        child: Text(
          CleanDigitalLocalizations.of(context).forgetPassword,
        ),
      ),
    );
  }
}
