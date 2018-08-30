var express = require('express')
var app = express()

// Here getting all context questions
app.get('/', function(req, res, next) {
	req.getConnection(function(error, conn) {
  	sql = 'SELECT context_questions.question as context_que, context_questions.answer as context_ans, context_questions.action_name, questions.question as main_que, questions.answer as main_ans,questions.id as question_id, questions.intent from context_questions INNER join questions on context_questions.question_id = questions.id where context_questions.is_active=true'
		conn.query(sql,function(err, rows, fields) {
			final = {}
			for (var i = 0; i < rows.length; i++) {
    		var datum = rows[i];
		    if (!final[datum.main_que]) {
	        final[datum.main_que] = [];
	        var main_cnt = { main_ans: datum.main_ans, question_id: datum.question_id, intent: datum.intent } 
	        final[datum.main_que].push(main_cnt);
		    }
		    var context = { que: datum.context_que, ans: datum.context_ans, action_name: datum.action_name}
		    final[datum.main_que].push(context);
			}
			res.render('context_questions/list', {
				req: req,
				result: final
			})					
		})
	})
})


app.post('/update_context', function(req, res, next) {
	var question_id = req.body.question_id
	console.log(question_id)
	req.getConnection(function(error, conn) {
		sql = 'UPDATE context_questions SET is_active = 0 WHERE question_id= ? '
		conn.query(sql, [question_id], function(err, rows, fields) {
			console.log(fields)
			if (err) {
				console.log("error")
				res.send(rows);
			} else {
				console.log("success")
				res.send(rows);
			}
		})
	});
})


module.exports = app;
