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
	console.log("questions")
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
	var query_str = 'https://api.dialogflow.com/v1/intents?v=20150910'
	unirest.get(query_str)
	.headers({'Authorization': 'Bearer ab71232a07a24e30a93a1f841d7b11d3', 'Content-Type': 'application/json'})
	.end(function (response) {
		var intent_res = response.body
		var all_intents = new Array();
		intent_res.forEach(function(value, key){
    	all_intents.push({ 
        id: intent_res[key]["id"], 
        name: intent_res[key]["name"]
    	}); 
		})
		console.log(all_intents)
		res.render('questions/add', {
			intent_details: all_intents,
			req: req
		})
	});
})

app.post('/add_response', function(req, res) {
	var que_params = req.body
 	var intent_id = que_params['intent_id']
 	var res_obj = JSON.parse(que_params['res_obj'])
 	var query = que_params['response']
 	res_obj['responses'][0]['messages'].forEach(function(resp){
 		if (resp["speech"]){
 			resp["speech"].push(query);
 		}
 	});
 	delete res_obj["id"] 
 	console.log(res_obj)
	var query_str = 'https://api.dialogflow.com/v1/intents/' + intent_id + '?v=20150910'
	unirest.put(query_str)
	.headers({'Authorization': 'Bearer ab71232a07a24e30a93a1f841d7b11d3', 'Content-Type': 'application/json'})
	.send(res_obj)
	.end(function (response) {
		res.render('index', {title: 'My Training Module', req: req})
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
			conn.query('select * from sub_questions where question_id = ?', que_id, function(error,sub_queries,values){
				sub_que = [
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
									]
				sub_queries.forEach(function(k,v){
					sub_que.push({						
						"count": 0,
						"data": [
							{
								"text": sub_queries[v].question
							},
							{
								"userDefined": true
							}
						]
					});
				})
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
															"userSays": sub_que,
															"webhookForSlotFilling": false,
															"webhookUsed": false
														}
				unirest.post('https://api.dialogflow.com/v1/intents?v=20150910')
				.headers({'Authorization': 'Bearer ab71232a07a24e30a93a1f841d7b11d3', 'Content-Type': 'application/json'})
				.send(intent_data)
				.end(function (response) {
					conn.query('UPDATE questions SET intent = ?, intent_id = ? WHERE id= ? ', [ que_intent, response.body['id'], que_id ], function(err, user) {
						res.send(user);
					});
				});
			})
		})
	})
})


// app.get('/add_questions/first',function(req, res) {
// 	res.render('add_questions/add_questions')
// })

app.post('/add_question', function(req, res, next){	
	var post  = req.body;

	var sub_que = [];
  for(count=1; count<5; count++ )	{
		var t = "Question_" + count;
		var que = [post[t], post.question_id]
		sub_que.push(que);
	}

	req.getConnection(function(error, conn) {
		var sql = "INSERT INTO sub_questions (question, question_id)  VALUES ? "; 
		conn.query(sql,[sub_que], function(err, result) {
			if (err) {
				console.log("error")
			} else {
				console.log("t2 success")
			}
		});	
	});

	var context_que =[];
	for(a=0; a < (post.question.length) ; a++ )	{
		var question_id = post.question_id;
		var qry = post.question[a];
		var answer = post.answer[a];
		var final_que = [question_id, qry, answer]
		context_que.push(final_que)		
	}

	console.log(context_que);

	req.getConnection(function(error, conn) {
		var sql2 = "INSERT INTO context_questions (question_id, question, answer) VALUES ? ";
		conn.query(sql2,[context_que], function(err, result) {
			if (err) {
				console.log(error)
			} else {
				console.log("t3 success")
			}				
		});	
	});
	res.render('index', {title: 'My Training Module', req: req})			
});


// ADD NEW Question POST ACTION
app.post('/add', function(req, res, next){
	req.assert('question', 'Query is required').notEmpty()
	req.assert('answer', 'Response is required').notEmpty()
	var errors = req.validationErrors()
  if( !errors ) { 
  	let query_condition = ""
  	var que = req.body.question
  	var answer = req.body.answer
  	var intent = req.body.intent  
 		unirest.post('https://api.dialogflow.com/v1/query?v=20150910')
		.headers({'Authorization': 'Bearer ab71232a07a24e30a93a1f841d7b11d3', 'Content-Type': 'application/json'})
		.send({ "lang": "en", "query": que, "sessionId": 1234 })
		.end(function (response) {
		 	var query_condition = response.body["result"]["action"]
		 	var in_id = response.body["result"]["metadata"]["intentId"]
		 	if(query_condition == "input.unknown"){
		 		if (intent) {
					unirest.get('https://api.dialogflow.com/v1/intents/'+ intent +'?v=20150910')
					.headers({'Authorization': 'Bearer ab71232a07a24e30a93a1f841d7b11d3', 'Content-Type': 'application/json'})
					.end(function (result){
						var que_params = result.body
					 	que_params['responses'][0]['messages'].forEach(function(resp){
					 		if (resp["speech"]){
					 			resp["speech"].push(answer);
					 		}
					 	});
					 	delete que_params["id"] 
					 	console.log(que_params['responses'][0]['messages'])
					 	var user_says = {	"count": 0,
														  "data": [
														    {
														      "text": que
														    }
														  ],
														  "isTemplate": false,
														  "isAuto": false
														}
						que_params['userSays'].push(user_says)
					 	console.log(que_params['userSays'])
						var query_str = 'https://api.dialogflow.com/v1/intents/' + intent + '?v=20150910'
						console.log(query_str)
						unirest.put(query_str)
						.headers({'Authorization': 'Bearer ab71232a07a24e30a93a1f841d7b11d3', 'Content-Type': 'application/json'})
						.send(que_params)
						.end(function (response) {
							res.render('index', {title: 'My Training Module', req: req})
						});
					});
				}else{
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
								conn.query("select * from questions where id =?", result.insertId, function(err, user){
									req.flash('success', "Data added successfully")
									res.render('questions/add_question', {
										title: 'Add New Question',
										req: req,
										question: '',
										answer: '',
										q_id: user
									})							
								})
							}
						})
					})
				}
			} else {
				unirest.get('https://api.dialogflow.com/v1/intents/'+ in_id +'?v=20150910')
				.headers({'Authorization': 'Bearer ab71232a07a24e30a93a1f841d7b11d3', 'Content-Type': 'application/json'})
				.end(function (result){
					console.log(result);
					var res_obj = JSON.stringify(result.body);
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
						req_obj: res_obj,
						answer: ''
					})
				});
			}
		});  		
	}	else {   
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
