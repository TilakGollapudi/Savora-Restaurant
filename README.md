# 🍽️ Savora Restaurant Management System

<div align="center">

**A comprehensive Java-based Restaurant Management System designed to streamline operations and enhance customer experience.**

[![Java](https://img.shields.io/badge/Java-8%2B-orange?style=flat-square&logo=java)](https://www.java.com/)
[![MySQL](https://img.shields.io/badge/Database-MySQL-blue?style=flat-square&logo=mysql)](https://www.mysql.com/)
[![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)
![Status](https://img.shields.io/badge/Status-Active-brightgreen?style=flat-square)

[Features](#-features) • [Installation](#-installation--setup) • [Usage](#-usage) • [Architecture](#-architecture) • [Contributing](#-contributing)

</div>

---

## 📋 Overview

**Savora** is a powerful restaurant management system that automates daily operations including order management, inventory control, staff management, and payment processing. Built with Java and designed with enterprise-level architecture principles, it provides a seamless solution for modern restaurant businesses.

### Why Savora?
- ✅ **Efficient Order Management** - Real-time order tracking and processing
- ✅ **Inventory Control** - Automated stock management and alerts
- ✅ **Staff Management** - Role-based access and staff scheduling
- ✅ **Payment Integration** - Secure payment processing
- ✅ **Scalable Architecture** - Designed for multiple restaurant branches
- ✅ **User-Friendly Interface** - Intuitive UI for all user types

---

## 🌟 Key Features

### 👨‍💼 Administration & Management
- **Multi-branch Support** - Manage multiple restaurant locations from a single system
- **Role-Based Access Control** - Admin, Manager, and Staff roles with specific permissions
- **Staff Management** - Hire, schedule, and manage restaurant staff
- **Analytics & Reports** - Real-time insights into sales, performance, and trends

### 🛒 Order Management
- **Digital Menu** - Easy-to-navigate menu with categorization
- **Order Tracking** - Real-time order status from kitchen to delivery
- **Order History** - Complete order records for audit and analytics
- **Special Requests** - Support for custom orders and dietary preferences

### 💳 Payment Processing
- **Multiple Payment Methods** - Cash, Card, Digital Wallets
- **Transaction Tracking** - Secure and transparent payment records
- **Invoice Generation** - Automated billing and receipt printing
- **Refund Management** - Hassle-free refund processing

### 📦 Inventory Management
- **Real-Time Stock Tracking** - Monitor ingredient availability
- **Low Stock Alerts** - Automatic notifications for reordering
- **Supplier Management** - Vendor information and ordering integration
- **Usage Analytics** - Track ingredient consumption patterns

### 📊 Reporting & Analytics
- **Sales Reports** - Daily, weekly, and monthly sales analysis
- **Customer Analytics** - Popular items, customer preferences
- **Staff Performance** - Individual and team productivity metrics
- **Financial Reports** - Revenue, costs, and profit analysis

---

## 🏗️ Project Architecture

### Technology Stack
| Component | Technology |
|-----------|-----------|
| **Language** | Java 8+ |
| **Database** | MySQL 5.7+ / PostgreSQL 10+ |
| **IDE** | Eclipse / IntelliJ IDEA |
| **Build Tools** | Maven / Gradle |
| **Architecture Pattern** | MVC (Model-View-Controller) |

### Directory Structure
```
Savora-Restaurant/
│
├── src/main/java/com/rms/
│   ├─�� models/                             # Entity classes (Order, MenuItem, etc.)
│   ├── controllers/                        # Business logic & coordination
│   ├── views/                              # UI Components (Panels, Dialogs)
│   ├── database/                           # DAO & database operations
│   ├── services/                           # Business services layer
│   ├── utility/                            # Helper classes & constants
│   ├── exceptions/                         # Custom exceptions
│   └── Main.java                           # Entry point
│
├── src/main/resources/
│   ├── database/
│   │   ├── schema.sql                      # Database schema
│   │   ├── seed_data.sql                   # Sample data
│   │   └── backup/                         # Database backups
│   ├── config/
│   │   └── database.properties             # Database configuration
│   └── images/                             # Application images/icons
│
├── lib/                                    # External JAR dependencies
│
├── .classpath                              # Eclipse classpath configuration
├── .project                                # Eclipse project configuration
├── .settings/                              # Eclipse IDE settings
├── .gitignore                              # Git ignore rules
├── pom.xml                                 # Maven configuration
├── README.md                               # Project documentation
└── LICENSE                                 # License information
```

### Core Modules

#### **Models**
- `Restaurant` - Restaurant entity with branches and configuration
- `Order` - Customer orders with items and status tracking
- `MenuItem` - Menu items with pricing and availability
- `Customer` - Customer information and preferences
- `Staff` - Employee details and roles
- `Payment` - Payment transaction records
- `Inventory` - Stock and ingredient management

#### **Controllers**
- Order Controller - Manages order lifecycle
- Menu Controller - Handles menu operations
- Staff Controller - Manages staff operations
- Payment Controller - Processes payments
- Inventory Controller - Controls stock management

#### **Views**
- Main Dashboard - System overview and quick actions
- Order Management UI - Order processing interface
- Inventory Management UI - Stock management screen
- Staff Management UI - Employee administration
- Reports Dashboard - Analytics and reporting

#### **Database**
- Order DAO - Order data access operations
- Menu DAO - Menu management operations
- Customer DAO - Customer data handling
- Payment DAO - Payment record management
- Inventory DAO - Stock operations

#### **Utilities**
- `DBConnection` - Database connection pooling
- `Constants` - Application-wide constants
- `ValidationHelper` - Input validation utilities
- `DateUtils` - Date and time utilities
- `LoggerUtil` - Logging configuration

---

## 📥 Installation & Setup

### Prerequisites
- **Java Development Kit (JDK)** 8 or higher - [Download](https://www.oracle.com/java/technologies/downloads/)
- **Eclipse IDE** or IntelliJ IDEA - [Download](https://www.eclipse.org/downloads/)
- **MySQL Server** 5.7+ - [Download](https://www.mysql.com/downloads/)
- **Git** - [Download](https://git-scm.com/downloads)
- **MySQL Connector/J** (MySQL JDBC Driver)

### Step-by-Step Installation

#### 1. Clone the Repository
```bash
git clone https://github.com/TilakGollapudi/Savora-Restaurant.git
cd Savora-Restaurant
```

#### 2. Import into Eclipse IDE
```
1. Open Eclipse IDE
2. Go to File → Import
3. Select "Existing Projects into Workspace"
4. Browse and select the Savora-Restaurant directory
5. Click Finish
```

#### 3. Configure Database Connection
```bash
# Update the database configuration file
# Edit: src/main/resources/config/database.properties

DB_URL=jdbc:mysql://localhost:3306/savora_restaurant
DB_USER=root
DB_PASSWORD=your_password
DB_DRIVER=com.mysql.cj.jdbc.Driver
```

#### 4. Create Database and Tables
```bash
# Open MySQL Command Line or MySQL Workbench
# Execute the following SQL script:

mysql -u root -p < src/main/resources/database/schema.sql
mysql -u root -p < src/main/resources/database/seed_data.sql
```

Or manually:
```sql
# Create Database
CREATE DATABASE savora_restaurant;
USE savora_restaurant;

# Run schema.sql to create tables
SOURCE src/main/resources/database/schema.sql;

# Insert sample data
SOURCE src/main/resources/database/seed_data.sql;
```

#### 5. Add MySQL JDBC Driver
```
1. Download MySQL Connector/J from: https://dev.mysql.com/downloads/connector/j/
2. Extract the JAR file
3. Copy mysql-connector-java-x.x.x.jar to the lib/ folder
4. Right-click project → Build Path → Configure Build Path
5. Add External JAR → Select mysql-connector-java-x.x.x.jar
```

#### 6. Build and Run
```bash
# In Eclipse:
# 1. Right-click Project → Build Project
# 2. Right-click src/main/java/com/rms/Main.java → Run As → Java Application
```

---

## 🚀 Usage

### Starting the Application
```bash
# From Eclipse IDE
Right-click Main.java → Run As → Java Application

# From Command Line
java -cp .:lib/* com.rms.Main
```

### Default Login Credentials

| Role | Username | Password |
|------|----------|----------|
| Admin | admin | admin123 |
| Manager | manager | manager123 |
| Staff | staff | staff123 |

**⚠️ Security Note:** Change default credentials immediately after first login in a production environment.

### Main Dashboard Sections

#### Admin Panel
- System configuration and settings
- User management and role assignment
- Access to all system features
- System analytics and reports

#### Manager Dashboard
- Restaurant operations monitoring
- Staff shift scheduling
- Order oversight and management
- Daily sales reports

#### Staff Interface
- Take customer orders
- Update order status
- Process payments
- View inventory availability

---

## 💻 System Requirements

### Minimum Requirements
- **RAM:** 4GB
- **Storage:** 500MB (initial installation)
- **Processor:** Intel i5 or equivalent
- **OS:** Windows 7+, Linux, or macOS

### Recommended Requirements
- **RAM:** 8GB+
- **Storage:** 1GB+
- **Processor:** Intel i7 or equivalent
- **OS:** Windows 10+, Ubuntu 20.04+, or macOS 10.14+

---

## 📊 Database Schema Overview

### Key Tables
```
Orders
├── order_id (PK)
├── customer_id (FK)
├── order_date
├── total_amount
└── status

OrderItems
├── order_item_id (PK)
├── order_id (FK)
├── menu_item_id (FK)
└── quantity

MenuItems
├── menu_item_id (PK)
├── name
├── price
└── category

Customers
├── customer_id (PK)
├── name
├── phone
└── email

Staff
├── staff_id (PK)
├── name
├── role
└── contact

Payments
├── payment_id (PK)
├── order_id (FK)
├── amount
└── status
```

---

## 🔧 Configuration

### Database Properties
Update `src/main/resources/config/database.properties`:
```properties
# Database Configuration
db.driver=com.mysql.cj.jdbc.Driver
db.url=jdbc:mysql://localhost:3306/savora_restaurant
db.username=root
db.password=
db.pool.size=10

# Application Settings
app.name=Savora Restaurant Management System
app.version=1.0.0
app.timezone=UTC
```

### Log Configuration
Configure logging in `src/main/resources/config/logging.properties`:
```properties
# Log Level: SEVERE, WARNING, INFO, CONFIG, FINE, FINER, FINEST
log.level=INFO
log.file=logs/application.log
log.max.file.size=10485760
```

---

## 🧪 Testing

```bash
# Run all tests
mvn test

# Run specific test class
mvn test -Dtest=OrderServiceTest

# Run tests with coverage report
mvn test jacoco:report
```

---

## 📝 API & Functions

### Order Management
```java
// Create new order
OrderService.createOrder(customerId, items);

// Update order status
OrderService.updateOrderStatus(orderId, status);

// Get order details
Order order = OrderService.getOrder(orderId);

// Cancel order
OrderService.cancelOrder(orderId);
```

### Payment Processing
```java
// Process payment
PaymentService.processPayment(orderId, amount, method);

// Get payment history
List<Payment> payments = PaymentService.getPaymentHistory(orderId);

// Refund payment
PaymentService.refundPayment(paymentId);
```

### Inventory Management
```java
// Check item availability
boolean available = InventoryService.isItemAvailable(itemId);

// Update inventory
InventoryService.updateStock(itemId, quantity);

// Get low stock items
List<MenuItem> lowStock = InventoryService.getLowStockItems();
```

---

## 🐛 Known Issues & Limitations

- Multi-user concurrent access may require transaction optimization
- Mobile application not yet available
- API endpoints under development
- Real-time inventory sync in progress

---

## 🚦 Project Status

- [x] Core system architecture
- [x] Database schema and implementation
- [x] User authentication and authorization
- [x] Order management module
- [x] Payment processing
- [x] Inventory management
- [ ] Mobile application
- [ ] REST API implementation
- [ ] Advanced analytics dashboard
- [ ] Integration with delivery platforms

---

## 📚 Documentation

- **[Database Documentation](docs/DATABASE.md)** - Schema and relationships
- **[API Reference](docs/API.md)** - Available endpoints and functions
- **[Deployment Guide](docs/DEPLOYMENT.md)** - Production deployment steps
- **[Troubleshooting Guide](docs/TROUBLESHOOTING.md)** - Common issues and solutions

---

## 🤝 Contributing

We welcome contributions! Here's how to get started:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/AmazingFeature`)
3. **Commit** your changes (`git commit -m 'Add some AmazingFeature'`)
4. **Push** to the branch (`git push origin feature/AmazingFeature`)
5. **Open** a Pull Request

### Contribution Guidelines
- Follow Java naming conventions and coding standards
- Add comments for complex logic
- Include unit tests for new features
- Update documentation as needed
- Ensure backward compatibility

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## 👤 Author

**Tilak Gollapudi**
- GitHub: [@TilakGollapudi](https://github.com/TilakGollapudi)
- Repository: [Savora-Restaurant](https://github.com/TilakGollapudi/Savora-Restaurant)

---

## 🙏 Acknowledgments

- Java community for excellent libraries and frameworks
- MySQL for reliable database management
- Eclipse IDE for development environment
- All contributors and supporters

---

## 📞 Support & Contact

For issues, questions, or suggestions:
- Open an [Issue](https://github.com/TilakGollapudi/Savora-Restaurant/issues)
- Email: gollapudithilak1308@gmail.com


---

<div align="center">

### ⭐ If you find this project useful, please give it a star!

**Made with ❤️ by Tilak Gollapudi**

</div>
