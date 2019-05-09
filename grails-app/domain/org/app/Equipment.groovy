package org.app

class Equipment {

    String elementFilename
    String elementType
    String elementPath
    String designationDE
    String designationEN

    static hasMany = [parameter : ParameterEquipment]

    static constraints = {
        elementFilename blank: false
    }


    String toString() {
        elementFilename
    }
}
