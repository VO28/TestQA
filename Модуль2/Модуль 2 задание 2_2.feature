﻿#language: ru

@tree

Функционал: Заказ

Как менеджер по продажам я хочу
оформить заказ
чтобы продать товар   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Заказ клиента расчет итог количество товаров
	И Создание нового документаа заказ
	И Заполнение шапки документа заказ
* Проверка итого каличества при добавлении строк
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И я выбираю пункт контекстного меню с именем 'ТоварыКонтекстноеМенюСкопировать' на элементе формы с именем "Товары"
	Тогда элемент формы с именем "ТоварыИтогКоличество" стал равен '20'
* Проверка итого количества при удалении строк
	И я выбираю пункт контекстного меню с именем 'ТоварыКонтекстноеМенюУдалить' на элементе формы с именем "Товары"
	Тогда элемент формы с именем "ТоварыИтогКоличество" стал равен '10'						
* Проверка итого количества при изменении строк
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '55'
	И в таблице "Товары" я завершаю редактирование строки
	Тогда элемент формы с именем "ТоварыИтогКоличество" стал равен '55'
		