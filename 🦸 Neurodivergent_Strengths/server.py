#!/usr/bin/env python3
"""
Neuro Command Center - Web Server
A neurodivergent-friendly hub for workflows, communities, and resources
"""

from http.server import HTTPServer, BaseHTTPRequestHandler
import json
import subprocess
import os
import webbrowser
from pathlib import Path
from urllib.parse import parse_qs

BASE_DIR = Path(__file__).parent
RESOURCES_FILE = BASE_DIR / "resources.json"
WORKFLOWS_DIR = BASE_DIR / "workflows"
TEMPLATES_DIR = BASE_DIR / "templates"

class NeuroCommandHandler(BaseHTTPRequestHandler):

    def do_GET(self):
        if self.path == '/':
            self.serve_html()
        elif self.path == '/api/resources':
            self.serve_resources()
        else:
            self.send_error(404)

    def do_POST(self):
        content_length = int(self.headers['Content-Length'])
        post_data = self.rfile.read(content_length)
        data = json.loads(post_data.decode('utf-8'))

        if self.path == '/api/run-workflow':
            self.run_workflow(data.get('script'))
        elif self.path == '/api/install-tool':
            self.install_tool(data.get('command'))
        elif self.path == '/api/run-command':
            self.run_command(data.get('command'))
        else:
            self.send_error(404)

    def serve_html(self):
        try:
            with open(TEMPLATES_DIR / "index.html", 'r') as f:
                content = f.read()
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(content.encode())
        except Exception as e:
            self.send_error(500, str(e))

    def serve_resources(self):
        try:
            with open(RESOURCES_FILE, 'r') as f:
                resources = json.load(f)
            self.send_response(200)
            self.send_header('Content-type', 'application/json')
            self.end_headers()
            self.wfile.write(json.dumps(resources).encode())
        except Exception as e:
            self.send_error(500, str(e))

    def run_workflow(self, script_name):
        """Execute a workflow script"""
        try:
            script_path = WORKFLOWS_DIR / script_name
            if script_path.exists():
                result = subprocess.run(
                    ['bash', str(script_path)],
                    capture_output=True,
                    text=True,
                    timeout=300
                )
                message = f"Workflow completed!\n\nOutput:\n{result.stdout}"
                if result.stderr:
                    message += f"\n\nErrors:\n{result.stderr}"
            else:
                message = f"Workflow script not found: {script_name}\n\nCreate it at: {script_path}"

            self.send_json_response({'success': True, 'message': message})
        except Exception as e:
            self.send_json_response({'success': False, 'message': str(e)})

    def install_tool(self, command):
        """Install a tool via apt or other package manager"""
        try:
            # For safety, only allow apt commands
            if not command.startswith('sudo apt install'):
                raise ValueError("Only 'sudo apt install' commands are allowed")

            result = subprocess.run(
                command.split(),
                capture_output=True,
                text=True,
                timeout=300
            )
            message = f"Installation started!\n\n{result.stdout}"
            self.send_json_response({'success': True, 'message': message})
        except Exception as e:
            self.send_json_response({'success': False, 'message': str(e)})

    def run_command(self, command):
        """Run a quick-win command"""
        try:
            result = subprocess.run(
                command.split(),
                capture_output=True,
                text=True,
                timeout=30
            )
            message = f"Command executed!\n\n{result.stdout}"
            if result.stderr:
                message += f"\n\n{result.stderr}"
            self.send_json_response({'success': True, 'message': message})
        except Exception as e:
            self.send_json_response({'success': False, 'message': str(e)})

    def send_json_response(self, data):
        self.send_response(200)
        self.send_header('Content-type', 'application/json')
        self.end_headers()
        self.wfile.write(json.dumps(data).encode())

    def log_message(self, format, *args):
        """Suppress log messages for cleaner output"""
        pass

def main():
    PORT = 8765

    print("=" * 60)
    print("🧠 Neuro Command Center")
    print("=" * 60)
    print(f"\n✨ Starting server on http://localhost:{PORT}")
    print(f"📁 Resources: {RESOURCES_FILE}")
    print(f"🔧 Workflows: {WORKFLOWS_DIR}")
    print("\n💡 Press Ctrl+C to stop the server")
    print("\n🚀 Opening browser...")
    print("=" * 60)

    # Create directories if they don't exist
    WORKFLOWS_DIR.mkdir(exist_ok=True)
    TEMPLATES_DIR.mkdir(exist_ok=True)

    server = HTTPServer(('localhost', PORT), NeuroCommandHandler)

    # Open browser
    webbrowser.open(f'http://localhost:{PORT}')

    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print("\n\n👋 Shutting down gracefully...")
        server.shutdown()

if __name__ == '__main__':
    main()
