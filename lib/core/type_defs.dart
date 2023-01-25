import 'package:api_with_riverpod/core/failure.dart';
import 'package:fpdart/fpdart.dart';

//t vaneko generic type ho as we know
typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;
