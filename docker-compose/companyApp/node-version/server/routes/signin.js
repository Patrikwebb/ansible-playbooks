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
var signin = ('/');

// Sing in and saves name & company to mongoDB (No authentcation)
router.post(signin, function(req, res){

  console.log('\nPOST: /signin ' + now);

  console.log("Body: ");
  console.log(req.body);

  var name = req.body.name;
  var company = req.body.company;

  // create a new company
  var newCompany = Company({
    companyname: company,
    employees: [{
      "username": name
    }]
  });

  // save the company
  newCompany.save(function(err) {
    if (err) throw err;

    console.log('Company created!');
  });
  res.send({login: "Signed in"});

});

module.exports = router;
