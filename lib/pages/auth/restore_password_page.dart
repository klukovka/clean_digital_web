import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../bloc/auth/restore_password_page/restore_password_page_cubit.dart';
import '../../di/injection_container.dart';
import '../../l10n/clean_digital_localizations.dart';
import '../../router/clean_digital_router.dart';
import '../../utils/clean_digital_toasts.dart';
import '../../views/buttons/primary_button.dart';
import '../../views/rounded_container.dart';

enum _RestorePasswordFields { email }

class RestorePasswordPage extends StatefulWidget implements AutoRouteWrapper {
  const RestorePasswordPage({Key? key}) : super(key: key);

  @override
  State<RestorePasswordPage> createState() => _RestorePasswordPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<RestorePasswordPageCubit>(),
      child: this,
    );
  }
}

class _RestorePasswordPageState extends State<RestorePasswordPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  RestorePasswordPageCubit get cubit => context.read();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  void _onStateChanged(
    BuildContext context,
    RestorePasswordPageState state,
  ) {
    switch (state.status) {
      case RestorePasswordPageStatus.error:
        CleanDigitalToasts.of(context).showError(
          message: state.errorMessage,
        );
        break;
      case RestorePasswordPageStatus.success:
        CleanDigitalToasts.of(context).showSuccess(
          message: CleanDigitalLocalizations.of(context).checkYourEmail,
        );
        router.pop();
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
      body: BlocConsumer<RestorePasswordPageCubit, RestorePasswordPageState>(
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
                    const SizedBox(height: 64),
                    _buildRestoreButton(state),
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
      name: _RestorePasswordFields.email.name,
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

  Widget _buildRestoreButton(RestorePasswordPageState state) {
    return PrimaryButton(
      title: CleanDigitalLocalizations.of(context).restorePassword,
      isLoading: state.status == RestorePasswordPageStatus.loading,
      onPressed: () {
        if (_fbState?.saveAndValidate() ?? false) {
          cubit.restore(
            _fbValue[_RestorePasswordFields.email.name],
          );
        }
      },
    );
  }
}
