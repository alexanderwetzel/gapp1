<table class ="table table-bordered">

        <thead>
         <tr>
             <th>#</th>
             <th>Parameter Name</th>
             <th>Parameter Value</th>
             <th>Parameter Unit</th>
             <th>Parameter Group</th>
         </tr>
        </thead>
        <tbody>
        <g:each in="${parameterList}" >

            <tr>
                <td>${it.id}</td>
                <td>${it.parameterName}</td>
                <td>${it.parameterValue}</td>
                <td>${it.parameterUnit}</td>
                <td>${it.parameterGroup}</td>
            </tr>
        </g:each>
        </tbody>


</table>