from flask import Flask, request
import datetime

app = Flask(__name__)

LOG_FILE = "service.log"

@app.route("/log", methods=["POST"])
def log_request():
    data = request.json
    with open(LOG_FILE, "a") as f:
        f.write(f"{datetime.datetime.now()} - {data}\n")
    return {"status": "logged"}, 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5002)
