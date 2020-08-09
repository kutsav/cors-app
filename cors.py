from flask import Flask,request

import os,sys,logging,requests

app=Flask(__name__)

@app.route('/health')
def health():
    try:
        if request.method == "GET":
            return "healthy"
    except Exception as e:
      logging.error(e)

@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def add_method(path):
	try:
		if path == "":
			path="/"
		app.logger.info("Received request: %s" %(request.url))
		msg="CORS Preflight Accepted"
		return msg,204
	except Exception as e:
		logging.error(e)

gunicorn_logger = logging.getLogger('gunicorn.error')
app.logger.handlers = gunicorn_logger.handlers
app.logger.setLevel(gunicorn_logger.level)   
