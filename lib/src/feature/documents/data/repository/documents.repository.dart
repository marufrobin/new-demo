import 'dart:developer';

import 'package:rider/src/feature/documents/data/data_provider/documents_data.provider.dart';
import 'package:rider/src/model/user_legal_document.model.dart';

class DocumentsRepository {
  DocumentsDataProvider documentsDataProvider;

  DocumentsRepository(this.documentsDataProvider);

  Future<UserLegalDocumentModel?> getDocuments() async {
    try {
      final result = await documentsDataProvider.getDocuments();
      if (result?.hasException ?? false) {
        throw result?.exception ?? Exception("Something went wrong");
      }
      final data = UserLegalDocumentModel.fromJson(
        result?.data?["me"]["documents"],
      );
      log(name: "Documents", data.toJson().toString());
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool?> uploadDocuments({
    String? drivingLicense,
    String? vehiclePicture,
    String? nidPicture,
  }) async {
    try {
      final result = await documentsDataProvider.uploadDocuments(
        drivingLicense: drivingLicense,
        vehiclePicture: vehiclePicture,
        nidPicture: nidPicture,
      );
      if (result?.hasException ?? false) {
        throw result?.exception ?? Exception("Something went wrong");
      }
      return result?.data?["updateMe"];
    } catch (e) {
      rethrow;
    }
  }
}
