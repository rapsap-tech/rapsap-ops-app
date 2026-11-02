import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/bloc/connectivity_cubit.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/widgets/app_error_view.dart';
import 'package:rapsap_ops_app/core/widgets/app_loader.dart';

/// Loading / error (with retry) / empty / data for a [LoadCubit]; retries by
/// itself when the connection comes back.
class LoadStateView<C extends LoadCubit<T>, T> extends StatelessWidget {
  const new({
    required this.builder,
    this.isEmpty,
    this.emptyMessage,
    super.key,
  });

  final Widget Function(BuildContext context, T data) builder;
  final bool Function(T data)? isEmpty;
  final String? emptyMessage;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityCubit, ConnectivityStatus>(
      listenWhen: (_, next) => next == ConnectivityStatus.online,
      listener: (context, _) => context.read<C>().onConnectionRestored(),
      child: BlocBuilder<C, LoadState<T>>(
        builder: (context, state) {
          final data = state.data;
          if (data != null) {
            final empty = isEmpty?.call(data) ?? false;
            return empty
                ? AppMessageView(
                    message: emptyMessage ?? context.l10n.listEmpty,
                    onRetry: context.read<C>().load,
                  )
                : builder(context, data);
          }
          if (state.status == LoadStatus.loading) {
            return const Center(child: AppLoader());
          }
          return AppMessageView(
            message:
                state.failure?.message(context.l10n) ??
                context.l10n.errorUnknown,
            onRetry: context.read<C>().load,
          );
        },
      ),
    );
  }
}
