part of 'documents_bloc.dart';

sealed class DocumentsEvent extends Equatable {
  const DocumentsEvent();

  @override
  List<Object?> get props => [];
}

final class DocumentsFetchEvent extends DocumentsEvent {}

final class DocumentsUploadEvent extends DocumentsEvent {
  final String? drivingLicense;
  final String? vehiclePicture;
  final String? nidPicture;

  const DocumentsUploadEvent({
    this.drivingLicense,
    this.vehiclePicture,
    this.nidPicture,
  });

  @override
  List<Object?> get props => [drivingLicense, vehiclePicture, nidPicture];
}
