import requests
from flask import Flask, send_from_directory

app = Flask(__name__)

# Serve the frontend HTML file
@app.route('/')
def index():
    return send_from_directory('.', 'index.html')

# Fetch data fro the GKE service

@app.route('/fetch')
def fetch_gke_data():
    try:
        # Private GKE service URL
        app_url = 'http://192.168.12.3:80'  # Replace with your actual GKE IP
        response = requests.get(app_url)
        return response.text
    except Exception as e:
        return f"Error: {str(e)}", 500
    
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)