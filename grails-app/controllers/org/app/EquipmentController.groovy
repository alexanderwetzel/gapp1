package org.app

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class EquipmentController {

    EquipmentService equipmentService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    def updateParameterAddedToEq(){

        def parameterEquipment = ParameterEquipment.get(params.parmToEqId)
        if(parameterEquipment == null){
            notFound()
            return
        }

        parameterEquipment.parameterValue = params.parameterValue
        parameterEquipment.parameterUnit = params.parameterUnit
        parameterEquipment.parameterGroup = params.parameterGroup

        parameterEquipment.save(flush:true)

        def parameterAdded = equipmentService.get(params.equipmentId).parameter
        render(template: 'addedParams', model: [parameterAdded: parameterAdded])

    }


    def removeParamFromEq(Long id){
        if (id == null) {
            notFound()
            return
        }

        ParameterEquipment parameterToEq = ParameterEquipment.get(params.id)

        parameterToEq.delete(flush: true)

        def parameterAdded = parameterToEq.equipment.parameter
        render(template: 'addedParams', model: [parameterAdded: parameterAdded])

    }

    def addParams(){
        println("my params are: "  + params)

        Equipment equipment = Equipment.get(params?.equipment_id?.toLong())
        ParameterEquipment parameterToEq = new ParameterEquipment()


        parameterToEq.parameter  = Parameter.get(params.parameterName)
        parameterToEq.equipment = equipment
        parameterToEq.parameterUnit = params.parameterUnit
        parameterToEq.parameterValue = params.parameterValue
        parameterToEq.parameterGroup = params.parameterGroup


        if (equipment != null)
        {

            try {

                parameterToEq.save(flush:true)

            } catch (ValidationException e) {
                respond pe.errors, view:'edit'
                return
            }


        }
        else{
            render "error"
        }

        def parameterAdded = equipment.parameter
        render(template: 'addedParams', model: [parameterAdded: parameterAdded])


    }


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond equipmentService.list(params), model:[equipmentCount: equipmentService.count()]
    }

    def show(Long id) {
        respond equipmentService.get(id)
    }

    def create() {

        def defparam = Parameter.list()
        respond new Equipment(params)
    }

    def save(Equipment equipment) {

        println(' params ' + params)

        //via params get the  parameter
        def parameterToEq = new ParameterEquipment()

        parameterToEq.parameter  = Parameter.get(params.parameterName)
        parameterToEq.equipment = equipment

        parameterToEq.parameterValue = params.parameterValue
        parameterToEq.parameterUnit = params.parameterUnit
        parameterToEq.parameterGroup = params.parameterGroup


        if (equipment == null) {
            notFound()
            return
        }

        try {
            equipmentService.save(equipment)
            parameterToEq.save()


        } catch (ValidationException e) {
            respond equipment.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'equipment.label', default: 'Equipment'), equipment.id])
                //redirect equipment
                redirect(action: 'index')
            }
            '*' { respond equipment, [status: CREATED] }
        }
    }


    def edit(Long id) {

        // respond equipmentService.list(params), model:[equipmentCount: equipmentService.count()]
        def equipment = equipmentService.get(id)
        def parameterAddedToEquipmentModel = equipment.parameter
        respond equipment, model:[parameterAdded: parameterAddedToEquipmentModel ]
    }


    def update(Equipment equipment) {
        if (equipment == null) {
            notFound()
            return
        }

        try {
            equipmentService.save(equipment)
        } catch (ValidationException e) {
            respond equipment.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'equipment.label', default: 'Equipment'), equipment.id])
                //redirect equipment
                def parameterAddedToEquipmentModel = equipment.parameter
                respond equipment, view:'edit', model:[parameterAdded: parameterAddedToEquipmentModel ]
            }
            '*'{ respond equipment, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        equipmentService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'equipment.label', default: 'Equipment'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipment.label', default: 'Equipment'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
