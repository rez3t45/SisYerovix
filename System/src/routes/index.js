const express = require('express');
const router = express.Router();

router.get('/', (req,res) =>{
    //res.send('Hola mundaa');
    //res.redirect('../signup')
    res.render('index');
})

module.exports = router;