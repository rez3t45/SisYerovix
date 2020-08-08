const Valid_forms = {};

Valid_forms.vRol = (id_rol,dt_perfiles) => {

    /*
    console.log('HERE ValidRoles Array_Perfiles ***************');
    console.log(dt_perfiles)
    console.log(id_rol)
    console.log(`filas Rperfiles : ${dt_perfiles.length}`)
    console.log(`valor fila 2 : ${dt_perfiles[2].id_form}`)
    */

    for (var i = 0; i < dt_perfiles.length; i++) {

        if(dt_perfiles[i].id_form == id_rol){
             console.log(dt_perfiles[0].id_form)
             return true;
        }

     }

     return false;
     
};

module.exports = Valid_forms;