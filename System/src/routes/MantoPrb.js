const express = require('express');
const router = express.Router();

const pool_db = require('../database');
const { route } = require('.');
const pool = require('../database');

const { EstasLogeado } = require('../lib/auth'); // SOlo instancio esta funcion ESTASLOGEADO


//-------- Aqui se establece el nombre /add (cualkier nombre puede ser) como link que sera accesible en la web
router.get('/add',EstasLogeado, ( req,res ) => {
    //res.send('Formulario D:');
    res.render('links/add');
});

router.post('/add', EstasLogeado, async (req,res) => {

    /*console.log(req.body); */ //-> Recupero datos del body

    // Atributos Name en el body add.hbs
    const {  title, url , description} = req.body;

    //Creando un OBJETO
    const newDato = {
        title, //Estos nombres coincide con las columnas de la tabla LINKS
        url,
        description,
        user_id: req.user.id
    };
    
    //console.log(newDato);

    await pool.query('INSERT INTO links set ?', [newDato]);
    req.flash('Exito','Agregado correctamente');//MSG
    res.redirect('/links'); 

    
});

// '/links' ?
router.get('/', EstasLogeado, async (req,res) => {
    const lista_Links = await pool.query('Select * from links where user_id = ?',[req.user.id]);
    //console.log(lista_Links);
    res.render('links/list', {lista_Links} );
} );


//Cuando me envien a la ruta delete con el parametro ID lo eliminare
router.get('/delete/:id', EstasLogeado, async(req,res) => {
    
    /*
    console.log('Parametro recuperado id=' + req.params.id);
    res.send('Borrando id=' + req.params.id );
    */

    const {id} = req.params;
    await pool.query('Delete from links where id = ?',[id]);
    req.flash('Exito','Registro borrado OK');
    res.redirect('/links');

});

router.get('/edit/:id', EstasLogeado, async(req,res) => {
    const {id} = req.params;
    //console.log('Editando el ID=' + [id]);
    const lista_recuperada = await pool.query('Select * from links Where id=?',[id]);
    //console.log(lista_recuperada);
    //console.log(lista_recuperada[0]);
    res.render('links/edit',{dato_: lista_recuperada[0]})
    

});

router.post("/edit/:id", EstasLogeado,async(req,res) => {
    const {id} = req.params;
    
    const {title, url, description} = req.body;
    
    const updDato = {
        title,
        url,
        description,
        user_id: req.user.id
    };
    /*console.log(req.body); 
    console.log(' id es : ',[id] ); 
    */
    //console.log(updDato);    
    await pool.query('Update links set ? where id = ?',[updDato,id]);
    req.flash('Exito','Registro Actualizado Correctamente');
    res.redirect('/links');
});

router.get('/BuscarSP_ME',EstasLogeado, async ( req,res ) => {
 
    res.render('links/Me_buscarSP' );
    
});

router.post("/BuscarSP_ME", EstasLogeado,async(req,res) => {

    
    //console.log(req.body); 
    const {idUsu} = req.body;

    /* OK SIRVE
    const lista_Links = await pool.query('call Tsp_Lista_links_x_usu (?)', [idUsu]);
    const rows = lista_Links[0]; 
    res.render('links/Me_buscarSP', {rows} );

    //res.json(lista_Links[0]);
    */
            
       if( !isNaN(idUsu) ) // VALIDO SI ES NUMERO
       {
            //console.log('ES Numero');

            await pool.query('call Tsp_Lista_links_x_usu (?)', [idUsu],(err,rows,fields) => {
            if(!err)
            {
                const dt = rows[0]; 
                res.render('links/Me_buscarSP', {dt} );
            }else{console.log(err);}

            });

        }else
        {            
            console.log('Valor Ingresado como letra... ( routes/links.js POST /BuscarSP_ME )');
        }    
    
});

router.get('/add_ME',EstasLogeado, ( req,res ) => {
    //res.send('Formulario D:');
    res.render('links/Me_addSP');
});

router.post('/add_ME', EstasLogeado, async (req,res) => {

    /*console.log(req.body); */ //-> Recupero datos del body

    // Atributos Name en el body add.hbs
    const {  title, url , description} = req.body;
  
    await pool.query('CALL Tsp_insert_link (?, ?, ?, ?)', [title,url,description,req.user.id],(err,rows,fields) => {
        if(!err)
        {
            req.flash('Exito','Agregado correctamente');//MSG
            res.redirect('/links');
            
        }else{
            console.log(err);
        }
    } );
 

    
});



module.exports = router;