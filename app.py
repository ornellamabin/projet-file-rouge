import os
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    # Récupération des URLs depuis les variables d'environnement
    odoo_url = os.environ.get('ODOO_URL', 'https://www.odoo.com')
    pgadmin_url = os.environ.get('PGADMIN_URL', 'https://www.pgadmin.org')
    
    return render_template('index.html', 
                         odoo_url=odoo_url, 
                         pgadmin_url=pgadmin_url)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=False)
