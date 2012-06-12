var couchapp = require('couchapp');
var config = require( process.env.HOME + '/sdkconfig');
var connection = config.dev;
var routes = require('./routes');

desc('Deploy files to couchdb');
task('deploy', function (params) {
	connection = config.prod;
	jake.Task['push'].invoke();
},true);


desc('push files to couchdb');
task('push', function (params) {	
	var protocol = 'http://';
	var auth = [connection.login, connection.password].join(':');
	var host = [connection.host, connection.port].join(':');
	
	var url = protocol + auth + '@' + host + '/' + connection.db;

	couchapp.createApp({
		_id:'_design/sdk',
		rewrites : routes.routes
	}, url, function(app){
		couchapp.loadAttachments(app.current, __dirname);
		app.push();
	});
	
},true);