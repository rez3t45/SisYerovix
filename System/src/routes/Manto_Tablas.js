const express = require('express');
const router = express.Router();

const { route } = require('.');
const pool = require('../database');

const { EstasLogeado,Rol_Profesor_o_Admin } = require('../lib/auth'); // SOlo instancio esta funcion ESTASLOGEADO


router.get('/add_ciclo', ( req,res ) => {    
    res.render('tablas/add_ciclo');
});

router.post('/add_ciclo', async (req,res) => {
    /*console.log(req.body); */ //-> Recupero datos del body

    // Atributos Name en el body add.hbs
    const {  ciclo, anio , fec_ini, fec_fin} = req.body;
  
    await pool.query('CALL Tsp_insert_link (?, ?, ?, ?)', [ciclo, anio , fec_ini, fec_fin,req.user.id],(err,rows,fields) => {
        if(!err)
        {
            req.flash('Exito','Agregado correctamente');//MSG
            res.redirect('/links');
            
        }else{
            console.log(err);
        }
    } )
        
});


router.get('/add_periodo', ( req,res ) => {
    
    res.render('tablas/add_periodo');
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