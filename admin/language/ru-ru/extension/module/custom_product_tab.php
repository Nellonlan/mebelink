<?php
$_['extension_name']                    = 'Менеджер вкладок в товарах';

// Heading
$_['heading_title']                     = '<i class="fa fa-folder-o" style="font-size:14px;color:#F7951D;"></i> <strong>' . $_['extension_name'] . '</strong>' . (defined("CPT_STATUS") ? '<span style="display:inline-block;margin-left:20px;">' . (CPT_STATUS ? '<i style="color:#3c763d">[ Включено ]</i>' : '<i style="color:#a94442">[ Выключено ]</i>') . '</span>' : '');

// Buttons
$_['button_apply']                      = 'Применить';
$_['button_upgrade']                    = 'Обновить';
$_['button_fix_db']                     = 'Пофиксить';

// Tabs
$_['tab_settings']                      = 'Настройки';
$_['tab_tabs']                          = 'Вкладки';
$_['tab_support']                       = 'Инфо';
$_['tab_about']                         = 'О модуле';
$_['tab_general']                       = 'Основное';
$_['tab_faq']                           = 'FAQ';
$_['tab_services']                      = 'Услуги';
$_['tab_changelog']                     = 'Изменения';
$_['tab_extension']                     = 'Модули';

$_['tab_description']                   = 'Описание';
$_['tab_attribute']                     = 'Характеристики';
$_['tab_review']                        = 'Отзывы (%s)';

// Text
$_['text_success_upgrade']              = '<strong>Успешно!</strong> Обновлено ' . $_['extension_name'] . ' до версии <strong>%s</strong>!';
$_['text_success_update']               = '<strong>Успешно!</strong> Настройки модуля ' . $_['extension_name'] . ' изменено!';
$_['text_success_fix_db']               = '<strong>Успешно!</strong> Данные в базе данных успешно обновлены!';
$_['text_success_tab_delete']           = '<strong>Успешно!</strong> Вкладка \'%s\' удалена!';
$_['text_success_tab_add']              = '<strong>Успешно!</strong> Вкладка \'%s\' добавлена!';
$_['text_toggle_navigation']            = 'Показать меню';
$_['text_confirm_delete']               = 'Подтвердить удаление вкладки!';
$_['text_are_you_sure']                 = 'Восстановление после удаления невозможно. Удалить вкладку?';
$_['text_license']                      = 'Лицензия';
$_['text_extension_information']        = 'Инфо';
$_['text_legal_notice']                 = 'Использование';
$_['text_terms']                        = 'Правила';
$_['text_support_subject']              = $_['extension_name'] . ' нужна поддержка';
$_['text_license_text']                 = ' ';
$_['text_other_extensions']             = ' ';
$_['text_module']                       = 'Модули';
$_['text_faq']                          = 'FAQ';
$_['text_add_tab']                      = 'Добавить вкладку';
$_['text_delete_tab']                   = 'Удалить вкладку';
$_['text_no_products']                  = 'Не обновлять';
$_['text_all_products']                 = 'Для всех товаров';
$_['text_all_empty_products']           = 'Для всех товаров, где пустая вкладка';
$_['text_all_manufacturer_products']    = 'Для всех товаров производителя';
$_['text_all_category_products']        = 'Для всех товаров из категории';
$_['text_selected_products']            = 'Для выбранных товаров';
$_['text_default_tab']                  = 'По умолчанию';
$_['text_reserved_tab']                 = 'Сторонняя';
$_['text_regular_tab']                  = 'Стандартная';
$_['text_custom_tab_name']              = 'Название вкладки';
$_['text_autocomplete']                 = '(Автодополнение)';
$_['text_remove']                       = 'Удалить';
$_['text_overwrite_tab_content']        = 'Обновить контент вкладки';
$_['text_change_product_tab_status']    = 'Измененить статус вкладки';
$_['text_enable']                       = 'Включено';
$_['text_disable']                      = 'Отключено';
$_['text_no_action']                    = 'Не изменять';
$_['text_saving']                       = 'Сохранение ...';
$_['text_fixing']                       = 'Исправление ...';
$_['text_upgrading']                    = 'Обновление ...';
$_['text_canceling']                    = 'Отмена ...';
$_['text_loading']                      = 'Загрузка ...';
$_['text_no_records_found']             = 'Нет товаров по запросу';
$_['text_default_login_required_text']  = 'Вам необходимо <a href="%s">авторизоваться</a> чтобы видеть контент.';

// Help texts
$_['help_show_always']                  = 'Показывать вкладку даже если она будет пустой.';
$_['help_global_status']                = 'Для новых или определенных товаров статусом можно управлять ниже. Заметка! Новые вкладки автоматически включаются для всех товаров.';
$_['help_remove_sql_changes']           = 'Удалить изменения SQL когда модуль удаляется.';
$_['help_use_admin_language_value']     = 'Если контент вкладки какого-то языка остался пустым - заполнять его контеном вкладки языка по умолчанию';
$_['help_use_default_value_for_new']    = 'Заполнение контента вкладки значениями по умолчанию для новых товаров.';
$_['help_tab_type']                     = 'Тип вкладки «Сторонняя» не имеет контента. В шаблон вставляется только имя вкладки. Он предназначен для использования вместе со значением «ID вкладки» для привязки имени вкладки к контентк вкладки другого стороннего модуля.';
$_['help_tab_key']                      = 'ID вкладки используется для определения блока с контентом вкладки для показа при связывании этой вкладки с контентом вкладки другого стороннего модуля. Убедитесь, что значение соответствует фактическому id блока с контентом (без #).';
$_['help_overwrite']                    = 'Перезапишите контент вкладки для следующих товаров с указанным выше значением по умолчанию. <em>Вы должны выполнять ее каждый раз когда изменяете контент вкладки</em>';
$_['help_require_login']                = 'Показывать вкладку только для зарегистрированных и авторизованных клиентов';
$_['help_change_product_tab_status']    = 'Включение или отключение вкладки для определенных товаров.';
$_['help_condition']                    = '<em>(Необязательно, Дополнительно)</em> PHP-переменная или PHP-код для проверки того, должна ли отображаться пользовательская вкладка. Оценка выполняется в контексте файла product.tpl.<br/><span class="label label-info">Заметка!</span> Содержимое должно быть пустым или содержать только действительный PHP-код без конечной точки с запятой.';
$_['help_tab_key_alt']                  = '<em>(Необязательно)</em> Это можно использовать, чтобы дать пользовательской вкладке более удобный ID вкладки в формате SEO (без начального #). Если оставить пустым, будет использоваться общий ID.
<br/><span class="label label-info">Заметка!</span> Все вкладки должны иметь уникальные ID вкладок.';
$_['help_show_login_required_text']     = 'Покажите текст «Необходимо авторизоваться» для клиентов, которые не вошли в систему для вкладок, требующих входа в систему.';


// Entry
$_['entry_installed_version']           = 'Версия:';
$_['entry_extension_status']            = 'Статус:';
$_['entry_show_always']                 = 'Всегда показывать:';
$_['entry_use_admin_language_value']    = 'Заполнять все языки:';
$_['entry_use_default_value_for_new']   = 'Добавлять в новые товары:';
$_['entry_remove_sql_changes']          = 'Удалить SQL:';
$_['entry_tab_status']                  = 'Статус вкладки:';
$_['entry_tab_name']                    = 'Название вкладки:';
$_['entry_sort_order']                  = 'Порядок:';
$_['entry_require_login']               = 'Для зарегистрированных клиентов:';
$_['entry_tab_type']                    = 'Тип вкладки:';
$_['entry_tab_key']                     = 'ID вкладки:';
$_['entry_default_value']               = 'Контент:';
$_['entry_action']                      = 'Действие:';
$_['entry_products']                    = 'Товары:';
$_['entry_extension_name']              = 'Кодовое название:';
$_['entry_extension_compatibility']     = 'Совместимость:';
$_['entry_extension_store_url']         = 'URL магазина:';
$_['entry_copyright_notice']            = 'Копирайт:';
$_['entry_condition']                   = 'Условие';
$_['entry_show_login_required_text']    = 'Показывать текст "Необходимо авторизоваться"';
$_['entry_login_required_text']         = 'Текст "Необходимо авторизоваться"';

// Error
$_['error_permission']                  = '<strong>Ошибка!</strong> У вас нет доступа для управления модулем ' . $_['extension_name'] . '!';
$_['error_warning']                     = '<strong>Предупреждение!</strong> Проверьте форму на наличие ошибок!';
$_['error_vqmod']                       = '<strong>vQmod? Какой нафиг vQmod!</strong> Давно пора отказатся от него. Те кто делает модули на vQmod - мудаки!!!!';
$_['error_missing_table']               = '<strong>Ошибка!</strong> Кажется, что в вашей базе данных SQL отсутствует таблица \'%s\'!';
$_['error_missing_column']              = '<strong>Ошибка!</strong> Кажется, что в вашей таблице \'%s\' в базе данных отсутствует колонка \'%s\'!';
$_['error_unsaved_settings']            = '<strong>Предупреждение!</strong> Есть несохраненные настройки! Сохраните настройки.';
$_['error_version']                     = '<strong>Алярм!</strong> ' . $_['extension_name'] . ' вам нужно обновиться до ' . $_['extension_name'] . '!';
$_['error_upgrade_database']            = '<strong>Ошибка!</strong> Ошибка обновления базы данных!';
$_['error_ajax_request']                = 'Ошибка AJAX! Проверьте консоль ошибок JS в браузере (F12).';
$_['error_tab_name']                    = 'Введите название вкладки!';
$_['error_tab_key']                     = 'Введите ID вкладки!';
$_['error_add_tab']                     = '<strong>Предупреждение!</strong> Ошибка добавления новой вкладки!';
$_['error_delete_tab']                  = '<strong>Предупреждение!</strong> Ошибка удаления вкладки!';
$_['error_delete_default_tab']          = '<strong>Предупреждение!</strong> Невозможно удалять стандартные вкладки!';
$_['error_db_inconsistency']            = '<strong>Предупреждение!</strong> Найдены несоответсвия в базе данных!';
$_['error_fix_db_inconsistency']        = '<strong>Ошибка!</strong> Несоответсвия не исправлены!';
