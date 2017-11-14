var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var companySchema = new Schema({
  companyname: String,
  employees: Array
});

var Company = mongoose.model('company', companySchema);

module.exports = Company;
