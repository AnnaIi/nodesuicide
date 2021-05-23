const express = require('express');
const router = express.Router();
const user = require('../services/userModel')
/* GET home page. */
router.get('/', function(req, res, next) {
  if (req.session.loggedin){
    res.redirect('/suicides');
  }
  else{
    res.render('login', { title: 'Авторизация' });}
});
router.post('/', function(req, res, next){
    const username = req.body.username;
	  const password = req.body.password;
    const title = user.login(username, password);
    if (title == 'NotFound'){
      res.render('login', { title: 'Incorrect Username and/or Password!'});
    }
    else {
      req.session.loggedin = true;
			req.session.username = username;
			res.redirect('/suicides/p');
    }
});
router.get('/logout', function(req, res, next){
  req.session.loggedin = false;
  req.session.username = '';
  res.redirect('/');
});

module.exports = router;
