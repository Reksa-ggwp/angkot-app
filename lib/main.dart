import 'package:flutter/material.dart';
import 'package:trufi/custom_async_executor.dart';
import 'package:trufi/local_poi_layer/static_layer.dart';
import 'package:trufi/blocs/map_configuration/map_configuration_cubit.dart';
import 'package:trufi/blocs/map_tile_provider/map_tile_provider.dart';
import 'package:trufi/models/trufi_latlng.dart';
import 'package:trufi/utils/certificates_letsencrypt_android.dart';
import 'package:trufi/utils/graphql_client/hive_init.dart';
import 'package:trufi/utils/trufi_app_id.dart';
import 'package:trufi/widgets/drawer/menu/social_media_item.dart';
import 'package:trufi/widgets/screen/lifecycle_reactor_notification.dart';
import 'package:trufi/trufi_core.dart';
import 'package:trufi/trufi_router.dart';

import 'default_values.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CertificatedLetsencryptAndroid.workAroundCertificated();
  await initHiveForFlutter();
  await TrufiAppId.initialize();
  runApp(
    TrufiApp(
      appNameTitle: 'ReksaUSU',
      trufiLocalization: DefaultValues.trufiLocalization(
        currentLocale: const Locale("es"),
      ),
      blocProviders: [
        ...DefaultValues.blocProviders(
          otpEndpoint: "https://medan.trufi.dev/otp",
          otpGraphqlEndpoint: "https://medan.trufi.dev/otp/index/graphql",
          mapConfiguration: MapConfiguration(
            center: const TrufiLatLng(3.594582, 98.672618),
          ),
          searchAssetPath: "assets/data/search.json",
          photonUrl: "https://medan.trufi.dev/photon",
          mapTileProviders: [
            OSMMapLayer(
              mapTilesUrl:
                  "https://medan.trufi.dev/static-maps/trufi-liberty/{z}/{x}/{y}@2x.jpg",
            ),
          ],
          layersContainer: customLayersTrufi,
        ),
      ],
      trufiRouter: TrufiRouter(
        routerDelegate: DefaultValues.routerDelegate(
          appName: 'ReksaIlkom',
          cityName: 'Medan',
          countryName: 'Indonesia',
          backgroundImageBuilder: (_) {
            return Image.asset(
              'assets/images/drawer-bg.jpg',
              fit: BoxFit.cover,
            );
          },
          urlWhatsapp: 'https://wa.me/message/SXGYZP66KWYSO1',
          emailContact: 'feedback@trufi.app',
          urlShareApp: 'https://www.trufi.app/',
          urlSocialMedia: const UrlSocialMedia(
            urlFacebook: 'https://www.facebook.com/trufiapp/',
            urlInstagram: 'https://www.instagram.com/trufi.app',
          ),
          asyncExecutor: customAsyncExecutor,
          shareBaseUri: Uri(
            scheme: "https",
            host: "medan.trufi.dev",
          ),
          lifecycleReactorHandler: LifecycleReactorNotifications(
            url:
                'https://medan.trufi.dev/static_files/notification.json',
          ),
        ),
      ),
    ),
  );
}