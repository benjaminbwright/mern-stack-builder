const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const exampleSchema = new Schema({
  // model fields
},{
  // ...options
})

const Example = mongoose.model("Example", exampleSchema);

module.exports = Example;