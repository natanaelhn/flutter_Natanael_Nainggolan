
import 'package:flutter_application_unit_testing/model/api_service.dart';
import 'package:flutter_application_unit_testing/model/food_object.dart';
import 'package:flutter_application_unit_testing/model/model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'api_service_test.mocks.dart';

@GenerateMocks([ApiService, Model])
void main() {
  
  group('ApiService', (){

    Model model = MockModel();
    ApiService apiService = MockApiService();

    test('get all contacts return data', () async{
    
      // Model model = Model();
      // ApiService apiService = ApiService(model);

      when(apiService.fetchFood()).thenAnswer(
        (_) async => <FoodObject>[
          FoodObject(id: 4, name: 'Nasi Goreng'),
          FoodObject(id: 5, name: 'Mie Goreng'),
        ]
      );

      List<FoodObject> listFood = await apiService.fetchFood();
      for(FoodObject i in listFood){
        print('${i.id}, ${i.name}');
      }
      expect(listFood.isNotEmpty, true);
    });

  });
  
}