const router = require("express").Router();
const middleware = require('./middlewares');

const { Order } = require("../../db");

router.get("/", middleware.isAdmin, middleware.checkToken, async (req, res) => {
  const orders = await Order.findAll();
  res.status(200).json(orders);
});

router.post("/", middleware.checkToken, async (req, res) => {
  const order = await Order.create(req.body);
  res.status(200).json(order);
});

router.put("/:orderId", middleware.isAdmin, middleware.checkToken, async (req, res) => {
  await Order.update(req.body, {
    where: { id: req.params.orderId }
  });
  res.status(200).json({ success: 'Modificado correctamente.'})
});

router.delete('/:orderId', middleware.isAdmin, middleware.checkToken, async (req, res)=> {
    await Order.destroy({
        where: {id: req.params.orderId}
    });
    res.status(200).json({ success: 'Orden borrada correctamente.'})
})
module.exports = router;
