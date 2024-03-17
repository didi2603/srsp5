import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Florida Vibes'), // изменение шрифта
      home: const LanguageSelectionPage(),
    );
  }
}

class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выбор языка'),
      ),
      backgroundColor: const Color(0xFF9400D3), // изменение цвета задней панели
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LanguageButton(
              language: 'Казакша',
              icon: Icons.language,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegistrationFormPage(language: 'Казакша'),
                  ),
                );
              },
            ),
            LanguageButton(
              language: 'Русский',
              icon: Icons.language,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegistrationFormPage(language: 'Русский'),
                  ),
                );
              },
            ),
            LanguageButton(
              language: 'English',
              icon: Icons.language,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegistrationFormPage(language: 'English'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RegistrationFormPage extends StatelessWidget {
  final String language;

  const RegistrationFormPage({Key? key, required this.language}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрационная форма'),
      ),
      backgroundColor: const Color(0xFF9400D3), // изменение цвета задней панели
      body: MyForm(language: language),
      bottomNavigationBar: const BottomNavBar(), // добавленная нижняя панель навигации
    );
  }
}

class MyForm extends StatefulWidget {
  final String language;

  const MyForm({Key? key, required this.language}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _regionController = TextEditingController();

  ElevatedButton buildRegistrationButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => NewsPage(language: widget.language),
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      child: const Text('Отправить форму', style: TextStyle(color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.person,
            size: 50,
            color: Colors.blue,
          ),
          const Text(
            'Регистрационная форма',
            style: TextStyle(fontSize: 24, color: Colors.blue),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Имя',
              icon: Icon(Icons.person, color: Colors.blue),
              labelStyle: TextStyle(color: Colors.blue),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, введите имя';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(
              labelText: 'Телефон',
              icon: Icon(Icons.phone, color: Colors.blue),
              labelStyle: TextStyle(color: Colors.blue),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, введите телефон';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Почта',
              icon: Icon(Icons.email, color: Colors.blue),
              labelStyle: TextStyle(color: Colors.blue),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, введите почту';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: 'Пароль',
              icon: Icon(Icons.lock, color: Colors.blue),
              labelStyle: TextStyle(color: Colors.blue),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, введите пароль';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _regionController,
            decoration: const InputDecoration(
              labelText: 'Регион',
              icon: Icon(Icons.location_on, color: Colors.blue),
              labelStyle: TextStyle(color: Colors.blue),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, введите регион';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          buildRegistrationButton(),
        ],
      ),
    );
  }
}

class NewsPage extends StatelessWidget {
  final String language;

  const NewsPage({Key? key, required this.language}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новости'),
      ),
      backgroundColor: const Color(0xFF9400D3), // изменение цвета задней панели
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Главным фильмом года Академия кинематографических искусств и наук назвала масштабный байопик Кристофера Нолана «Оппенгеймер».', style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(), // добавленная нижняя панель навигации
    );
  }
}

class LanguageButton extends StatelessWidget {
  final String language;
  final IconData icon;
  final VoidCallback onPressed;

  const LanguageButton({Key? key, required this.language, required this.icon, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white), // Белая иконка
          const SizedBox(width: 8),
          Text(language, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.blue),
          label: 'Дом',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.work, color: Colors.blue),
          label: 'Работа',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_mail, color: Colors.blue),
          label: 'Контакты',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.apps, color: Colors.blue),
          label: 'Предложении',
        ),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const WorkPage()),
            );
            break;
          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ContactPage()),
            );
            break;
          case 3:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AppPage()),
            );
            break;
          default:
            break;
        }
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Дом'),
      ),
      backgroundColor: const Color(0xFF9400D3), // изменение цвета задней панели
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Казахстан занял лидирующее место по разводам', style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(), // добавленная нижняя панель навигации
    );
  }
}

class WorkPage extends StatelessWidget {
  const WorkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Работа'),
      ),
      backgroundColor: const Color(0xFF9400D3), // изменение цвета задней панели
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Главным фильмом года Академия кинематографических искусств и наук назвала масштабный байопик Кристофера Нолана «Оппенгеймер»', style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(), // добавленная нижняя панель навигации
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Контакты'),
      ),
      backgroundColor: const Color(0xFF9400D3), // изменение цвета задней панели
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Вы пропустили звонок от +77711111111', style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(), // добавленная нижняя панель навигации
    );
  }
}

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Предложения'),
      ),
      backgroundColor: const Color(0xFF9400D3), // изменение цвета задней панели
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('В Казахстане откроется магазин косметики', style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(), // добавленная нижняя панель навигации
    );
  }
}
