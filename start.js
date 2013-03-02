require('coffee-script');

var exec = require('child_process').exec;

exec('pwd', function(err, response){
  response = response.replace(/\n/, '');
  process.env.APP_ROOT = response;

  require(process.env.APP_ROOT + '/core/server');
});

