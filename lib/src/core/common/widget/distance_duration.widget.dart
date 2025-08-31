import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../feature/jobs/bloc/distance_duration/distance_duration_bloc.dart';
import '../../utils/distance_calculate.dart';

class DistanceDurationWidget extends StatefulWidget {
  const DistanceDurationWidget({
    super.key,
    required this.isPickUp,
    this.userCurrentLocation,
    this.destinationLocation,
  });

  /// Set the [isPickUp] to true if the job is pick up
  /// Set the [isPickUp] to false if the job is drop off
  final bool isPickUp;

  final LatLng? userCurrentLocation;
  final LatLng? destinationLocation;

  @override
  State<DistanceDurationWidget> createState() => _DistanceDurationWidgetState();
}

class _DistanceDurationWidgetState extends State<DistanceDurationWidget> {
  @override
  void initState() {
    context.read<DistanceDurationBloc>().add(
      DistanceDurationFetchEvent(
        destinationLocation: widget.destinationLocation,
        originLocation: widget.userCurrentLocation,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocBuilder<DistanceDurationBloc, DistanceDurationState>(
      builder: (context, state) {
        if (state is DistanceDurationLoaded) {
          return _body(
            theme: theme,
            distanceDuration: state.distanceDurationModel?.duration?.text,
            distance: state.distanceDurationModel?.distance?.text,
          );
        } else if (state is DistanceDurationError) {
          return InkWell(
            onTap: () {
              context.read<DistanceDurationBloc>().add(
                DistanceDurationFetchEvent(
                  destinationLocation: widget.destinationLocation,
                  originLocation: widget.userCurrentLocation,
                ),
              );
            },
            child: Text(
              "retry",
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          );
        } else {
          return _body(theme: theme);
        }
      },
    );
  }

  ListTile _body({
    required ThemeData theme,
    String? distanceDuration,
    String? distance,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      dense: true,
      onTap: () {
        context.read<DistanceDurationBloc>().add(
          DistanceDurationFetchEvent(
            destinationLocation: widget.destinationLocation,
            originLocation: widget.userCurrentLocation,
          ),
        );
      },
      leading: Icon(Icons.access_time, color: theme.colorScheme.onSurface),
      title: Text(distanceDuration ?? "", style: theme.textTheme.titleSmall),
      subtitle: Text(
        widget.isPickUp ? "To your pick up point" : "To your drop off point",
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
      trailing: Text(
        distance ??
            "${calculateDistance(lat1: widget.userCurrentLocation?.latitude ?? 0, lon1: widget.userCurrentLocation?.longitude ?? 0, lat2: widget.destinationLocation?.latitude ?? 0, lon2: widget.destinationLocation?.longitude ?? 0).toStringAsFixed(2)} km",
        style: theme.textTheme.bodySmall,
      ),
    );
  }
}
