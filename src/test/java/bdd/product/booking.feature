Feature: Casos de booking

  Background:
    * def responseLogin = call read('classpath:bdd/auth/loginAuth.feature@login-exitoso')
    * def authToken = responseLogin.authToken
    Given url urlBase

  Scenario: Caso 1 - Update booking
    * def id = 1029
    And path "booking/" + id
    And header Accept = "application/json"
    And header Cookie = "token=" + authToken
    And request read('classpath:resources/json/product/bodyBooking.json')
    When method put
    Then status 200

  Scenario: Caso 1 - delete booking
    * def id = 1029
    And path "booking/" + id
    And header Accept = "application/json"
    And header Cookie = "token=" + authToken
    When method delete
    Then status 201
