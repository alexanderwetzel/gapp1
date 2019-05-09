package org.app

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.converters.JSON

class ParameterController {

    ParameterService parameterService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    def getParameterToEntry(){
         def idV = params.id.toLong()
        println("params from paramterController " + params)

        def ep  = ParameterEquipment.get(idV)
        if(ep != null){
            //def paramterToEdit = Parameter.get(ep.parameterId)
            def paramterToEdit = ep
                 respond paramterToEdit
        }
        else{
            notFound()
            return
        }

        render "no data"
    }

    def getDefaultParams(Long id){
        respond  parameterService.get(id)
    }

    def getDefaultParams1(Long id){

       def  para = parameterService.get(id)

        render(contentType: "application/json") {
            parameter(parameterValue: para.parameterValue,
                      parameterUnit: para.parameterUnit,
                      parameterGroup: para.parameterGroup,

            )

        }
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond parameterService.list(params), model:[parameterCount: parameterService.count()]
    }

    def show(Long id) {
        respond parameterService.get(id)
    }

    def create() {
        respond new Parameter(params)
    }

    def save(Parameter parameter) {
        if (parameter == null) {
            notFound()
            return
        }

        try {
            parameterService.save(parameter)
        } catch (ValidationException e) {
            respond parameter.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'parameter.label', default: 'Parameter'), parameter.id])
                //redirect parameter

                redirect(action:'index')
            }
            '*' { respond parameter, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond parameterService.get(id)
    }

    def update(Parameter parameter) {
        if (parameter == null) {
            notFound()
            return
        }

        try {
            parameterService.save(parameter)
        } catch (ValidationException e) {
            respond parameter.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'parameter.label', default: 'Parameter'), parameter.id])
                redirect parameter
            }
            '*'{ respond parameter, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        parameterService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'parameter.label', default: 'Parameter'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'parameter.label', default: 'Parameter'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
