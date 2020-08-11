const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const apiRouter = require('./routes/api')
const morgan = require('morgan');

require('./db');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(morgan('dev'));

app.listen(3000, () => {
  console.log("Servidor iniciado en puerto 3000");
});

app.get("/", (req, res) => {
  res.send("Api Delilah.");
});

app.use('/api', apiRouter);