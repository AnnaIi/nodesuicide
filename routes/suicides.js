const express = require('express');
const router = express.Router();
const suicideModel = require('../services/suicideModel');

/* GET suicides. */
router.get('/', async function(req, res, next) {
  try {
    res.json(await suicideModel.getSuicides());
  } catch (err) {
    console.error(`Error while getting suicide `, err.message);
    next(err);
  }
});
router.get('/s', function(req, res, next) {
    if (!req.session.loggedin){
      res.redirect('/login');
    }
    // const suicides = suicideModel.getSuicides()
    // console.log(suicides)
    // res.render('suicides', { title:'dff', suicides: suicides}
    suicideModel.getSuicides(req.query.person).then(
        data => {
            console.log(data);
            res.render('suicides', { title:data.data[0].name, suicides: data}
            );
            res.end()
        }
   )
  });
router.get('/p', function(req, res, next){
  if (!req.session.loggedin){
    res.redirect('/login');
  }
  id = false
  if (req.query.id){
    id = req.query.id;
  }
  suicideModel.getPersons(id).then(
    data => {
      console.log(data);
      var title = 'Самоубийцы'
      res.render('persons', { title:'Самоубийцы', persons: data}
      );
      res.end()
  } 
  )
}); 


module.exports = router;