import 'package:trufi/models/enums/transport_mode.dart';
import 'package:trufi/models/journey_plan/plan.dart';
import 'package:trufi/models/trufi_place.dart';

abstract class RequestPlanService {
  Future<Plan> fetchAdvancedPlan({
    required TrufiLocation from,
    required TrufiLocation to,
    required List<TransportMode> transportModes,
    String? localeName,
  });
}
