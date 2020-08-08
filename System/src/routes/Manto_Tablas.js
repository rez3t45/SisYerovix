const express = require('express');
const router = express.Router();

const { route } = require('.');
const pool = require('../database');

const { EstasLogeado,Rol_Profesor_o_Admin } = require('../lib/auth'); // SOlo instancio esta funcion ESTASLOGEADO

const Valid_roles = require('../lib/Valid_roles'); //Insancio para usar PwdCrypt


router.get('/add_ciclo',EstasLogeado, ( req,res ) => {    

    /*
    console.log('var: RPerfiles')
    console.log(req.Rperfiles);
    */
    //console.log(Valid_roles.vRol(1,req.VarGlobal))

    if(Valid_roles.vRol(1,req.Rperfiles)){
        res.render('tablas/add_ciclo');
    }else{
        res.status(404).send('No tienes PERMISO ****** ???');
    }

});

router.get('/add_periodo',EstasLogeado, ( req,res ) => {
    
    if(Valid_roles.vRol(2,req.Rperfiles)){
        res.render('tablas/add_periodo');
    }else{
        res.status(404).send('No tienes PERMISO ****** ???');
    }
    
});


router.get('/calificaciones',EstasLogeado, ( req,res ) => {

    if(Valid_roles.vRol(3,req.Rperfiles)){
        res.send('Entraste a CALIFICACIONES');
    }else{
        res.status(404).send('No tienes PERMISO ****** ???');
    }
   
});

router.get('/seguimiento_emocional',EstasLogeado, ( req,res ) => {

    if(Valid_roles.vRol(4,req.Rperfiles)){
        res.send('Entraste a seguimiento_emocional');
    }else{
        res.status(404).send('No tienes PERMISO ****** ???');
    }
   
});



//--------------
// PRUEBA ROL
//--------------

// AQUI SOLO INGRESA PROFE O ADMIN
// NADIE mas
 

router.get('/add_profe_Admin',EstasLogeado,Rol_Profesor_o_Admin, ( req,res ) => {    
    res.send('Ingresaste');
});

//*********************** */
// END PRB
//*********************** */




module.exports = router;