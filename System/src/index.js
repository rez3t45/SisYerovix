const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const path = require('path');
const { execArgv } = require('process');
const flash = require('connect-flash');// Para mensajitos de aviso al usuario
const session = require('express-session');
const MySqlStore = require('express-mysql-session');



//Iniziar 
const app = express();
require('./lib/passport'); // inizialimaos

//----------------------------------------------
//--Settings Configuraciones
//----------------------------------------------
app.set('port', process.env.PORT || 4000); //-> TOma el puerto del sistema si no tomara el 4000

app.set( 'views', path.join(__dirname, 'views')); //-> Ubica la carpeta views en el proyecto

app.engine('.hbs', exphbs({ 
    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'), 'layouts'),//- Ubica el archivo main de la carpeta layout
    partialsDir: path.join(app.get('views'), 'partials'),
    extname: '.hbs'//, // archivos handlebars tendran la extension .hbs
    //helpers: require('./lib/handlebars')
}));

app.set('view engine', '.hbs'); // run hbs

//----------------------------------------------
// Middlewares
//----------------------------------------------
const {database} = require('./keys'); // Instancio objeto database donde se almacenan los datos de acceso a la Base de datos
const passport = require('passport');

app.use(session({
    secret: 'ThisMySecretPfXD',
    resave: false,
    saveUninitialized: false,
    store: new MySqlStore(database)
}))

app.use(flash());
app.use(morgan('dev')); //-> Permite ver resultados x consola
app.use(express.urlencoded({extended: false})); // Comunicacion con el form de datos string int , etc
app.use(express.json());
app.use(passport.initialize());//Para el Login
app.use(passport.session());//passport need a session

//----------------------------------------------
//Global Variables
//----------------------------------------------
app.use((req,res,next) => { //- Permitira el uso de Variables

    app.locals.Msg_Exito = req.flash('Exito');// Exito fue lo que defini en links.js al grabar
    app.locals.Msg_ = req.flash('Mensaje');
    app.locals.Ses_usu = req.user;
    next();
})

//----------------------------------------------
// Rutas
//----------------------------------------------
app.use(require('./routes')); //-> automaticamente ejecutara el index.js de esa carpeta 
    // aprox min 28:57 (video)
app.use(require('./routes/authentication')); 
app.use('/SysTraDoc',require('./routes/SysTraDoc')); //*HERE***********

//----------------------------------------------
// Public
//----------------------------------------------
app.use(express.static(path.join(__dirname,'public')));

//----------------------------------------------
// Starting the server
//----------------------------------------------
app.listen(app.get('port'), () => {
    console.log('servidor en el port', app.get('port'))
} );

