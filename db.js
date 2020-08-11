const Sequelize = require("Sequelize");
const bcrypt = require("bcryptjs");

const sequelize = new Sequelize("pq62kb3Ld3", "pq62kb3Ld3", "vvEJOEEaFk", {
  host: "remotemysql.com",
  dialect: "mysql",
});

const UserModel = require("./models/users.model");
const User = UserModel(sequelize, Sequelize);

const ProcutModel = require("./models/products.model");
const Product = ProcutModel(sequelize, Sequelize);

const OrderModel = require("./models/orders.model");
const Order = OrderModel(sequelize, Sequelize);

// const StatusModel = require('./models/status.model');
// const Status = StatusModel(sequelize, Sequelize);

// const orderProdModel = require('./models/order-products.model');
// const productsModel = require('./models/products.model');
// const OrdProd = orderProdModel(sequelize, Sequelize);

sequelize
  .sync({ force: true }) // True for drop and resync db.
  .then(() => {
    console.log("Tablas sincronizadas.");
    createProductDefault();
    createUserDefault();
    createOrderDefault();
  });

// Carga datos a bd.

Product.belongsToMany(Order, { through: "order-products" });
Order.belongsToMany(Product, { through: "order-products" });

User.hasMany(Order);
Order.belongsTo(User);

// Defaults User, Product
function createUserDefault() {
  User.create({
    username: "Admin",
    name: "root",
    lastname: "babe",
    email: "admin@baberoot.com",
    phone: "351235",
    direction: "holliwood 123",
    password: bcrypt.hashSync("123qwe", 8),
    admin: "123123",
  }),
    User.create({
      username: "JohnDoe",
      name: "John",
      lastname: "Doe",
      email: "JohnDoe@baberoot.com",
      phone: "354235",
      direction: "holliwood 123",
      password: bcrypt.hashSync("123qwe", 8),
    }),
    User.create({
        username: "2JohnDoe",
        name: "2John",
        lastname: "2Doe",
        email: "2JohnDoe@baberoot.com",
        phone: "364235",
        direction: "holliwood 123",
        password: bcrypt.hashSync("123qwe", 8),
      });
}

function createProductDefault() {
  Product.create({
    name: "Lomo Pizza",
    price: "300",
    stock: 1,
  });
  Product.create({
    name: "Burger Queen",
    price: "500",
    stock: 1,
  });
  Product.create({
    name: "Tomacco",
    price: "800",
    stock: 1,
  });
}

function createOrderDefault(){
    Order.create({
        status: "Pending",
        price: 300,
        pay_method: "cash",
        userId: 2,
        productId: 1,
    }),
    Order.create({
        status: "Pending",
        price: 500,
        pay_method: "cash",
        userId: 3,
        productId: 2,
    })
}

module.exports = {
  Product,
  User,
  Order,
};
