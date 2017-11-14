
// MongoDB Model
var Company = require('../models/company');

// MongoDB Mongoose
var mongoose = require('mongoose');

function findCompany(name, companyName){

  Company.find( { 'companyName': companyName }, '_id', function(err, companyId){
    console.log("\nLook if company name already exsist");
    if(err){
      console.log(err);
      // throw err;
    }
      if(companyId){
        console.log("Found company:");
        var id = (""+companyId);
        console.log(id);

        // Add username object to embedded employees object
        Company.update( id,
          {
            $push: {
              employees: {
                $each: [ { username: name } ]
              }
            }
          }
        );
        console.log("Company updated: " + companyId);

        return Company;
      }

  });
}
