CWD=$(shell pwd)
COFFEE=$(CWD)/node_modules/.bin/COFFEE

dev:
	NODE_ENV=development node $(CWD)/start.js

prod:
	NODE_ENV=production node $(CWD)/start.js

seed:
	NODE_ENV=development APP_ROOT=$(CWD) $(COFFEE) $(CWD)/core/db/seeds

prod-clear:
	NODE_ENV=production APP_ROOT=$(CWD) $(COFFEE) $(CWD)/core/db/seeds