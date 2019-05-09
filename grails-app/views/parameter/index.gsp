<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'parameter.label', default: 'Parameter')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        
        <div id="list-parameter">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <hr/>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:link action="create" controller="parameter" class="btn btn-primary">Add new parameter</g:link>
<hr/>

            <g:render template="parameters"></g:render>


            <div class="pagination">
                <g:paginate total="${parameterCount ?: 0}" />
            </div>
        </div>
    </body>
</html>