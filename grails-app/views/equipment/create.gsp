<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'equipment.label', default: 'Equipment')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <script language="JavaScript">

            function getParamsToEq(paramId){
                $.ajax({
                    url: '${createLink(action: "getDefaultParams.json", controller: "parameter")}?id=' + paramId,
                    success: function(data) {
                        $("#parameterValue").val(data.parameterValue);
                        $("#parameterUnit").val(data.parameterUnit);
                        $("#parameterGroup").val(data.parameterGroup);
                    }

                });
                return false;
            }

        </script>



    </head>
    <body>

        <div id="create-equipment">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.equipment}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.equipment}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>

            <hr/>
            <g:form resource="${this.equipment}" method="POST">
                <fieldset class="form">
                <div class="row">
                    <div class="col-lg-6"><g:render template="form"></g:render> </div>
                    <div class="col-lg-6"><g:render template="default"></g:render> </div>

                </div>


                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="btn btn-outline-success" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
