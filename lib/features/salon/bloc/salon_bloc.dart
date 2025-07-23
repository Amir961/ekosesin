import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fare/features/salon/models/city_models.dart';
import 'package:fare/features/salon/models/details_salon_models.dart';
import 'package:fare/features/salon/models/salon_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meta/meta.dart';

import '../../../core/network/network_info.dart';
import '../../../core/services/config.dart';
import '../../../core/utils/enum.dart';

part 'salon_event.dart';
part 'salon_state.dart';

class SalonBloc extends Bloc<SalonEvent, SalonState> {
  final NetworkInfo networkInfo;
    SalonBloc(this.networkInfo) : super(SalonState(typeSalon: TypeSalon.public, typeFilterSalon: TypeFilterSalon.myNav, listCity: [], selectedDestination: null, selectedSource: null, statusButton: StatusButton.none, listSalonModel: [], statusDetails: StatusButton.none, detailsSalonModels: null,)) {

    on<ChangeTopFilter>(_onChangeTopFilter);
    on<ChangeTypeSalon>(_onChangeTypeSalon);
    on<ChangeSource>(_onChangeSource);
    on<ChangeDestination>(_onChangeDestination);
    on<GetListCity>(_onGetListCity);
    on<ChangeFilter>(_onChangeFilter);
    on<GetListSalon>(_onGetListSalon);
    on<GetDetailsSalon>(_onGetDetailsSalon);
  }

    getListSalon() async
    {

      Map<String, dynamic>  variables = {

      };

      if(state.typeSalon==TypeSalon.private)
        {
          variables.addAll({"release_type":"private"});
        }
      else
        {
          variables.addAll({"release_type":"public"});
        }

      if(state.selectedDestination!=null)
        {
          variables.addAll({"destination_state_id":"${state.selectedDestination!.id}"});


        }
      if(state.selectedSource!=null)
      {
        variables.addAll({"origin_state_id":"${state.selectedSource!.id}"});


      }

      emit(state.copyWith(
          statusButton: StatusButton.loading));

      if (!(await networkInfo.isConnected)) {
        return emit(state.copyWith(
            statusButton: StatusButton.noInternet ));
      }
      final client = GraphQLConfig.getClient(path: "/auth/shared",
          token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vcmFoa28tY29yZS5oeTIuaXIvZ3JhcGhxbCIsImlhdCI6MTc1MzEwODgzNSwiZXhwIjoxNzU1NzAwODM1LCJuYmYiOjE3NTMxMDg4MzUsImp0aSI6IlZMSnlLUTJ4MVdEdml1TTEiLCJzdWIiOiI0ZDA3MjRhMC02NjM5LTExZjAtOTRjMy1iM2Q1MjVmYWE3YjgiLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0._3MXV4wcN-iQ_YNjm4BW7jGycW7SrA_9WKQgP_PWqqs");

      final result = await client.query(
        QueryOptions(
          document: gql(announcementReleaseQuery),

          variables: variables,

          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );
      if (result.hasException) {
        print("❌ خطا: ${result.exception}");
        emit(state.copyWith(statusButton: StatusButton.failed,
            ));
      } else {
        //final transport = result.data?['transport'];
        //final fg= jsonDecode(result.data);
        final transport = result.data?['announcementRelease'];
        final items = transport['data'] as List;

        print("✅ Total: ${transport['total']}");
        // for (var item in items) {
        //   print("➤ ${item['type']} - ${item['value']} ---  ");
        //   print("➤   ${item['goods_package']['title']}");
        //   print("➤ ${item['code']} - ${item['status']['title']}");
        // }

        final itemsJson = result.data?['announcementRelease']?['data'] as List<dynamic>?;

        // final modelss= Modelss.fromJson(result.data);
        final listSalon = itemsJson?.map((e) {
          return SalonModel.fromJson(e);
        }).toList();

        debugPrint('SalonModel_is: ${listSalon!.length}');

        emit(state.copyWith(statusButton: StatusButton.success,
            listSalonModel: listSalon));
      }
    }

  _onGetDetailsSalon(
      GetDetailsSalon event,
      Emitter<SalonState> emit,
      ) async {

    final String announcementQuery = r'''
query announcementRelease($ids: [String]) {
  announcementRelease(ids: $ids) {
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


    final options = QueryOptions(
      document: gql(announcementQuery),
      variables: {
        "ids": [(event.value)],
      },
      fetchPolicy: FetchPolicy.networkOnly,
    );

    emit(state.copyWith(
        statusDetails: StatusButton.loading));

    if (!(await networkInfo.isConnected)) {
      return emit(state.copyWith(
          statusDetails: StatusButton.noInternet ));
    }
    final client = GraphQLConfig.getClient(path: "/auth/shared",
        token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vcmFoa28tY29yZS5oeTIuaXIvZ3JhcGhxbCIsImlhdCI6MTc1MzEwODgzNSwiZXhwIjoxNzU1NzAwODM1LCJuYmYiOjE3NTMxMDg4MzUsImp0aSI6IlZMSnlLUTJ4MVdEdml1TTEiLCJzdWIiOiI0ZDA3MjRhMC02NjM5LTExZjAtOTRjMy1iM2Q1MjVmYWE3YjgiLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0._3MXV4wcN-iQ_YNjm4BW7jGycW7SrA_9WKQgP_PWqqs");

    final result = await client.query(
        options,
      // QueryOptions(
      //   document: gql(announcementReleaseQuery),
      //
      //   variables: variables,
      //
      //   fetchPolicy: FetchPolicy.networkOnly,
      // ),
    );
    if (result.hasException) {
      print("❌ خطا: ${result.exception}");
      emit(state.copyWith(statusDetails: StatusButton.failed,
      ));
    } else {
      //final transport = result.data?['transport'];
      //final fg= jsonDecode(result.data);
      final transport = result.data?['announcementRelease'];
      final items = transport['data'] as List;

      print("✅ Total: ${transport['total']}");
      // for (var item in items) {
      //   print("➤ ${item['type']} - ${item['value']} ---  ");
      //   print("➤   ${item['goods_package']['title']}");
      //   print("➤ ${item['code']} - ${item['status']['title']}");
      // }

      final itemsJson = result.data?['announcementRelease']?['data'] as List<dynamic>?;

      final detailsSalonModels= DetailsSalonModels.fromJson(itemsJson![0]);
     

      
      emit(state.copyWith(statusDetails: StatusButton.success,
          detailsSalonModels: detailsSalonModels));
    }


  }



  _onGetListSalon(
      GetListSalon event,
      Emitter<SalonState> emit,
      ) async {

    getListSalon();

  }

  _onGetListCity(
        GetListCity event,
        Emitter<SalonState> emit,
        ) async {


      final client = GraphQLConfig.getClient(path: "", );
      final String query = r'''
  query state($ids: [String], $title: String, $page: Int, $limit: Int, $orderBy_field: String, $orderBy_direction: String) {
    state(
      ids: $ids
      title: $title
      page: $page
      limit: $limit
      orderBy_field: $orderBy_field
      orderBy_direction: $orderBy_direction
    ) {
      data {
        id
        title
        media {
          id
          full_url
        }
      }
      total
      last_page
    }
  }
''';
      final result = await client.query(
        QueryOptions(
          document: gql(query),

          variables: {},

          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (result.hasException) {
        print("❌ خطا: ${result.exception}");
      } else {
        //final transport = result.data?['transport'];
        //final fg= jsonDecode(result.data);
        final transport = result.data?['state'];
        final items = transport['data'] as List;

        print("✅ Total: ${transport['total']}");
        // for (var item in items) {
        //   print("➤ ${item['type']} - ${item['value']} ---  ");
        //   print("➤   ${item['goods_package']['title']}");
        //   print("➤ ${item['code']} - ${item['status']['title']}");
        // }

        final itemsJson = result.data?['state']?['data'] as List<dynamic>?;

        // final modelss= Modelss.fromJson(result.data);
        final listCity = itemsJson?.map((e) {
          return CityModels.fromJson(e);
        }).toList();

          debugPrint('modelss_is: ${listCity!.length}');

        emit(state.copyWith(
            listCity: listCity ));

      }


    }

    _onChangeFilter(
        ChangeFilter event,
        Emitter<SalonState> emit,
        ) async {
      if(event.destination==null)
        {
          emit(state.resetDestination());
        }
      if(event.source==null)
      {
        emit(state.resetSource());
      }
      emit(state.copyWith(
          selectedDestination: event.destination,selectedSource: event.source ));

      getListSalon();

    }


  _onChangeDestination(
        ChangeDestination event,
        Emitter<SalonState> emit,
        ) async {
      emit(state.copyWith(
          selectedDestination: event.value )); }

    _onChangeSource(
        ChangeSource event,
        Emitter<SalonState> emit,
        ) async {
      emit(state.copyWith(
          selectedSource: event.value )); }

    _onChangeTopFilter(
        ChangeTopFilter event,
        Emitter<SalonState> emit,
        ) async {
      emit(state.copyWith(
          typeFilterSalon: event.value ));



    }

    _onChangeTypeSalon(
        ChangeTypeSalon event,
        Emitter<SalonState> emit,
        ) async {
      emit(state.copyWith(
          typeSalon: event.value ));



      getListSalon();



    }



}

const String announcementReleaseQuery = r'''
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
      ids: $ids,
      first_origin_id: $first_origin_id,
      last_origin_id: $last_origin_id,
      destination_id: $destination_id,
      origin_state_id: $origin_state_id,
      destination_state_id: $destination_state_id,
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
      transport_type: $transport_type,
      release_type: $release_type,
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
