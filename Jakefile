var couchapp = require('couchapp');
var config = require( process.env.HOME + '/sdkconfig.js');
var connection = config.dev;

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
		rewrites : 
		    [ 
				{from:"/", to:'index.html'},
				
				{from:"/integration-test", to:'integration-test/index.html'},
				{from:"/integration-test/*", to:'integration-test/*'},
				
				{from:"/lib/api.js", to:'lib/lib/api.js'},
				{from:"/lib/api.min.js", to:'lib/lib/api.min.js'},
				
				{from:"/lib/as3.swf", to:'xframe/as3.swf'}
		    ]
	}, url, function(app){
		couchapp.loadAttachments(app.current, __dirname);
		app.push();
	});
	
},true);