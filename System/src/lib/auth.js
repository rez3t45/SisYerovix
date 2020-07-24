module.exports = {

    EstasLogeado(req,res,next) {
        if(req.isAuthenticated()){
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
    }

};