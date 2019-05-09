<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'equipment.label', default: 'Equipment')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>

        <script language="JavaScript">

            $(document).ready(function(){
                    $("#parameterName").attr("disabled",false );
                    $("#addParameterLink").css('visibility', 'visible');
                    $("#updateParameterLink").css('visibility', 'hidden');
                    $("#cancelParameterLink").css('visibility', 'hidden');
                });




            var idToEdit = 0;


            function getParamsToEq(paramId){
                $.ajax({
                    type: "GET",
                    url: '${createLink(action: "getDefaultParams.json", controller: "parameter")}?id=' + paramId,
                    success: function(data) {
                        $("#parameterValue").val(data.parameterValue);
                        $("#parameterUnit").val(data.parameterUnit);
                        $("#parameterGroup").val(data.parameterGroup);
                    }
                });
                return false;
            }
             function removeParam(paramId){
                    $.ajax({
                        type: "POST",
                        url: "${createLink(action:'removeParamFromEq', controller:'equipment')}",
                        data:  {id: paramId},
                        success: function (response){
                            $("#addedParams").html(response);

                        },
                        error: function(response){
                            debugger;
                        }
                    });

                }

            function editParam(paramId){
                $("#addParameterLink").css('visibility', 'hidden');
                $("#updateParameterLink").css('visibility', 'visible');
                $("#cancelParameterLink").css('visibility', 'visible');
                getParameterOfSelectedEntry(paramId);
                $("#parameterName").attr("disabled",true );

                idToEdit = paramId;
            }

            function getParameterOfSelectedEntry(paramId){

                $.ajax({
                    type: "GET",
                    url: '${createLink(action:"getParameterToEntry.json", controller:"parameter")}?id=' + paramId,
                    success: function (response){

                        $("#parameterName").val(response.parameter.id);
                        $("#parameterValue").val(response.parameterValue);
                        $("#parameterUnit").val(response.parameterUnit);
                        $("#parameterGroup").val(response.parameterGroup);
                    },


                    error: function(response){
                        debugger;

                    }
                });
            }


            function updateParamToEq(){

                //get values / update via jquery
                parameterName = $("#parameterName").val();
                parameterValue = $("#parameterValue").val();
                parameterUnit =  $("#parameterUnit").val();
                parameterGroup = $("#parameterGroup").val();
                eqId = ${equipment.id}

                $.ajax({
                    type: "POST",
                    url: '${createLink(action:"updateParameterAddedToEq", controller:"equipment")}',
                    data: { parmToEqId: idToEdit,
                            equipmentId: eqId,
                            parameterName: parameterName,
                            parameterValue: parameterValue,
                            parameterUnit: parameterUnit,
                            parameterGroup:parameterGroup },
                    success: function(response)
                    {
                        $("#addedParams").html(response);

                        $("#parameterName").attr("disabled",false );
                        $("#addParameterLink").css('visibility', 'visible');
                        $("#updateParameterLink").css('visibility', 'hidden');
                        $("#cancelParameterLink").css('visibility', 'hidden');

                    },
                    error: function (response) {
                        $("#parameterName").attr("disabled",false );
                        $("#addParameterLink").css('visibility', 'visible');
                        $("#updateParameterLink").css('visibility', 'hidden');
                        $("#cancelParameterLink").css('visibility', 'hidden');
                        idToEdit = 0;
                    }

                });


            }

            function reload() {
                var  url=  '${createLink(action:"edit", controller:"equipment")}';
                location.href= url + "/${equipment.id}";
            }

        </script>


    </head>
    <body>

        <div id="edit-equipment">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
            <div class="row">
                <div class="col-lg-6">
                <g:form resource="${this.equipment}" method="PUT">
                    <g:hiddenField name="version" value="${this.equipment?.version}" />
                    <fieldset class="form">
                        <g:render template="form"></g:render>

                    </fieldset>
                    <fieldset class="buttons">
                        <input class="btn btn-outline-success" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    </fieldset>
                </g:form>
                </div>
                <div class="col-lg-6">

                <g:form name="frmAddParams" action="addParams" controller="equipment" id="frmAddParams" params="[equipment_id: this.equipment.id]">
                    <g:render template="default"></g:render>
                    <a href="#" class="btn-link" id="addParameterLink"  onclick="addParamToEq2();">Add parameter</a>
                    <a href="#" class="btn-link" id="updateParameterLink"  onclick="updateParamToEq();">Save changes</a>
                     <a href="#" onclick="javascript:reload();" id="cancelParameterLink">| Cancel </a>

                </g:form>

                </div>

                <hr/>
                        <div id="addedParams">
                            <g:render template="addedParams"></g:render>
                        </div>
            </div>


        </div>
    </body>
</html>
