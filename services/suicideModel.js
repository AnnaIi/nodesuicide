const db = require('./db');
const helper = require('../helper');
const config = require('../config');
const { NotFound } = require('http-errors');

async function getSuicides(person_id){
    const rows = await db.query(
        `SELECT suicide_suicide.description AS sdescription, suicide_person.*,
        suicide_method.description AS mdescription, suicide_tool.description AS tdescription 
        FROM suicide_suicide
        LEFT JOIN suicide_person ON suicide_suicide.person_id=suicide_person.id
        LEFT JOIN suicide_method ON suicide_suicide.method_id=suicide_method.id
        LEFT JOIN suicide_tool ON suicide_suicide.tool_id=suicide_tool.id
        WHERE suicide_suicide.person_id=?
        `, 
        [person_id]
      );
    const data = helper.emptyOrRows(rows);
    return {
        data
    }
}
async function getPersons(id){
    var query = 'SELECT * FROM suicide_person'
    var params = []
    if (id)
    {
        query += ' WHERE id=?';
        params =[id]
    } 
    const rows = await db.query(
        query, 
        params
      );
    const data = helper.emptyOrRows(rows);
    return {
        data
    }
}
module.exports = {
    getSuicides, getPersons
  }