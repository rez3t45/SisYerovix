const express = require('express');
const router = express.Router();

const pool_db = require('../database');
const { route } = require('.');
const pool = require('../database');


router.get('/add_ciclo', ( req,res ) => {
    
    res.render('tablas/add_ciclo');
});


router.get('/add_periodo', ( req,res ) => {
    
    res.render('tablas/add_periodo');
});



module.exports = router;