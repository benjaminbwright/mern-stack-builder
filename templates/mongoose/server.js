// dependencies
const express = require("express");
const mongoose = require("mongoose");

// app & port
const app = express();
const PORT = process.env.PORT || 4000;

// add database connections here
mongoose.connect(process.env.MONGODB_URI || "mongodb://localhost/exampleDatabase", {
  useNewUrlParser: true,
  useUnifiedTopology: true
});

// add middlewares here
app.use(express.static("client/build"));

// add routes here

// start the server
app.listen(() => console.log(`App is running on port ${PORT}`));