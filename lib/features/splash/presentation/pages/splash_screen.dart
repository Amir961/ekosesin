

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:fare/features/auth/pages/intro_screen.dart';
import 'package:fare/features/home/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/res/media_res.dart';
import '../../../../core/services/config.dart';

import '../../models.dart';



class SplashScreen extends StatefulWidget {
  static const routeName = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUpdateAndGoToOtherPage();
  }

  void checkUpdateAndGoToOtherPage() async {




   await Future.delayed(const Duration(seconds: 1));

    goToMain();
  }

  goToMain(){
    context.go( IntroScreen.routeName);
  // context.go( HomeScreen.routeName);

   // context.pushReplacement( AddDashboardScreen.routeName

  //  );
   // BlocProvider<HomeBloc>(
   //   create: (context) => sl<HomeBloc>(),
   // ),
   // Navigator.push(
   //   context,
   //   MaterialPageRoute(
   //     builder: (context) {
   //       return BlocProvider(
   //         create: (_) => sl<HomeBloc>(),
   //         child: const HomeScreen(session: null),
   //       );
   //     },
   //   ),
   // );


  }

  String transportQuery = """
  query Transport(\$status_ids: [String!]) {
    transport(status_ids: \$status_ids) {
      total
      per_page
      current_page
      from
      to
      last_page
      has_more_pages
      data {
        id
        code
        loading_weight
        unloading_weight
        receipt_method
        register_time
        prepaid_confirmation_time
        origin_document_confirmation_time
        lading_document_confirmation_time
        destination_document_confirmation_time
        paid_amount
        remain_amount
        gross_amount
        lading_amount
        description
        created_at
        updated_at
        has_tender_lading_announcement
        status {
          title
          code
          details
          id
        }
        announcement {
          destination {
            id
            title
            address
            lat
            lng
            tellphone
            postal_code
            code
            type
            details
          }
          first_origin {
            id
            title
            address
            lat
            lng
            tellphone
            postal_code
            code
            type
            details
          }
          loader {
            id
            title
            code
            details
            tonnage
          }
          goods_category {
            id
            title
            alias
            introtext
            fulltext
            icon
            is_active
            code
            details
          }
        }
      }
    }
  }
""";


  final String query =  r'''
query announcementRelease(
  $ids: [String], 
  $first_origin_id: String, 
  $last_origin_id: String, 
  $destination_id: String, 
  $origin_state_id: String, 
  $destination_state_id: String, 
  $license_release_ids: [String], 
  $vehicle_ids: [String], 
  $loader_ids: [String], 
  $goods_id: String, 
  $loading_from_date: String, 
  $min_loading_from_date: String, 
  $min_loading_from_date_equality: String, 
  $max_loading_from_date: String, 
  $max_loading_from_date_equality: String, 
  $loading_to_date: String, 
  $min_loading_to_date: String, 
  $min_loading_to_date_equality: String, 
  $max_loading_to_date: String, 
  $max_loading_to_date_equality: String, 
  $maximum_delivery_date: String, 
  $min_maximum_delivery_date: String, 
  $min_maximum_delivery_date_equality: String, 
  $max_maximum_delivery_date: String, 
  $max_maximum_delivery_date_equality: String, 
  $type: String, 
  $transport_type: String, 
  $release_type: String, 
  $is_offerable: String, 
  $status_id: String, 
  $code: String, 
  $sync_by: [String], 
  $page: Int, 
  $limit: Int, 
  $orderBy_field: String, 
  $orderBy_direction: String
) {
  announcementRelease(
    ids: $ids
    first_origin_id: $first_origin_id
    last_origin_id: $last_origin_id
    destination_id: $destination_id
    origin_state_id: $origin_state_id
    destination_state_id: $destination_state_id
    license_release_ids: $license_release_ids
    vehicle_ids: $vehicle_ids
    loader_ids: $loader_ids
    goods_id: $goods_id
    loading_from_date: $loading_from_date
    min_loading_from_date: $min_loading_from_date
    min_loading_from_date_equality: $min_loading_from_date_equality
    max_loading_from_date: $max_loading_from_date
    max_loading_from_date_equality: $max_loading_from_date_equality
    loading_to_date: $loading_to_date
    min_loading_to_date: $min_loading_to_date
    min_loading_to_date_equality: $min_loading_to_date_equality
    max_loading_to_date: $max_loading_to_date
    max_loading_to_date_equality: $max_loading_to_date_equality
    maximum_delivery_date: $maximum_delivery_date
    min_maximum_delivery_date: $min_maximum_delivery_date
    min_maximum_delivery_date_equality: $min_maximum_delivery_date_equality
    max_maximum_delivery_date: $max_maximum_delivery_date
    max_maximum_delivery_date_equality: $max_maximum_delivery_date_equality
    type: $type
    transport_type: $transport_type
    release_type: $release_type
    is_offerable: $is_offerable
    status_id: $status_id
    code: $code
    sync_by: $sync_by
    page: $page
    limit: $limit
    orderBy_field: $orderBy_field
    orderBy_direction: $orderBy_direction
  ) {
    data {
      id
      type
      value
      amount
      release_type
      is_offerable
      transport_method
      updated_at
      created_at
      loading_to_date
      loading_from_date
      maximum_delivery_date
      goods_package {
        title
      }
      goods_category {
        title
      }
      status {
        id
        title
      }
      creator {
        firstname
        lastname
      }
      cargo {
        title
      }
      company {
        title
      }
      reserves {
        id
      }
      financial {
        driver_tip
        driver_amount
        prepayment_amount
      }
      first_origin {
        title
        city {
          title
        }
      }
      destination {
        title
        city {
          title
        }
      }
      loader {
        vehicle_category {
          title
        }
        loader_category {
          title
        }
        media {
          full_url
        }
      }
      transports {
        id
      }
    }
    total
    last_page
  }
}
''';

   String announcementReleaseQuery = r'''
  query announcementRelease(
    $ids: [String],
    $first_origin_id: String,
    $last_origin_id: String,
    $destination_id: String,
    $license_release_ids: [String],
    $vehicle_ids: [String],
    $loader_ids: [String],
    $goods_id: String,
    $loading_from_date: String,
    $min_loading_from_date: String,
    $min_loading_from_date_equality: String,
    $max_loading_from_date: String,
    $max_loading_from_date_equality: String,
    $loading_to_date: String,
    $min_loading_to_date: String,
    $min_loading_to_date_equality: String,
    $max_loading_to_date: String,
    $max_loading_to_date_equality: String,
    $maximum_delivery_date: String,
    $min_maximum_delivery_date: String,
    $min_maximum_delivery_date_equality: String,
    $max_maximum_delivery_date: String,
    $max_maximum_delivery_date_equality: String,
    $type: String,
    $is_offerable: String,
    $status_id: String,
    $code: String,
    $sync_by: [String],
    $page: Int,
    $limit: Int,
    $orderBy_field: String,
    $orderBy_direction: String
  ) {
    announcementRelease(
      ids: $ids,
      first_origin_id: $first_origin_id,
      last_origin_id: $last_origin_id,
      destination_id: $destination_id,
      license_release_ids: $license_release_ids,
      vehicle_ids: $vehicle_ids,
      loader_ids: $loader_ids,
      goods_id: $goods_id,
      loading_from_date: $loading_from_date,
      min_loading_from_date: $min_loading_from_date,
      min_loading_from_date_equality: $min_loading_from_date_equality,
      max_loading_from_date: $max_loading_from_date,
      max_loading_from_date_equality: $max_loading_from_date_equality,
      loading_to_date: $loading_to_date,
      min_loading_to_date: $min_loading_to_date,
      min_loading_to_date_equality: $min_loading_to_date_equality,
      max_loading_to_date: $max_loading_to_date,
      max_loading_to_date_equality: $max_loading_to_date_equality,
      maximum_delivery_date: $maximum_delivery_date,
      min_maximum_delivery_date: $min_maximum_delivery_date,
      min_maximum_delivery_date_equality: $min_maximum_delivery_date_equality,
      max_maximum_delivery_date: $max_maximum_delivery_date,
      max_maximum_delivery_date_equality: $max_maximum_delivery_date_equality,
      type: $type,
      is_offerable: $is_offerable,
      status_id: $status_id,
      code: $code,
      sync_by: $sync_by,
      page: $page,
      limit: $limit,
      orderBy_field: $orderBy_field,
      orderBy_direction: $orderBy_direction
    ) {
      data {
        id
        type
        value
        amount
        is_traffic
        is_offerable
        release_type
        transport_method
        loading_from_date
        maximum_delivery_date
        loading_to_date
        loading_hour_from
        loading_hour_to
        unloading_hour_from
        unloading_hour_to
        width
        height
        length
        daily_amount
        remaining_amount
        has_tracking_gps
        has_required_bill
        goods_description
        created_at
        goods_package {
          title
        }
        goods_category {
          title
        }
        goods {
          title
        }
        cargo {
          title
        }
        company {
          title
        }
        creator {
          firstname
          lastname
        }
        license_release {
          license {
            subject
          }
        }
        first_origin {
          title
          city {
            title
          }
        }
        destination {
          title
          city {
            title
          }
        }
        loader {
          vehicle_category {
            title
          }
          loader_category {
            title
          }
          media {
            full_url
          }
        }
        status {
          id
          title
        }
        reserves {
          id
          transport {
            id
          }
          driver {
            user {
              firstname
              lastname
            }
            media {
              full_url
            }
          }
          vehicle {
            plate_letters
            plate_serial_number
            two_left_digits_plate
            three_right_digits_plate
          }
          status {
            id
            title
          }
          delivery_time
          driver_description
          company_description
          driver_suggestion_amount
          final_company_suggestion_amount
        }
        financial {
          driver_tip
          driver_amount
          prepayment_amount
          payment_method {
            title
          }
          loading_cost
          unloading_cost
          loading_bascule_cost
          unloading_bascule_cost
          issuance_cost
          settlement_time
          settlement_duration
          missing_unit
          missing_allowable_value
          missing_calculation_type
          forfeit_calculation_amount
        }
      }
      total
      last_page
    }
  }
''';


  // Map<String, dynamic> get variables => {
  //   "page": 1,
  //   "limit": 12,
  // };
  final Map<String, dynamic> variables = {
    "ids": ["19"], // باید حتماً لیست باشه چون نوع متغیر [String] هست
  };
  final HttpLink httpLink = HttpLink(
    'https://rahko-core.hy2.ir/graphql/auth/shared',
    defaultHeaders: {
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vcmFoa28tY29yZS5oeTIuaXIvZ3JhcGhxbCIsImlhdCI6MTc1MzAwODYyOSwiZXhwIjoxNzU1NjAwNjI5LCJuYmYiOjE3NTMwMDg2MjksImp0aSI6IlpMS2ZqdDZtMXVZMFFkaE4iLCJzdWIiOiI1YTQ2Yzc3MC1hMGU5LTExZWEtOTMwYS01ZDNhN2QzZjY0MGIiLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.GHbh-pJoF1zsQkOBaG-D2KshfQ8bxwVDHCXG9CKEJdo', // توکن لازم اگه هست اینجا بذار
    },
  );


  void fetchTransport(BuildContext context) async {

    final client = GraphQLConfig.getClient(path: "/auth/shared", token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vcmFoa28tY29yZS5oeTIuaXIvZ3JhcGhxbCIsImlhdCI6MTc1MzAwODYyOSwiZXhwIjoxNzU1NjAwNjI5LCJuYmYiOjE3NTMwMDg2MjksImp0aSI6IlpMS2ZqdDZtMXVZMFFkaE4iLCJzdWIiOiI1YTQ2Yzc3MC1hMGU5LTExZWEtOTMwYS01ZDNhN2QzZjY0MGIiLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.GHbh-pJoF1zsQkOBaG-D2KshfQ8bxwVDHCXG9CKEJdo");


    //  final client = GraphQLProvider.of(context).value;

    final result = await client.query(
      QueryOptions(
        document: gql(announcementReleaseQuery),
      //  document: gql(query),
      //  document: gql(transportQuery),
        variables: variables,
        // {
        //   'status_ids': ["2", "3", "14", "15"],
        // },
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      print("❌ خطا: ${result.exception}");
    } else {
      //final transport = result.data?['transport'];
     //final fg= jsonDecode(result.data);
      final transport = result.data?['announcementRelease'];
      final items = transport['data'] as List;

      print("✅ Total: ${transport['total']}");
      for (var item in items) {
        print("➤ ${item['type']} - ${item['value']} ---  ");
        print("➤   ${item['goods_package']['title']}");
        print("➤ ${item['code']} - ${item['status']['title']}");
      }

      final itemsJson = result.data?['announcementRelease']?['data'] as List<dynamic>?;

     // final modelss= Modelss.fromJson(result.data);
      final announcements = itemsJson?.map((e) {
        return Models.fromJson(e);
      }).toList();

    //  debugPrint('modelss_is: ${announcements.toString()}');
      log('modelss_is3: ${result.data?['announcementRelease']}');
      debugPrint('modelss_is2: ${announcements?.length}');
      debugPrint('modelss_is2: ${announcements?[0].destination?.title}');
      debugPrint('modelss_is2: ${announcements?[0].status?.title}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
         padding: EdgeInsets.symmetric(horizontal: 20),
         // color: Colors.blueGrey,
          child: Column(
            children: [
              SizedBox(height: 50,),
              ElevatedButton(
                onPressed: () => fetchTransport(context),
                child: Text('فراخوانی کوئری'),
              ),
              Center(
                child: Image.asset(MediaRes.logo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


