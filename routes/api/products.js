const router = require("express").Router();
const { Product } = require("../../db");
const middleware = require('./middlewares');

router.get("/", async (req, res) => {
  const products = await Product.findAll();
  res.status(200).json(products);
});

router.post("/", middleware.isAdmin, middleware.checkToken, async (req, res) => {
  const product = await Product.create(req.body);
  res.status(200).json(product);
});

router.put("/:productId", middleware.isAdmin, middleware.checkToken, async (req, res) => {
  await Product.update(req.body, {
    where: { id: req.params.productId }
  });
  res.status(200).json({ success: 'Modificado correctamente.'})
});

router.delete('/:productId', middleware.isAdmin, middleware.checkToken, async (req, res)=> {
    await Product.destroy({
        where: {id: req.params.productId}
    });
    res.status(200).json({ success: 'Producto borrado correctamente.'})
})
module.exports = router;
