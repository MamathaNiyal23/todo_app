# 📝 To-Do App 

A clean and simple To-Do list application built with **Ruby on Rails**, featuring:

- User authentication via **Devise**
- Create, update, complete, and delete todos
- Filter todos by:
  - **This Month**
  - **Previous Months**
  - **Status**: All / Pending / Completed
- Styled with **custom CSS**
- Responsive and user-friendly interface

---

## 🚀 Features

- 🔐 User login/signup/logout with Devise
- ➕ Add todos with default status "pending"
- ✅ Mark todos as completed
- 🗑️ Delete todos
- 📅 Tabs to filter by:
  - This month's todos
  - Previous months' todos
  - All / Pending / Completed
- 🎨 Clean UI with centered layout and responsive design


## 📂 Project Structure

- `app/models/todo.rb` – Todo model with validations and user association
- `app/controllers/home_controller.rb` – Renders dashboard with todo filtering
- `app/controllers/todos_controller.rb` – Handles create, update, delete actions
- `app/views/home/index.html.erb` – Main view with filters and todo list
- `app/assets/stylesheets/application.css` – Custom CSS for UI
- `config/routes.rb` – Routes with Devise and todo paths



## 🧪 Setup Instructions

### 1. Clone the repository

```bash
git clone https://github.com/MamathaNiyal23/todo_app.git
cd todo_app
```
### 2. Install dependencies

```bash
bundle install
```

### 3. Set up database

```bash
rails db:create
rails db:migrate
```

### 4. Run the server

```bash
rails server
```

