Restaurant App

THINGS TO DO
[] Set up database
[] Set up models
[] Set up controllers
[] Set up views

Users change table states throughout service and other departments can keep track of it

ONE LEVEL UP INTERACTION - Users may own (create) restaurants (owners) or belong to restaurant (staff)

User <-belongs_to has_many-> Restaurant <- -> Tables <- -> Orders

User
    <!-- - has_and_belongs_to_many :restaurants  (.restaurants) -->
    - has_many :tables (.tables)
    - has_many :orders, through: :tables  (.orders)
    - has_secure_password
    - username, string
    - email, string
    - password_digest, string
    - table_id, integer
    - order_id, integer
    - ismanager, boolean
    - iscook, boolean
    - ishost, boolean
    - iswaitsaff, boolean
    - isbussing, boolean
    - isbartender, boolean

<!-- Restaurant
    - has_many :tables (.tables)
    - has_many :orders, through tables (.orders)
    - has_many :menuitems (.menuitems)
    - has_and_belongs_to_many :users (.users)
    - name, string
    - user_id -->

Tables
    - has_many :orders
    - has_many :menuitems, through: :orders
    - belongs_to :users
    - belongs_to :restaurants
    - name, string
    - status, int
    - order_id
    - menuitem_id
    - user_od

Orders
    - belongs_to :tables
    - belongs_to :users, through: :tables
    - has_many :menuitems
    - Total, float
    - Paid, boolean

Menuitems
    - belongs_to :orders
    - Name, string
    - Price, float
    - Drink, boolean
    - Food, boolean


rails generate resource NAME [field[:type][:index] field[:type][:index]] [options]
user username, email, password_digest
restaurant name
table name, status:integer
order total:float, paid:boolean
menuitem name, price:float

