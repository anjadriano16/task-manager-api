# Task Manager API

## 📌 Overview
The **Task Manager API** is a backend service built with **Ruby on Rails** that provides RESTful API endpoints for managing tasks. It supports CRUD operations, user authentication, task categorization, due dates, and real-time updates using **ActionCable (WebSockets)**.

## 🚀 Features
- ✅ **User Authentication** (Signup, Login, JWT-based Authorization)
- ✅ **CRUD Operations** for Tasks
- ✅ **Task Categorization**
- ✅ **Due Dates & Reminders**
- ✅ **Real-time Task Updates** with WebSockets
- ✅ **Task Filtering & Search**

## 🛠️ Tech Stack
- **Backend:** Ruby on Rails (API mode)
- **Database:** PostgreSQL
- **WebSockets:** ActionCable
- **Authentication:** Devise & JWT

## 📂 Installation & Setup
### 1️⃣ Clone the repository:
```sh
git clone https://github.com/yourusername/task-manager-api.git
cd task-manager-api
```

### 2️⃣ Install dependencies:
```sh
bundle install
```

### 3️⃣ Set up the database:
```sh
rails db:create db:migrate db:seed
```

### 4️⃣ Start the server:
```sh
rails s
```

The API will be available at `http://localhost:3000`.

## 🔑 Authentication
### **User Signup**
```http
POST /signup
```
**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "password123",
  "password_confirmation": "password123"
}
```

### **User Login**
```http
POST /login
```
**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "password123"
}
```
**Response:** (Returns a JWT token)
```json
{
  "token": "your_jwt_token"
}
```

## 📝 API Endpoints
### **Tasks**
| Method | Endpoint         | Description        |
|--------|-----------------|--------------------|
| GET    | `/tasks`        | List all tasks    |
| POST   | `/tasks`        | Create a task     |
| GET    | `/tasks/:id`    | Get a task by ID  |
| PATCH  | `/tasks/:id`    | Update a task     |
| DELETE | `/tasks/:id`    | Delete a task     |

## ⚡ Real-Time Updates (WebSockets)
Clients can subscribe to real-time task updates using **ActionCable**:
```javascript
const cable = ActionCable.createConsumer("ws://localhost:3000/cable");
const subscription = cable.subscriptions.create("TasksChannel", {
  received(data) {
    console.log("Task update:", data);
  }
});
```

## 📌 Contributing
Feel free to fork this repository and submit pull requests. Issues and feature requests are welcome!

## 📜 License
This project is open-source and available under the **MIT License**.

