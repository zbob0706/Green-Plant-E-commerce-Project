from flask import Blueprint

customer_bp = Blueprint(
    'customer_bp', __name__,
    static_folder="static",
    
    template_folder='templates',
)

from . import routes