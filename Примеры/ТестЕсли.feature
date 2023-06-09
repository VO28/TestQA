﻿#language: ru

@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: ТестЕсли
* Проверка видимости элемента
	Если элемент формы с именем "Company" отсутствует на форме Тогда
		И я нажимаю кнопку выбора у поля с именем "Company"
	И я нажимаю кнопку выбора у поля "Вид цены"
* Сверка с макетом когда не совпадают строки	
	Если Табличный документ "Result" равен макету "Закупки2" Тогда
	ИначеЕсли Табличный документ "Result" равен макету "Закупки1" Тогда
	Иначе
		Тогда я вызываю исключение "Макет не совпал с эталоном"
* Проверка в разном окружении		
	Если это Linux Тогда
	Если это web клиент Тогда
* Стабилизация тестов	
	Если появилось окно с заголовком "Соглашение (создание)" в течение 10 секунд Тогда
		И я закрываю окно "Соглашение (создание)"
* При создании первоначальных настроек		
	Если в таблице "List" нет строка Тогда
		| 'Контрагент'  |
		| 'Контрагент1' |
		И я нажимаю на кнопку "Создать"
* Разные условия
	Если я нажимаю кнопку выбора у поля с именем "Company" Тогда
		И я закрываю текущее окно		