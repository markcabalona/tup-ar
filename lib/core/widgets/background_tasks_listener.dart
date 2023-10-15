import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tup_ar/core/constants/grid_constants.dart';
import 'package:tup_ar/core/constants/padding_constants.dart';
import 'package:tup_ar/core/constants/spacer_constants.dart';
import 'package:tup_ar/core/cubits/background_tasks_cubit.dart';

class BackgroundTasksListener extends StatelessWidget {
  final Widget child;
  const BackgroundTasksListener({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BackgroundTasksCubit, BackgroundTasksState>(
      builder: (context, state) {
        return Material(
          child: Stack(
            alignment: Alignment.center,
            children: [
              child,
              if (state is BackgroundTaskLoading) ...[
                ModalBarrier(
                  color: Colors.black.withOpacity(.5),
                ),
                _LoadingWidget(loading: state),
              ] else if (state is BackgroundTaskSuccess)
                _SuccessWidget(success: state)
              else if (state is BackgroundTaskFailed)
                _ErrorWidget(failure: state),
            ],
          ),
        );
      },
    );
  }
}

class _BackgroundTaskStateDialog extends StatelessWidget {
  const _BackgroundTaskStateDialog({
    Key? key,
    required this.child,
    this.message,
  }) : super(key: key);
  final Widget child;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: PaddingConstants.largeAll,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            child,
            if (message != null) ...[
              SpacerConstants.mediumVertical,
              Text(
                message!,
                style: const TextStyle(
                  fontSize: GridConstants.medium,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  final BackgroundTaskLoading loading;
  const _LoadingWidget({
    Key? key,
    required this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BackgroundTaskStateDialog(
      message: loading.loadingMessage,
      child: const CircularProgressIndicator(),
    );
  }
}

class _SuccessWidget extends StatelessWidget {
  final BackgroundTaskSuccess success;
  const _SuccessWidget({
    Key? key,
    required this.success,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BackgroundTaskStateDialog(
      message: success.successMessage,
      child: const Icon(
        Icons.check_circle_outline_rounded,
        size: GridConstants.x2Large,
        color: Color(0xff4BB543),
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final BackgroundTaskFailed failure;
  const _ErrorWidget({
    Key? key,
    required this.failure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BackgroundTaskStateDialog(
      message: failure.errorMessage,
      child: const Icon(
        Icons.error,
        size: GridConstants.x2Large,
        color: Color(0xffD33C51),
      ),
    );
  }
}
