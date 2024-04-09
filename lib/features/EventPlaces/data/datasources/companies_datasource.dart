import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tup_ar/core/constants/error_message_constants.dart';
import 'package:tup_ar/core/errors/exception.dart';
import 'package:tup_ar/features/EventPlaces/data/models/company_details_model.dart';

class CompaniesDatasource {
  final FirebaseFirestore firestore;
  const CompaniesDatasource({
    required this.firestore,
  });
  Future<CompanyDetailsModel> fetchCompanyDetails({
    required String companySlug,
  }) async {
    try {
      final querySnapshot = await firestore
          .collection('companies')
          .where('company_slug', isEqualTo: companySlug)
          .get();

      final queryDocSnapshot = querySnapshot.docs.firstOrNull;

      if (queryDocSnapshot == null) {
        throw const EventsPlacesException(
          message: ErrorMessageConstants.serverError,
        );
      }

      return CompanyDetailsModel.fromMap({
        ...queryDocSnapshot.data(),
        'id': queryDocSnapshot.id,
      });
    } catch (e) {
      log(e.toString());
      throw const EventsPlacesException(
        message: ErrorMessageConstants.serverError,
      );
    }
  }
}
