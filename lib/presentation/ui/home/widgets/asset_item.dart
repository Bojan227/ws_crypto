import 'package:crypto_app/core/theme/theme.dart';
import 'package:crypto_app/domain/entities/asset_entity.dart';
import 'package:crypto_app/presentation/blocs/price/cubit/price_tracker_cubit.dart';
import 'package:crypto_app/presentation/blocs/price/price_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetItem extends StatelessWidget {
  final Asset asset;

  const AssetItem({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsExtension>()!;

    return BlocConsumer<PriceBloc, PriceState>(
      listener: (context, state) {},
      listenWhen: (previous, current) {
        if (current.status == Status.loaded) {
          if (previous.price.price < current.price.price) {
            context.read<PriceTrackerCubit>().updatePriceTracker(false);
          } else {
            context.read<PriceTrackerCubit>().updatePriceTracker(true);
          }
        }

        return true;
      },
      builder: (context, state) {
        final hasDropped = context.watch<PriceTrackerCubit>().state.hasDropped;
        final hasChanged = context.watch<PriceTrackerCubit>().state.hasChanged;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 50),
          color: hasChanged
              ? hasDropped
                  ? colors.error
                  : colors.onPrimary
              : colors.primary,
          child: ListTile(
            leading: Text(
              asset.symbol,
              style: const TextStyle()
                  .copyWith(color: colors.onSecondary, fontSize: 14),
              textAlign: TextAlign.end,
            ),
            title: Text(asset.symbol,
                style: const TextStyle()
                    .copyWith(color: colors.onSecondary, fontSize: 14)),
            subtitle: Text(asset.name,
                style: const TextStyle()
                    .copyWith(color: colors.onSecondary, fontSize: 12)),
            trailing: FittedBox(
              child: Text(
                  state.status == Status.initial ||
                          state.status == Status.loading
                      ? "\$${asset.priceUsd}"
                      : state.status == Status.loaded
                          ? "\$${state.price.price}"
                          : "Failed to load price",
                  style: const TextStyle().copyWith(
                      color: colors.onSecondary,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        );
      },
    );
  }
}
