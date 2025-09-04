from flask import Flask, jsonify, request
import requests

app = Flask(__name__)

@app.route("/api/data", methods=["GET"])
def get_data():
    return jsonify({"message": "Hello from Backend API", "status": "success"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)
