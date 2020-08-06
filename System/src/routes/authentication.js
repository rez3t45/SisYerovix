const express = require('express');
const router = express.Router();

const passport = require('passport');

const { EstasLogeado,isNotLogeado } = require('../lib/auth'); // SOlo instancio esta funcion ESTASLOGEADO y isNotLogeado


router.get('/signup', ( req,res ) => {    

    res.render('Seguridad/add_usuario',{layout: 'main_log'});

});

router.post('/signup', passport.authenticate('local.signup', {
   
    successRedirect: '/profile',
    failureRedirect: '/signup',
    failureFlash: true  

})); 

router.get('/login', (req,res) => {
    
    res.render('Seguridad/login', {layout: 'main_log'});

});

router.post('/login',  (req,res,next) => {

    passport.authenticate('local.sigin', {
    successRedirect: '/profile',
    failureRedirect: '/login',
    failureFlash: true
    })(req,res,next)

});



/*************************************************** */
//****************** END *************************** */


//                    SOlo es accesible si el usuario esta logeado (funcion establecida en lib/auth)
router.get('/profile', EstasLogeado , (req,res) => { 
    
    res.render('profile');

});

router.get('/logout', (req,res) => {
    req.logOut();
    res.redirect('/login');
})


module.exports = router;