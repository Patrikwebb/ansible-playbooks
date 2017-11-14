// Date formater
var dateFormat = require('dateformat');
var now = new Date();

// Express
var express = require('express');
var router = express.Router();

// MongoDB Model
var Company = require('../models/company');

// MongoDB Mongoose
var mongoose = require('mongoose');

// Routes
var company = ('/');
var companyAdd = ('/add');
var companyId = ('/id');
var companyPopulate = ('/populate');
var companyDrop = ('/drop');

// Returns all companies
router.get(company, function (req, res) {

  console.log('\nGET: /company ' + now);

  // get all the companies
  Company.find({}, function(err, company) {
    if (err) {
      console.log(err);
    } else{

      // object of all the companies
      console.log(company);

      res.send(company);
    }
  });

});

// Returns companies employees by ID
router.post(companyAdd, function(req, res){

  console.log('\nPOST: /company/add ' + now);

  console.log("Body: ");
  console.log(req.body);

  var company = req.body.company;

  // create a new company
  var newCompany = Company({
    companyname: company
  });

  // save the company
  newCompany.save(function(err) {
    if (err) throw err;

    console.log('Company created!');
  });
  res.send({company: "Added"});

});

// Returns all companies
router.post(companyId, function (req, res) {

  console.log('\nGET: /company/id ' + now);
  console.log("Body: ");
  console.log(req.body.companyId);

  // var companyId = JSON.stringify(req.body.companyId);
  var companyId = req.body.companyId;

  // // get all the companies
  Company.findById({ _id: companyId }, function(err, company) {
    if (err) throw err;

    // object of all the companies
    console.log(company.employees);

    res.send(company.employees);
  });

});

// Populate companies
router.get(companyPopulate, function (req, res) {

  console.log('\nGET: /company/populate ' + now);

  // create a new company
  var newCompany = Company({
    companyname: 'Volvo',
    employees: [{
        "username": "Johanna"
      },
      {
        "username": "Liesl"
      },
      {
        "username": "Louice"
      }
    ]
  });

  // save the company
  newCompany.save(function(err) {
    if (err) throw err;

    console.log('Company Volvo created!');
  });

  // create a new company
  var newCompany2 = Company({
    companyname: 'ÅF',
    employees: [{
        "username": "Erik"
      },
      {
        "username": "Sandra"
      },
      {
        "username": "Johan"
      }
    ]
  });

  // save the company
  newCompany2.save(function(err) {
    if (err) throw err;

    console.log('Company ÅF created!');
  });
  res.send({db: "populated"});
});

// Drop companies docs
router.get(companyDrop, function (req, res) {

  res.setHeader('Content-Type', 'application/json');

  console.log('\nGET: /company/drop ' + now);
  console.log('Database dropped');
  mongoose.connection.db.dropDatabase();

  res.send({db: "dropDatabase"});
});

module.exports = router;
