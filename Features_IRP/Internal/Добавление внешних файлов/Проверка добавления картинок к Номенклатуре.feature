﻿#language: ru

@tree

Функционал: проверка добавления картинок в справочник Номенклатура

Как Менеджер я хочу
добавить картинки в номенклатуре
чтобы можно было поглядеть как выглядит товар 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _0601 подготовительный (добавление картинок)
	//Когда экспорт основных данных
	Когда экспорт настроек картинок
	//И Я устанавливаю в данную базу расширение "IRP_TestExtension" из каталога исходников "$КаталогПроекта$\Features_IRP\Additional"
	И я закрываю TestClient "Этот клиент"
	И Я устанавливаю в базу расширение из файла "$КаталогПроекта$\Features_IRP\Additional\IRP_TestExtension.cfe"
	И я подключаю профиль TestClient "Этот клиент"
	

Сценарий: _0602 проверка добавления картинки
	Дано Я открываю навигационную ссылку "e1cib/data/Catalog.Items?ref=b762b13668d0905011eb76684b9f687d"
	И я выбираю файл "$КаталогПроекта$\Features_IRP\Files\itempicture1.png"
	И я делаю клик по элементу клиента тестирования '+' 'Тип' UI Automation
	И я нажимаю на кнопку с именем "update_slider"
	//И я делаю клик по элементу клиента тестирования 'Бренд 1' 'Тип' UI Automation
	