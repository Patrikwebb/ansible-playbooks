// Express
var express = require('express');
var app = express();
var filesystem = require('fs');
var bodyParser = require('body-parser');

// Date formater
var dateFormat = require('dateformat');
var now = new Date();

// Routes
var singin = require('./routes/signin');
var company = require('./routes/company');

// MongoDB Model
var Company = require('./models/company');

// MongoDB Mongoose
var mongoose = require('mongoose');

// Headers options
var corsHeaders = function (req, res, next) {
  // For: No 'Access-Control-Allow-Origin
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET', 'POST');
  res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
  res.setHeader('Access-Control-Allow-Credentials', true);

  res.setHeader('Content-Type', 'application/json');

  next();
};

// MongoDB connection
mongoose.connect('mongodb://localhost/companyapp');

var db = mongoose.connection;
db.on('error', console.error.bind(console, 'connection error:'));
db.once('open', function() {
  console.log("Connected to mongo");
});

// Cors && Headers
app.use(corsHeaders);
app.use(bodyParser.json());
app.use(bodyParser.urlencoded());

// Routing
app.use('/signin', singin);
app.use('/company', company);

app.listen(3040, function () {
  console.log('Server listening on port 3040!');
});
