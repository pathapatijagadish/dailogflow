var express = require('express')
var app = express()
// var Client = require('node-rest-client').Client; 
// var client = new Client();
// var querystring = require('querystring');
var unirest = require('unirest');
var authentication_mdl = require('../middlewares/authentication');
var session_store;

// SHOW LIST OF QUESTIONS
app.get('/', authentication_mdl.is_login, function(req, res, next) {
	req.getConnection(function(error, conn) {
		conn.query('SELECT * FROM questions WHERE intent is null ORDER BY id DESC',function(err, rows, fields) {
			if (err) {
				req.flash('error', err)
				res.render('index', {
					req: req
				})
			} else {				
				res.render('questions/list', {
					req: req,
					data: rows
				})
			}
		})
	})
})

// SHOW ADD QUESTION FORM
app.get('/add', function(req, res, next){	
	res.render('questions/add', {
		req: req
	})
})

app.post('/add_response', function(req, res) {
	// render to views/index.ejs template file
	var que_params = req.body
  var intent = que_params['intent']
  var query = que_params['query']
  var responses = que_params['responses']
  var intent_id = que_params['intent_id']
  var response = que_params['response']
	var intent_data = 	{
													"name": intent,
													"priority": 500000,
													"responses": [
														{
												  		"defaultResponsePlatforms": {
												    	"google": true
												  	},
												  	"messages": [
												    		{
											      			"speech": [ responses, response ],
											      			"type": 0
												    		}
												  		]
														}
													],
													"webhookForSlotFilling": false,
													"webhookUsed": false
												}
			var query_str = 'https://api.dialogflow.com/v1/intents/' + intent_id + '?v=20150910&lang=en'
			console.log(query_str);
			unirest.put(query_str)
			.headers({'Authorization': 'Bearer ab71232a07a24e30a93a1f841d7b11d3', 'Content-Type': 'application/json'})
			.send(intent_data)
			.end(function (response) {
				console.log(response.body);
				console.log("success")
			});
})


// SHOW INTENT CREATION
app.post('/add/intent', function(req, res){	
	var params = JSON.stringify(req.body);
    var que_params = JSON.parse(params);
    var que_id = que_params['que_id']
    var que_intent = que_params['intent']
    req.getConnection(function(error, conn) {
    	sql = 'select * from questions where id = ?'
		conn.query(sql, que_id,function(err, rows, fields) {
			var id = rows[0].id;
			var question = rows[0].question;
			var answer = rows[0].answer;
			var intent_data = 	{
					  								"contexts": [],
														"events": [],
														"fallbackIntent": false,
														"name": que_intent,
														"priority": 500000,
														"responses": [
															{
														  		"defaultResponsePlatforms": {
														    		"google": true
														  		},
														  		"messages": [
														    		{
														      			"speech": answer,
														      			"type": 0
														    		}
														  		]
															}
														],
														"userSays": [
															{
														  		"count": 0,
														  		"data": [
														    		{
														      			"text": question
														    		},
														    		{
														      			"userDefined": true
														    		}
														  		]
															}
														],
														"webhookForSlotFilling": false,
														"webhookUsed": false
													}
			unirest.post('https://api.dialogflow.com/v1/intents?v=20150910')
			.headers({'Authorization': 'Bearer ab71232a07a24e30a93a1f841d7b11d3', 'Content-Type': 'application/json'})
			.send(intent_data)
			.end(function (response) {
				console.log(response.body);
				conn.query('UPDATE questions SET intent = ?, intent_id = ? WHERE id= ? ', [ que_intent, response.body['id'], que_id ], function(err, user) {
					res.send(user);
				});
			});
		})
	})
})

// ADD NEW Question POST ACTION
app.post('/add', function(req, res, next){
	req.assert('question', 'Query is required').notEmpty()
	req.assert('answer', 'Response is required').notEmpty()
	var errors = req.validationErrors()
  if( !errors ) { 
  	let query_condition = ""
  	var que = req.body.question
  	var answer = req.body.answer
 		unirest.post('https://api.dialogflow.com/v1/query?v=20150910')
		.headers({'Authorization': 'Bearer ab71232a07a24e30a93a1f841d7b11d3', 'Content-Type': 'application/json'})
		.send({ "lang": "en", "query": que, "sessionId": 1234 })
		.end(function (response) {
		 	var query_condition = response.body["result"]["action"]
		 	var in_id = response.body["result"]["metadata"]["intentId"]
		 	if(query_condition == "input.unknown"){
				var question = {
					question: req.sanitize('question').escape().trim(),
					answer: req.sanitize('answer').escape().trim()
				}
				req.getConnection(function(error, conn) {
					conn.query('INSERT INTO questions SET ?', question, function(err, result) {
						if (err) {
							req.flash('error', err)
							res.render('questions/add', {
								title: 'Add New Question',
								question: question.question,
								req : req,
								answer: question.answer
							})
						} else {				
							req.flash('success', 'Data added successfully!')							
							res.render('questions/new_form', {
								title: 'Add New Question',
								req: req,
								question: '',
								answer: ''
							})
						}
					})
				})
			} else {
				unirest.get('https://api.dialogflow.com/v1/intents/'+ in_id +'?v=20150910')
				.headers({'Authorization': 'Bearer ab71232a07a24e30a93a1f841d7b11d3', 'Content-Type': 'application/json'})
				.end(function (result){
					let res_hash = [];
					var res_int_id = result.body["id"]
					var res_int_name = result.body["name"]
					var res_array =  result.body["responses"][0]["messages"][0]["speech"]
					res_hash.push({
						que: que,
						intent: res_int_name,
						intent_id: res_int_id,
						res_array: res_array
					})
					req.flash('success', 'Data already existing in dialogflow')						
					res.render('questions/show', {
						title: 'Add New Question',
						question: res_hash,
						req: req,
						answer: ''
					})
				});
			}
		});
	}
	else {   
		var error_msg = ''
		errors.forEach(function(error) {
			error_msg += error.msg + '<br>'
		})				
		req.flash('error', error_msg)		
		res.render('questions/add', { 
	    title: 'Add New question',
	    req: req,
	    question: req.body.question,
	    answer: req.body.answer
	  })
  }
})


module.exports = app
