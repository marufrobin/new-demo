import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/services/file_uploading_downloading_service.dart';
import '../../../model/user_legal_document.model.dart';
import '../data/repository/documents.repository.dart';

part 'documents_event.dart';
part 'documents_state.dart';

class DocumentsBloc extends Bloc<DocumentsEvent, DocumentsState> {
  final DocumentsRepository documentsRepository;

  DocumentsBloc(this.documentsRepository) : super(DocumentsInitial()) {
    on<DocumentsFetchEvent>(_onFetch);
    on<DocumentsUploadEvent>(_onUpload);
  }

  _onFetch(DocumentsFetchEvent event, Emitter<DocumentsState> emit) async {
    try {
      emit(DocumentsLoading());

      final documents = await documentsRepository.getDocuments();

      emit(DocumentsData(documents: documents));
    } catch (e) {
      emit(DocumentsError(errorMessage: e.toString()));
    }
  }

  _onUpload(DocumentsUploadEvent event, Emitter<DocumentsState> emit) async {
    try {
      String? existingDrivingLicenseKey;
      String? existingVehiclePictureKey;
      String? existingNidPictureKey;
      if (state is DocumentsData) {
        final currentData = state as DocumentsData;
        existingDrivingLicenseKey = currentData.documents?.license?.key;
        existingVehiclePictureKey = currentData.documents?.vehiclePhoto?.key;
        existingNidPictureKey = currentData.documents?.nidPhoto?.key;
      }
      emit(DocumentsLoading());
      String? driverLicenseKey;
      String? vehiclePictureKey;
      String? nidPictureKey;

      if (event.drivingLicense != null) {
        await AppFileUploadAndDownloadService.uploadFile(
          filePath: event.drivingLicense!,
          onProgress: (value) => log(name: "Progress", value.toString()),
          onUploadComplete: (isComplete, {key}) {
            if (isComplete) driverLicenseKey = key;
          },
        );
      }
      if (event.vehiclePicture != null) {
        await AppFileUploadAndDownloadService.uploadFile(
          filePath: event.vehiclePicture!,
          onProgress: (value) => log(name: "Progress", value.toString()),
          onUploadComplete: (isComplete, {key}) {
            if (isComplete) vehiclePictureKey = key;
          },
        );
      }
      if (event.nidPicture != null) {
        await AppFileUploadAndDownloadService.uploadFile(
          filePath: event.nidPicture!,
          onProgress: (value) => log(name: "Progress nid", value.toString()),
          onUploadComplete: (isComplete, {key}) {
            if (isComplete) nidPictureKey = key;
          },
        );
      }
      final driver = driverLicenseKey ?? existingDrivingLicenseKey;
      final vehicle = vehiclePictureKey ?? existingVehiclePictureKey;
      final nid = nidPictureKey ?? existingNidPictureKey;
      log(name: "Drivers before upload", driver.toString());
      log(name: "Vehicles", vehicle.toString());
      log(name: "Nids", nid.toString());
      log(
        "------------------------------------------------------------------------------",
      );
      final documents = await documentsRepository.uploadDocuments(
        drivingLicense: driver,
        vehiclePicture: vehicle,
        nidPicture: nid,
      );

      emit(DocumentsUploadSuccess(isUploaded: documents));
      // add(DocumentsFetchEvent());
    } catch (e) {
      emit(DocumentsError(errorMessage: e.toString()));
    }
  }
}
