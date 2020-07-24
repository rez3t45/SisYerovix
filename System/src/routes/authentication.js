const express = require('express');
const router = express.Router();

const passport = require('passport');

const { EstasLogeado,isNotLogeado } = require('../lib/auth'); // SOlo instancio esta funcion ESTASLOGEADO y isNotLogeado

// signup = RUTA en enavegador
router.get('/signup', isNotLogeado, ( req,res ) => {   
    res.render('auth/signup'); // Renderiza este archivo
});

router.post('/signup', isNotLogeado, passport.authenticate('local.signup', {
   
        successRedirect: '/profile',
        failureRedirect: '/signup',
        failureFlash: true  

}));

router.get('/sigin',isNotLogeado, (req,res) => {
    res.render('auth/login');
});

router.post('/sigin', isNotLogeado, (req,res,next) => {

    passport.authenticate('local.sigin', {
    successRedirect: '/profile',
    failureRedirect: '/sigin',
    failureFlash: true
    })(req,res,next)

});


//                    SOlo es accesible si el usuario esta logeado (funcion establecida en lib/auth)
router.get('/profile', EstasLogeado , (req,res) => {
    
    res.render('profile');

});

router.get('/logout', (req,res) => {
    req.logOut();
    res.redirect('/sigin');
})


module.exports = router;