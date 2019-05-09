
<div class="form-group">
    <label>Parameter Name:</label>
    <!--<input type="text" class="form-control" id="parameterName" aria-describedby="nameHelp">-->
    <g:textField name="parameterName" value="${parameter.parameterName}" class="form-control" aria-describedby="nameHelp"></g:textField>
        <small id="nameHelp" class="form-text text-muted">Enter a unique name for parameter</small>
</div>


<div class="form-group">
    <label>Parameter Value:</label>
   <!-- <input type="text" class="form-control" id="parameterValue" aria-describedby="nameHelp" placeholder="Enter parameter name">-->
    <g:textField name="parameterValue" value="${parameter.parameterValue}" class="form-control" aria-describedby="valueHelp"></g:textField>
    <small id="valueHelp" class="form-text text-muted">Enter a value for parameter (10, 230)</small>
</div>



<div class="form-group">
    <label>Parameter Unit:</label>

    <g:textField name="parameterUnit" value="${parameter.parameterUnit}" class="form-control" aria-describedby="unitHelp"></g:textField>
    <small id="unitHelp" class="form-text text-muted">Enter a unit for parameter (bar, V, Watt)</small>
</div>




<div class="form-group">
    <label>Parameter Group:</label>

    <g:textField name="parameterGroup" value="${parameter.parameterGroup}" class="form-control col-lg-7" aria-describedby="groupHelp"></g:textField>
    <small id="groupHelp" class="form-text text-muted">Enter a group for parameter</small>
</div>
