<table class ="table table-bordered">

        <thead>
         <tr>
             <th>Action</th>
             <th>#</th>
             <th>File name</th>
             <th>Element type</th>
             <th>Element path</th>
             <th>Designation DE</th>
             <th>Designation EN</th>
         </tr>
        </thead>
        <tbody>
        <g:each in="${equipmentList}" >

            <tr>
                <td><g:link controller="equipment" action="edit" params="[id: it.id]">Edit</g:link></td>
                <td>${it.id}</td>
                <td>${it.elementFilename}</td>
                <td>${it.elementType}</td>
                <td>${it.elementPath}</td>
                <td>${it.designationDE}</td>
                <td>${it.designationEN}</td>
            </tr>
        </g:each>
        </tbody>


</table>