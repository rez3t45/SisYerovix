const Passport = require('passport');
// Uzaremos autentificacion local en este caso -- Esto usan para fb,google Signup
const localStrategy = require('passport-local').Strategy;

const pool = require('../database');//para Conecciones Mysql
const helpers = require('../lib/helpers'); //Insancio para usar PwdCrypt


Passport.use('local.sigin', new localStrategy({
    usernameField: 'usu',
    passwordField: 'pwd',
    passReqToCallback: true //--> No lo necesito
}, async(req,usu,pwd, done) => {

    /*     
    console.log(req.body);  
    console.log(user);
    console.log(pwd);
    */

    const rows_u = await pool.query('CALL Tsp_Login (?, ?)', [usu,pwd] );

    console.log(rows_u);
    
    if(rows_u[0].length > 0){
        const Rusu = rows_u[0][0];      
        done(null,Rusu,req.flash('Exito',null ));
        
    }else{
        return done(null,false,req.flash('Mensaje','Credenciales Incorrectas, verifique Usuario y/o Contraseña'));
    }

}));


Passport.use('local.signup', new localStrategy(

    {
    usernameField: 'usu', // username = name en el html signup.hbs
    passwordField: 'pwd',
    passReqToCallback: true //-> Permitira recojer otros atributos del body
    }, 

    async (req, usu, pwd, done) => 
    {
        const {id_colaborador,id_perfil} = req.body;

        const newUser =  {usu,pwd};
    
        await pool.query('CALL Tsp_Insert_Usuarios (?, ?, ?, ?)', [newUser.usu,pwd,id_colaborador,id_perfil] );

        const Rmax = await pool.query('call Tsp_Max_id_Usu ');    
        //console.log(Rmax)
        const Rusu = Rmax[0][0]; 
        //console.log(Rusu.id_usu)

        newUser.id_usu = Rusu.id_usu; 
        return done(null,newUser);

    }

));

// EXPLAIN : https://www.it-swarm.dev/es/node.js/entender-pasaporte-serializar-deserializar/1050241925/

//Creara la Sesion del Usuario Registrado 
Passport.serializeUser( ( user, done) => {
    done(null, user.id_usu); //-> user.id_usuario (fila.columna_en_BD )
} );

//?
Passport.deserializeUser( async(id,done) => {
    const rows = await pool.query('Select * from usuarios where id_usu = ?',[id]);   
    //-> AQI Manda todo a Sesion : Ses_usu , por lo cual todos estos datos de SELECT  seran siempre visibles.

    //const rows = pool.query('CALL Tsp_Insert_Usuarios (?, ?, ?, ?)', [newUser.usu,pwd,id_colaborador,id_perfil] )
    done(null, rows[0]);
}); 


