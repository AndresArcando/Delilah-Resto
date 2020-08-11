const router = require('express').Router();
const apiProductsRouter = require('./api/products');
const apiUsersRouter = require('./api/users');
const apiOrdersRouter = require('./api/orders');
const middleware = require('./api/middlewares');

router.use('/products', apiProductsRouter);
router.use('/users', apiUsersRouter);
router.use('/orders', apiOrdersRouter);

module.exports = router;

// middleware.checkToken
