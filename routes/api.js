var express = require('express');
var router = express.Router();
const knex = require('../dbconfig').knex;
var sanitizer = require("string-sanitizer");

async function doesShiftBelongToGroup(shiftGroupCode,shiftCode)
{
    try 
    {
        const resultset =  await knex.select('id').distinct().from('shift_grouping').where('shift_group_code',shiftGroupCode).andWhere('shift_code',shiftCode).returning().then(result => {return result});
        if(resultset.length >0) //check if there exists a record
        {
            return true;
        }
        return false;
    } 
    catch (e) 
    {
        console.log(e);
        var msg = "Failed to check shift status, contact administrator";
        res.render('error', { message: msg,error :e });
    } 
}
router.post('/checkshift', async function (req, res, next) {
    try {
        if (!req.query.api) {
        var rawshiftCode = req.body.shiftCode;
        var rawshiftGroupCode = req.body.shiftGroupCode;
        var shiftCode = sanitizer.sanitize(rawshiftCode); // remove spaces and special characters
        var shiftGroupCode = sanitizer.sanitize(rawshiftGroupCode);
        var answer = await doesShiftBelongToGroup(shiftGroupCode,shiftCode);
        var result ={}; //wrap for response
        result.code = shiftCode;
        result.group = shiftGroupCode;
        result.status = answer;
        res.render('index2',page = {"data": result });
      }
    }
    catch (e) 
    {
        console.log(e);
        var msg = "Failed to retrieve shift status, contact administrator";
        res.render('error', { message: msg,error :e });
    }
});

module.exports = router;