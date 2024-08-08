from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify(message="Hello, World!")

@app.route('/api/test')
def test():
    return jsonify(status="OK")

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
