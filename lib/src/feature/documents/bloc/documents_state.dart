part of 'documents_bloc.dart';

sealed class DocumentsState extends Equatable {
  const DocumentsState();

  @override
  List<Object?> get props => [];
}

final class DocumentsInitial extends DocumentsState {}

final class DocumentsLoading extends DocumentsState {}

final class DocumentsData extends DocumentsState {
  const DocumentsData({required this.documents});

  final UserLegalDocumentModel? documents;

  @override
  List<Object?> get props => [documents];
}

final class DocumentsUploadSuccess extends DocumentsState {
  final bool? isUploaded;

  const DocumentsUploadSuccess({this.isUploaded});

  @override
  List<Object?> get props => [isUploaded];
}

final class DocumentsError extends DocumentsState {
  const DocumentsError({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
