import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ProductFirebaseService {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
}

class ProductFirebaseServiceImpl implements ProductFirebaseService {
  @override
  Future<Either> getTopSelling() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('salesNumber', isGreaterThanOrEqualTo: 20)
          .get();

      return Right(returnedData.docs.map((e) => e.data()).toList());
    } on FirebaseException catch (e) {
      return Left(e.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> getNewIn() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('createdDate',
              isGreaterThanOrEqualTo: Timestamp.fromDate(DateTime(2024, 7, 25)))
          .get();

      return Right(returnedData.docs.map((e) => e.data()).toList());
    } on FirebaseException catch (e) {
      return Left(e.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
