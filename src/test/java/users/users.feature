Feature: Creación de Usuario en Swagger Petstore

  Background:
    * url 'https://petstore.swagger.io/v2'

  Scenario Outline: Crear orden de compra
    Given path '/store/order/'
    And request { "id": "<orderId>", "petId": "<petId>", "quantity": "<quantity>", "shipDate": "<shipDate>", "status": "<status>", "complete": <complete> }
    When method post
    And def statusCode = responseStatus
    Then if (statusCode == 200) karate.log('Orden de compra Creada')
    * if (statusCode == 400) karate.log('Orden Invalida')
    * if (statusCode== 500) karate.log('Servidor no responde')
    Examples:
      |orderId  | petId | quantity  | shipDate               | status  | complete |
      |111      |12     |22         |2024-07-01T01:50:59.445Z| placed  | true     |
      |221      |23     |22         |2024-08-04T02:50:59.445Z| waiting | false    |
      |331      |34     |22         |2024-09-06T03:50:59.445Z| waiting | false    |
      |441      |45     |22         |2024-10-08T04:50:59.445Z| waiting | false    |

  Scenario Outline: Consultar una orden de compra
    Given path '/store/order/<orderId>'
    When method get
    And def statusCode = responseStatus
    Then if (statusCode == 200) karate.log('Orden de compra encontrada correctamente')
    * if (statusCode == 404) karate.log('Orden de compra NO encontrada')
    * if (statusCode== 500) karate.log('Servidor no responde')
    Examples:
      |orderId  |
      |111|
      |221|
      |331|
      |441|

  Scenario: Verificar Inventarios
    Given path '/store/inventory'
    When method get
    And def statusCode = responseStatus
    And def responsejson = response
    And karate.log('Inventarios:', responsejson)
    Then if (statusCode == 200) karate.log('Inventarios encontrados correctamente')
    * if (statusCode== 500) karate.log('Servidor no responde')
    * if (responsejson.sold !==null ) karate.log('Inventario vendido:', response.sold)

  Scenario Outline: eliminar una orden de compra
    Given path '/store/order/<orderId>'
    When method delete
    Then if (responseStatus == 200) {karate.log ('Compra eliminada correctamente: ' + response.message);}
    * if (responseStatus== 500) karate.log('Servidor no responde')
    * if (responseStatus == 400) karate.log('Id Invalido')
    * if (responseStatus == 404) karate.log('Order no encontrada: ' + response.message)
    Examples:
      |orderId|
      |111|
      |221|
      |331|
      |500|



