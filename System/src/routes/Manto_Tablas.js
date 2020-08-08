const express = require('express');
const router = express.Router();

const { route } = require('.');
const pool = require('../database');

const { EstasLogeado,Rol_Profesor_o_Admin } = require('../lib/auth'); // SOlo instancio esta funcion ESTASLOGEADO

const Valid_forms = require('../lib/Valid_forms'); //Insancio para usar PwdCrypt


router.get('/ciclo',EstasLogeado, ( req,res ) => {    
        
    //console.log(Valid_roles.vRol(1,req.VarGlobal))

    if(Valid_forms.vRol(1,req.Rforms)){
        res.render('tablas/Ciclo');
    }else{
        res.status(404).send('No tienes PERMISO ****** ???');
    }

});

router.get('/add_periodo',EstasLogeado, ( req,res ) => {
    
    if(Valid_forms.vRol(2,req.Rforms)){
        res.render('tablas/add_periodo');
    }else{
        res.status(404).send('No tienes PERMISO ****** ???');
    }
    
});

router.get('/calificaciones',EstasLogeado, ( req,res ) => {

    if(Valid_forms.vRol(3,req.Rforms)){
        res.send('Entraste a CALIFICACIONES');
    }else{
        res.status(404).send('No tienes PERMISO ****** ???');
    }
   
});

router.get('/seguimiento_emocional',EstasLogeado, ( req,res ) => {

    if(Valid_forms.vRol(4,req.Rforms)){
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