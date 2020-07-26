const Passport = require('passport');
// Uzaremos autentificacion local en este caso -- Esto usan para fb,google Signup
const localStrategy = require('passport-local').Strategy;

const pool = require('../database');//para Conecciones Mysql
const helpers = require('../lib/helpers'); //Insancio para usar PwdCrypt


Passport.use('local.sigin', new localStrategy({
    usernameField: 'username',
    passwordField: 'password',
    passReqToCallback: true //--> No lo necesito
}, async(req,user,pwd, done) => {
    
    /*
    console.log(req.body)
    console.log(user)
    console.log(pwd)
    */

    const rows_u = await pool.query('Select * from usuarios where usu = ?', [user]);

    if(rows_u.length > 0){
        const usu = rows_u[0];//obtengo valor de la tabla / fila
        const validarPWD = await helpers.matchPassword(pwd, usu.password );

        if(validarPWD) {
            done(null,usu,req.flash('Exito',null /*'Bienvenido ' + usu.username*/));
        }else{
            done(null,false,req.flash('Mensaje','Contraseña Incorrecta'));
        }
    }else{
        return done(null,false,req.flash('Mensaje','Usuario no encontrado en la BD'));
    }
}));



Passport.use('local.signup', new localStrategy(
    {
    usernameField: 'username', // username = name en el html signup.hbs
    passwordField: 'password',
    passReqToCallback: true //-> Permitira recojer otros atributos del body
    }, 
    async (req, username, password, done) => {
    //console.log(req.body);

    const {fullname} = req.body;

    const newUser = {
        username,// Username: username -> pero lo simplificamos poniendo solo username
        password,
        fullname    };    

    //-->Cifraremos la Contraseña desde aqui
    newUser.password = await helpers.encryptPassword(password);
    /*
    const p = await helpers.encryptPassword(password);
    console.log(p);
    */

    const result = await pool.query('Insert into users set ?', newUser);
    //console.log(result);

    newUser.id = result.insertId; // agrego al array el dato del ID generado en BD

    return done(null,newUser);
    }
));

//Creara la Sesion del Usuario Registrado 
Passport.serializeUser( ( user, done) => {
    done(null, user.id);
} );

//?
Passport.deserializeUser( async(id,done) => {
    const rows = await pool.query('Select * from usuarios where id_usuario = ?',[id]);
    done(null, rows[0]);

});


