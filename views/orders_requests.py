from .sizes_requests import get_single_size
from .styles_requests import get_single_style
from .metals_requests import get_single_metal
import sqlite3
import json
from models import Orders


ORDERS = [
    {
        "id": 1,
        "metalId": 3,
        "sizeId": 2,
        "styleId": 3,
        "timestamp": 1614659931693
    }
]


def get_all_orders():
    # Open a connection to the database
    with sqlite3.connect("./kneeldiamonds.sqlite3") as conn:

        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Write the SQL query to get the information you want
        db_cursor.execute("""
        SELECT
            o.id,
            o.metal_id,
            o.size_id,
            o.style_id,
            o.timestamp
        FROM orders o
        """)

        # Initialize an empty list to hold all order representations
        orders = []

        # Convert rows of data into a Python list
        dataset = db_cursor.fetchall()

        # Iterate list of data returned from database
        for row in dataset:

            # Create a location instance from the current row.
            # Note that the database fields are specified in
            # exact order of the parameters defined in the
            # order class above.
            order = Orders(row['id'], row['metal_id'],
                           row['size_id'], row['style_id'], row['timestamp'])

            orders.append(order.__dict__)

    return orders


# def get_single_order(id):
#     # Variable to hold the found order, if it exists
#     requested_order = None

#     # Iterate the ORDERS list above. Very similar to the
#     # for..of loops you used in JavaScript.
#     for order in ORDERS:
#         # Dictionaries in Python use [] notation to find a key
#         # instead of the dot notation that JavaScript used.
#         if order["id"] == id:
#             requested_order = order
#             matching_size = get_single_size(
#                 requested_order["sizeId"])
#             requested_order["size"] = matching_size
#             order.pop("sizeId")

#             matching_style = get_single_style(
#                 requested_order["styleId"])
#             requested_order["style"] = matching_style
#             order.pop("styleId")

#             matching_metal = get_single_metal(
#                 requested_order["metalId"])
#             requested_order["metal"] = matching_metal
#             order.pop("metalId")
#     return requested_order

def get_single_order(id):
    with sqlite3.connect("./kneeldiamonds.sqlite3") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Use a ? parameter to inject a variable's value
        # into the SQL statement.
        db_cursor.execute("""
        SELECT
            o.id,
            o.metal_id,
            o.size_id,
            o.style_id,
            o.timestamp
        FROM orders o
        WHERE o.id = ?
        """, (id, ))

        # Load the single result into memory
        data = db_cursor.fetchone()

        # Create an order instance from the current row
        order = Orders(data['id'], data['metal_id'],
                       data['size_id'], data['style_id'], data['timestamp'])

        return order.__dict__


def create_order(new_order):
    with sqlite3.connect("./kneeldiamonds.sqlite3") as conn:
        db_cursor = conn.cursor()

        db_cursor.execute("""
        INSERT INTO Orders
            ( metal_id, size_id, style_id, timestamp )
        VALUES
            ( ?, ?, ?, ?);
        """, (new_order['metalId'], new_order['sizeId'], new_order['styleId'], new_order['timestamp']))

        # The `lastrowid` property on the cursor will return
        # the primary key of the last thing that got added to
        # the database.
        id = db_cursor.lastrowid

        # Add the `id` property to the order dictionary that
        # was sent by the client so that the client sees the
        # primary key in the response.
        new_order['id'] = id

    return new_order


def delete_order(id):
    # Initial -1 value for order index, in case one isn't found
    order_index = -1

    # Iterate the ORDERS list, but use enumerate() so that you
    # can access the index value of each item
    for index, order in enumerate(ORDERS):
        if order["id"] == id:
            # Found the order. Store the current index.
            order_index = index

    # If the order was found, use pop(int) to remove it from list
    if order_index >= 0:
        ORDERS.pop(order_index)


def update_order(id, new_order):
    # Iterate the ORDERS list, but use enumerate() so that
    # you can access the index value of each item.
    for index, order in enumerate(ORDERS):
        if order["id"] == id:
            # Found the order. Update the value.
            ORDERS[index] = new_order
            break
