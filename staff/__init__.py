from flask import Blueprint

staff_bp = Blueprint(
    'staff_bp', __name__,
    static_folder="static",
    static_url_path="/staff/static",
    template_folder='templates',
)

from . import routes
