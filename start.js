require('coffee-script');

var exec = require('child_process').exec;

exec('pwd', function(err, cwd){
  cwd = cwd.replace(/\n/, '');
  process.env.APP_ROOT = cwd;

  require(process.env.APP_ROOT + '/core/server');
});

