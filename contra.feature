Feature: Contraseña Segura

@regression @high
Scenario: La contraseña tiene que tener más de 8 carácteres
  Given un usuario está en el formulario de registro
  And ha rellenado todos los campos correspondientes
  When introduce una contraseña "Fran"
  And clicka en el botón "Salvar"
  Then un mensaje de error aparece
  And indica que "la contraseña debe tener menos de 8 carácteres"

@regression @medium
Scenario: La contraseña no debe tener espacio en blanco
  Given un usuario está en el formulario de registro
  And ha rellenado todos los campos correspondientes
  When introduce una contraseña "Fran Guerrero"
  And clicka en el botón "Salvar"
  Then un mensaje de error aparece
  And indica que "la contraseña no puede tener espacio en blanco"

  -------------------------------------------------------------------

  @regression @high
  Scenario Outline: La contraseña tiene que cumplir condiciones
    Given un usuario está en el formulario de registro
    And ha rellenado todos los campos correspondientes
    When introduce una contraseña <contraseña>
    And clicka en el botón "Salvar"
    Then un mensaje de error aparece
    And indica que <mensaje>

    Examples:
     | contraseña   | mensaje                                       |
     | "Fran"       | "La contraseña necesita más de 8 caracteres"  |
     | "Fran Gue"   | "La contraseña no puede tener espacios"       |
     | "Francisco"  | "La contraseña no tiene caracter especial"    |
