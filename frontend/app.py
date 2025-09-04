from flask import Flask, render_template_string
import requests

app = Flask(__name__)

BACKEND_URL = "http://backend:5001/api/data"  # docker-compose service name

@app.route("/")
def home():
    try:
        response = requests.get(BACKEND_URL, timeout=2)
        data = response.json()
    except Exception as e:
        data = {"error": str(e)}

    template = """
    <html>
        <head><title>Frontend</title></head>
        <body>
            <h1>Frontend Service</h1>
            <p>Backend Response:</p>
            <pre>{{ data }}</pre>
        </body>
    </html>
    """
    return render_template_string(template, data=data)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
