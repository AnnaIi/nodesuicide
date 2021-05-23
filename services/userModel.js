const db = require('./db');
const helper = require('../helper');
const config = require('../config');
const { NotFound } = require('http-errors');

function login(username, password){
    if (!username || !password){
        return 'NotFound'
    } 
    const rows = db.query(
        'SELECT * FROM accounts WHERE username = ? AND password = ?', [username, password]
      );
    if (!rows){
        return 'NotFound'
    }
    else{
        return username
    }

}
module.exports = {
    login
  }