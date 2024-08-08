from flask import Flask, request, render_template_string

app = Flask(__name__)

# HTML template for the form
form_html = '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CI/CD Pipeline Project</title>
</head>
<body>
    <h1>Welcome to the CI/CD Pipeline Project</h1>
    <form method="post" action="/submit">
        <label for="name">Enter your name:</label>
        <input type="text" id="name" name="name" required>
        <button type="submit">Submit</button>
    </form>
    {% if name %}
        <h2>Hello, {{ name }}!</h2>
    {% endif %}
</body>
</html>
'''

@app.route('/', methods=['GET', 'POST'])
def hello_world():
    name = None
    if request.method == 'POST':
        name = request.form.get('name')
    return render_template_string(form_html, name=name)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
