	
var  Auth = { is_login: function (req, res, next) 
 								{ 
								 	if (!req.session.user) 
								 	{ 
								 		res.locals.user = req.session.user;
										return res.redirect('/users/signin'); 
									} 
									next(); 
								},
							}; 

module.exports = Auth;