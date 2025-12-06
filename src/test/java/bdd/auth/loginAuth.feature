Feature: Casos de login


  @login-exitoso
  Scenario: Caso 1
    Given url urlBase
    And path "/auth"
    And request read('classpath:resources/json/auth/bodyLogin.json')
    When method post
    Then status 200
    * def authToken = response.token


  @login-fallido
  Scenario: Caso 2 - Login con contraseña incorrecta
    Given url urlBase
    And path "/auth"
    And request
    """
  {
  "username": "admin",
  "password": "14528"
  }
  """
    When method post
    Then status 200
    And match response.reason == "Bad credentials"