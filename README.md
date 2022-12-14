# enrollee
## SQL-запросы к таблицам БД "PostgreSQL" в Rails - приложении. Часть 4.  База данных «Абитуриент» 

###### Ruby: `3.0.3` Rails: `6.1.6` Language: `Russian`

Основано на выполнении заданий 4-й части курса [`MySQL`](https://stepik.org/course/63054/syllabus)

Данное приложение по сути не является завершенным проектом, а представляет собой лишь пример (набор) SQL-запросов к БД PostgreSQL для создания моделей, добавления миграций и взаимодействия с БД при помощи чистого SQL. Примеры запросов можно найди в директории `app/models`.

### Установка:
1. Клонируйте репозиторий
```
$ git clone git@github.com:ProfessorNemo/testing.git
```

2. Установите библиотеки
```
$ bundle
```

3. Создайте базу данных и запустите миграции
```
$ make up
```

### Предметная область:

В университете реализуется on-line тестирование по нескольким дисциплинам. Каждая дисциплина включает некоторое количество вопросов. Ответы на вопрос представлены в виде вариантов ответов, один из этих вариантов правильный.

Студент регистрируется в системе, указав свое имя, фамилию и отчество. После этого он может проходить тестирование по одной или нескольким дисциплинам. Студент имеет несколько попыток для прохождения тестирования  (необходимо сохранять дату попытки). Каждому студенту случайным образом выбирается набор вопросов по дисциплине и формируется индивидуальный тест. Студент отвечает на вопросы, выбирая один из предложенных вариантов ответа.

После окончания тестирования  вычисляется и сохраняется результат (в процентах) попытки.

### Концептуальная модель базы данных:
![Снимок экрана от 2022-12-04 03-34-31](https://user-images.githubusercontent.com/102049907/205468142-04675ebf-59cc-4f8a-9054-cc4bf514d29d.png)

### Логическая модель базы данных:
![Снимок экрана от 2022-12-04 03-35-33](https://user-images.githubusercontent.com/102049907/205468156-41f24b86-eddc-450e-a27d-450eeca029ab.png)


