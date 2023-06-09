﻿#language: ru

@tree

Функционал: тестирование отчетов

Как Тестировцик я хочу
проинспектировать отчеты 
чтобы проверить что у пользователя не возникнет проблем   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _0901 подготовительный сценарий (тестирование отчетов)
	//Когда экспорт основных данных
	Когда экспорт документов закупок
	И я выполняю код встроенного языка на сервере
		| 'Документы.PurchaseOrder.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписидокумента.Проведение);'  |
		| 'Документы.PurchaseOrder.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписидокумента.Проведение);'  |
		| 'Документы.PurchaseOrder.НайтиПоНомеру(3).ПолучитьОбъект().Записать(РежимЗаписидокумента.Проведение);'  |
		| 'Документы.PurchaseInvoice.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписидокумента.Проведение);' |
		| 'Документы.PurchaseInvoice.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписидокумента.Проведение);' |

Сценарий: _0902 проверка отчета Информация по номенклатуре
	И В командном интерфейсе я выбираю 'Отчеты' 'D0010 Информация по товарам'
	Тогда открылось окно 'D0010 Информация по товарам'
	И в табличном документе 'Result' я перехожу к ячейке "R1C1"
	И я нажимаю на кнопку с именем 'FormGenerate'
//	Тогда табличный документ "Result" равен:
//		| 'Номенклатура'                          | 'Файл' | 'Штрихкод'                         |
//		| 'Характеристика'                        | ''     | ''                                 |
//		| 'Серия номенклатуры'                    | ''     | ''                                 |
//		| 'Товар с характеристиками'              | ''     | '67676787889899\n90997878798989\n' |
//		| 'S/Красный'                             | ''     | '67676787889899'                   |
//		| 'XS/Черный'                             | ''     | '90997878798989'                   |
//		| 'M/Черный'                              | ''     | ''                                 |
//		| 'Товар без характеристик'               | ''     | '787889899'                        |
//		| 'Товар без характеристик'               | ''     | '787889899'                        |
//		| 'Услуга'                                | ''     | ''                                 |
//		| 'Услуга'                                | ''     | ''                                 |
//		| 'Товар со спецификацией'                | ''     | '\n\n'                             |
//		| 'Товар со спецификацией/Спецификация 1' | ''     | ''                                 |
//		| 'Товар со спецификацией/Спецификация 2' | ''     | ''                                 |
//		| 'XS/Красный'                            | ''     | ''                                 |
//		| 'Набор'                                 | ''     | '\n\n'                             |
//		| 'Набор/Набор'                           | ''     | ''                                 |
//		| 'Набор/Товар с характеристиками'        | ''     | ''                                 |
//		| 'Набор/'                                | ''     | ''                                 |
	Дано Табличный документ "Result" равен макету "ИнформацияПоТоварам1" по шаблону
	И в табличном документе "Result" ячейка с адресом "R8C3" равна "78788989*" по шаблону

Сценарий: _0903 проверка отчета по Закупкам	
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Отчеты' 'D1001 Закупки'
	Тогда открылось окно 'D1001 Закупки'
	И в табличном документе 'Result' я перехожу к ячейке "R1C1"
	И я нажимаю на кнопку с именем 'FormGenerate'
	И я жду когда в табличном документе "Result" заполнится ячейка "К16С4" в течение 20 секунд
	//И я жду, что в табличном документе "ИмяРеквизита" ячейка "АдресЯчейки" станет равна "ЗначениеЯчейки" в течение 20 секунд
	Дано Табличный документ "Result" равен макету "Закупки1" по шаблону