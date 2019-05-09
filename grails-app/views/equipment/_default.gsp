<%@ page import="org.app.Parameter" %>

<script language="JavaScript">

    function dafaultParamsChanged(paramId){

        if(parseInt(paramId)){
            //get values to id
                getParamsToEq(paramId);

        }
        else{
            $("#parameterValue").val("");
            $("#parameterUnit").val("");
            $("#parameterGroup").val("");
        }

    }

    function addParamToEq2(){

        console.log("adding params");
        var frmAddParams = $("#frmAddParams");

                var frmData = $(frmAddParams).serialize();
                $.ajax({
                    type: "POST",
                    url: $(frmAddParams).attr('action'),
                    data: frmData,
                    success: function (response){
                        $("#addedParams").html(response);

                    },

                    error: function(response){
                        debugger;

                    }
                });
    }

</script>

<!--form -->

    <div class="form-group">
        <label>Default parameter:</label>
    <div class="col-6">
        <g:select id="parameterName" name='parameterName' value="${parameter?.id}"
                  noSelection="${['null':'Select One...']}"
                  from='${org.app.Parameter.list()}'
                  optionKey="id" optionValue="parameterName" class="form-control" onchange="javascript:dafaultParamsChanged(this.value);"></g:select>
    </div>
        <small id="selectHelp" class="form-text text-muted">Select an existing parameter</small>
    </div>

    <div class="form-group">
        <label>Value:</label>
        <div class="col-6">
            <g:textField name="parameterValue" value="" class="form-control"></g:textField>
        </div>
        <small id="valueHelp" class="form-text text-muted">Change default value</small>
    </div>

    <div class="form-group">
        <label>Unit:</label>
        <div class="col-6">
            <g:textField name="parameterUnit" value="" class="form-control"></g:textField>
        </div>
        <small id="unitHelp" class="form-text text-muted">Change default unit</small>
    </div>

    <div class="form-group">
        <label>Group:</label>
        <div class="col-6">
            <g:textField name="parameterGroup" value="" class="form-control"></g:textField>
        </div>
        <small id="groupHelp" class="form-text text-muted">Change default group</small>
    </div>


