module.exports = {

    EstasLogeado(req,res,next) {
        if(req.isAuthenticated()){
            //console.log(req.user.perfil)
            return next(); // Si estas Logeado puede continuar el codigo en ejecucion
        }
        return res.redirect('/sigin'); // Si no estas logeado mandarlo al Login
    }
    ,
    isNotLogeado(req,res,next) {
        if(!req.isAuthenticated()){
            return next(); //Si no estas logeado continua tu camnino
        }
        return res.redirect('/profile');// Pero si estas logeado entonces anda atu perfil
        //SOLO USADO EN LOGIN y SIGNUP  ! !!!!!!!!!!
    },
    Rol_Profesor_o_Admin(req,res,next){  
        // LO USE PARA PRUEBAS Y SI FUNCIONA
        // routes/Manto_tablas.js   funcion add_profe_Admin funciona validando esto =)              
        if(req.user.perfil == 'Docente' || req.user.perfil == 'Administrador' ){
            return next();
        }
        return res.sendStatus(403) // Forbidden
    }



};