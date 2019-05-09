package org.app


class ParameterEquipment  {

    Equipment equipment
    Parameter parameter

    //Integer parameter
    String parameterValue
    String parameterUnit
    String parameterGroup


    static constraints = {

      // parameterId blank: false, nullable: false
       parameterValue blank: false, nullable: false
       parameterUnit blank: false, nullable: false
       parameterGroup blank: false, nullable: false

    }

}
