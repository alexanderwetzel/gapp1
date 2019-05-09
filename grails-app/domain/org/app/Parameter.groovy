package org.app

class Parameter {

    String parameterName
    String parameterValue
    String parameterUnit
    String parameterGroup




    static constraints = {

        parameterName(blank:false, nullable: false)
        parameterValue(blank:false, nullable: false)
        parameterUnit(blank:false, nullable: false)
        parameterGroup(blank:false, nullable: false)
    }

    String toString(){

        parameterName
    }
}
