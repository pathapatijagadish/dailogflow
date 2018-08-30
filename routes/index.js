var express = require('express')
var app = express()
var authentication_mdl = require('../middlewares/authentication');

app.get('/', authentication_mdl.is_login, function(req, res) {
	// render to views/index.ejs template file
	console.log(req.session.user);
	res.render('index', {title: 'My Training Module', req: req })
})

/** 
 * We assign app object to module.exports
 * 
 * module.exports exposes the app object as a module
 * 
 * module.exports should be used to return the object 
 * when this file is required in another module like app.js
 */ 
module.exports = app;
