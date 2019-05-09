<div class="row">
    <div class="col-lg-6">
        <div class="form-group">
            <label>Equipment element filename:</label>

            <g:textField name="elementFilename" value="${equipment.elementFilename}" class="form-control" aria-describedby="nameHelp"></g:textField>
            <small id="nameHelp" class="form-text text-muted">Enter a unique name for equipment</small>
        </div>


        <div class="form-group">
            <label>Equipment element type:</label>

            <g:textField name="elementType" value="${equipment.elementType}" class="form-control" aria-describedby="typeHelp"></g:textField>
            <small id="typeHelp" class="form-text text-muted">Enter an element type</small>
        </div>

        <div class="form-group">
            <label>Equipment path:</label>

            <g:textField name="elementPath" value="${equipment.elementPath}" class="form-control" aria-describedby="pathHelp"></g:textField>
            <small id="pathHelp" class="form-text text-muted">Enter a path</small>
        </div>

        <div class="form-group">
            <label>Equipment designation DE</label>

            <g:textField name="designationDE" value="${equipment.designationDE}" class="form-control col-lg-7" aria-describedby="deHelp"></g:textField>
            <small id="deHelp" class="form-text text-muted">Enter a description in DE</small>
        </div>

        <div class="form-group">
            <label>Equipment designation EN</label>

            <g:textField name="designationEN" value="${equipment.designationEN}" class="form-control col-lg-7" aria-describedby="enHelp"></g:textField>
            <small id="enHelp" class="form-text text-muted">Enter a description in EN</small>
        </div>
    </div>
</div>



