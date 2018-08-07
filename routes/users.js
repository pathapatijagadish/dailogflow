var express = require('express')
var app = express()

// Users getting SignUp form
app.get('/signup', function(req, res, next) {
	res.render('user/signup', {
		title: 'Questions List', 
		data: "test"
	})
})

// Users post SignUp form
app.post('/signup', function(req, res, next){	
	var post  = req.body;
	var user_params = {
	  name: post.name,
	  password: post.password,
	  email: post.email
	}
	req.getConnection(function(error, conn) {
    conn.query("INSERT INTO users SET ?", user_params, function(err, result) {
			res.render('index', {title: 'My Training Module', req: req})
    });
	})
})

// Users getting SignIn from
app.post('/signin', function(req, res, next){	
	var post  = req.body;
	var name = post.user_name;
	var password = post.password;
	req.getConnection(function(error, conn) {
		var sql="SELECT * FROM `users` WHERE `name`='"+name+"' and password = '"+password+"'";
    conn.query(sql, function(err, user) {
    	if (user.length == 0) {
					req.flash('error', err)
					
					// render to views/user/add.ejs
					res.render('user/signin', {
						title: 'Add New Question'
					})
				} else {
					req.session.user = user;
					req.flash('success', 'Data added successfully!')
					
					// render to views/user/add.ejs
					return res.redirect('/');
				}
    });
	})
})

// Users post SignIn form
app.get('/signin', function(req, res, next) {
	res.render('user/signin', {
		title: 'Questions List', 
		data: "test"
	})
})

// Users Logout from
app.get('/logout', function(req, res, next) {
	req.session.user = null 
	if(req.session.user)
	{ 
	} else { 
		return res.redirect('/');
	} 
})


module.exports = app
