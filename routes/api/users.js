const router = require("express").Router();
const bcrypt = require("bcryptjs");
const { User } = require("../../db");
const { check, validationResult } = require('express-validator');
const jwt = require("jwt-simple");
const secretKey = require('./secretKey'); // Llave secreta sssshhhhh
const middleware = require('./middlewares');

router.get("/", middleware.checkToken, middleware.isAdmin, async (req, res) => {
  const users = await User.findAll();
  res.status(200).json(users);
});

router.post("/register", [
    check('username', 'Nombre de usuario obligatorio').not().isEmpty(),
    check('password', 'Debes ingresar un password correcto').not().isEmpty(),
    check('email', 'El email debe ser valido').isEmail()
], async (req, res) => {

    const errors = validationResult(req);
    if (!errors.isEmpty()){
        return res.status(422).json({ errores: errors.array()})
    }

  req.body.password = bcrypt.hashSync(req.body.password, 8);
  const user = await User.create(req.body);
  res.status(200).json(user);
});

router.post("/login", async (req, res) => {
  const user = await User.findOne({ where: { email: req.body.email } });
  if (user) {
    const compare = bcrypt.compareSync(req.body.password, user.password);
    if (compare) {
      res.status(200).json({ success: createToken(user) });
    } else {
      res.status(401).json({ error: "Usuario o clave incorrecta" });
    }
  } else {
    res.status(401).json({ error: "Usuario o clave incorrecta" });
  }
});

router.put("/:userId", middleware.checkToken, async (req, res) => {
  await User.update(req.body, {
    where: { id: req.params.userId },
  });
  res.status(200).json({ success: "Modificado correctamente." });
});

router.delete("/:userId", middleware.isAdmin, async (req, res) => {
  await User.destroy({
    where: { id: req.params.userId },
  });
  res.status(200).json({ success: "Usuario borrado correctamente." });
});

const createToken = (user) => {
  const payload = {
    usuarioId: user.id
    // password: user.password,
  };
  return jwt.encode(payload, secretKey);
};


module.exports = router;
