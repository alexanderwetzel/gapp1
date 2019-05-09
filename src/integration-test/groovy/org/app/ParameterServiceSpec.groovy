package org.app

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ParameterServiceSpec extends Specification {

    ParameterService parameterService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Parameter(...).save(flush: true, failOnError: true)
        //new Parameter(...).save(flush: true, failOnError: true)
        //Parameter parameter = new Parameter(...).save(flush: true, failOnError: true)
        //new Parameter(...).save(flush: true, failOnError: true)
        //new Parameter(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //parameter.id
    }

    void "test get"() {
        setupData()

        expect:
        parameterService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Parameter> parameterList = parameterService.list(max: 2, offset: 2)

        then:
        parameterList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        parameterService.count() == 5
    }

    void "test delete"() {
        Long parameterId = setupData()

        expect:
        parameterService.count() == 5

        when:
        parameterService.delete(parameterId)
        sessionFactory.currentSession.flush()

        then:
        parameterService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Parameter parameter = new Parameter()
        parameterService.save(parameter)

        then:
        parameter.id != null
    }
}
