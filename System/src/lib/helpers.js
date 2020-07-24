const bcrypt = require('bcryptjs');
const helpers = {};

//---- ENCRIPTAR PWD
helpers.encryptPassword = async(password_) => {
    const salt_FuerzaCrypt =  await bcrypt.genSalt(10);//numero 10 en fuerza
    const Pwd_cifrado = await bcrypt.hash(password_,salt_FuerzaCrypt);
    return Pwd_cifrado;
};

//--- COMPARA PWD - DESCIFRA
helpers.matchPassword = async(password_,pwd_guardada) => {
    //await bcrypt.compare(password_,pwd_guardada);
    try{
        return await bcrypt.compare(password_,pwd_guardada);

    }catch(e){
        console.log(e);
    }
};


module.exports = helpers;