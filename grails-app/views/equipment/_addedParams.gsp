

<div class="container-fluid" style="padding-top: 20px;">

    <table class ="table table-bordered">

        <thead>
        <tr>
            <th>Action</th>
            <th>#</th>
            <th>Parameter Name</th>
            <th>Parameter Value</th>
            <th>Parameter Unit</th>
            <th>Parameter Group</th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${parameterAdded}" >

            <tr>
                <td><a href="#" onclick="removeParam(${it.id})" id="removeLink">Remove</a> |
                                    <a href="#" onclick="editParam(${it.id})" id="editLink">Edit</a></td>
                <td>${it.id}</td>
                <td>${it.parameter.parameterName}</td>
                <td>${it.parameterValue}</td>
                <td>${it.parameterUnit}</td>
                <td>${it.parameterGroup}</td>

            </tr>
        </g:each>
        </tbody>


    </table>

</div>