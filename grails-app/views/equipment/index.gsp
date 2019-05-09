<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'equipment.label', default: 'Equipment')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>

        <div id="list-equipment" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>

            <hr/>
            <g:link controller="equipment" action="create" class="btn btn-primary">Add new equipment</g:link>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <hr/>


           <g:render template="equipments"></g:render>

            <div class="pagination">
                <g:paginate total="${equipmentCount ?: 0}" />
            </div>


        </div>
    </body>
</html>