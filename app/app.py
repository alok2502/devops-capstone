from flask import Flask, jsonify
import os
import datetime

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({
        'app': 'DevOps Capstone Project',
        'version': os.getenv('APP_VERSION', '1.0'),
        'environment': os.getenv('APP_ENV', 'production'),
        'timestamp': str(datetime.datetime.now())
    })

@app.route('/health')
def health():
    return jsonify({'status': 'healthy'}), 200

@app.route('/metrics-test')
def metrics():
    return jsonify({
        'message': 'All systems operational',
        'monitored_by': 'Prometheus + Grafana'
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
