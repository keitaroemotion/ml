# Make List

Not sure whether this is reinvention of the wheel, but this script is chiefly
aiming at enlisting the available commands of Makefile without opening it.

## Makefile sample

The description of the command is commented just above the
command `xxx:`. As long as the Makefile follows this pattern
script automatically prints the description per each command.

```
# run the flask web server
run:
	flask --app flaskr run --debug

# 1. clean the test DB
# 2. set up the init data of test DB
# 3. call webpage API
api:
	mysql -u moomin -pmoomin -E -e "drop database test; create database test;"
	curl -X GET http://127.0.0.1:5000/setup
	curl -X GET http://127.0.0.1:5000/webpage
```
