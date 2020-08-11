const jwt = require('jwt-simple');
const secretKey = require('./secretKey');

const checkToken = (req, res , next) => {

    if(!req.headers['user-token']){
        return res.status(404).json({ error: 'Incluir el user token en el header.'});
    }

    const userToken = req.headers['user-token'];
    let payload = {};

    try{
        payload = jwt.decode(userToken, secretKey);
    } catch (err){
        return res.json({error: 'Token Incorrecto.'});
    }

    req.usuarioId = payload.usuarioId;
    next();
};

const isAdmin = (req, res, next) => {
    const admin = req.body.admin
    if(!admin === 123123)
    return res.json('Usuario no autorizado.');
    next();
}

module.exports = {
    checkToken: checkToken,
    isAdmin: isAdmin
}