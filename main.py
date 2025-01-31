from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/cardapio')
def cardapio():
    return render_template('cardapio.html')

@app.route('/contato')
def contato():
    return render_template('contato.html')

@app.route('/main')
def main():
    return render_template('main.html')

@app.route('/card')
def card():
    return render_template('card.html')

@app.route('/payment')
def payment():
    return render_template('payment.html')


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=5002)
