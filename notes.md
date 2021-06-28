Restaurant App


Users change table states throughout service and other departments can keep track of it

ONE LEVEL UP INTERACTION - Users may own (create) restaurants (owners) or belong to restaurant (staff)

User <-belongs_to has_many-> Restaurant <- -> Tables <- -> Orders

User
    - has_and_belongs_to_many :restaurants  (.restaurants)
    - has_many :tables, through :restaurants    (.tables)
    - has_many :orders  (.orders)
    - has_secure_password
    - username, string
    - email, string
    - password_digest, string

Restaurant
    - has_many :tables (.tables)
    - has_many :orders, through tables (.orders)
    - has_many :menuitems (.menuitems)
    - has_and_belongs_to_many :users (.users)
    - name, string

Tables
    - has_many :orders
    - has_many :menuitems, through :orders
    - belongs_to :users, through :restaurants
    - belongs_to :restaurants
    - name, string
    - status, int

Orders
    - belongs_to :users
    - belongs_to :tables
    - belongs_to :restaurants, through :tables
    - Total, float
    - Paid, boolean

Menuitems
    - belongs_to :restaurant, polymorphic :true
    - Name, string
    - Price, float


rails generate resource NAME [field[:type][:index] field[:type][:index]] [options]
user username, email, password_digest
restaurant name
table name, status:integer
order total:float, paid:boolean
menuitem name, price:float

