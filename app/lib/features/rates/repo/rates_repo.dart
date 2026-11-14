import '../../../../core/errors/result.dart';
import '../data/models/rates_models.dart';

abstract class RatesRepo {
  Future<Result<RatesBundle>> load({required String quote});

  Future<Result<void>> backfill({required String quote, int days = 7});

  Future<Result<List<String>>> trackedQuotes();
}
