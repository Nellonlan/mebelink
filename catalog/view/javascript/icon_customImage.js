ymaps.ready(function () {
    var myMap = new ymaps.Map('map', {
            center: [54.512575, 36.253078],
            
            zoom: 18
        }, {
            searchControlProvider: 'yandex#search'
        }),

        // Создаём макет содержимого.
        MyIconContentLayout = ymaps.templateLayoutFactory.createClass(
            '<div style="color: #FFFFFF; font-weight: bold;">$[properties.iconContent]</div>'
        ),

        myPlacemark = new ymaps.Placemark([54.512680, 36.252870], {
            hintContent: '',
            balloonContent: 'МДК - ул. Достоевского, 27, ТЦ "Серпантин" (между Фетта-пиццей и Пятерочкой, ыход с улицы Дзержинского, аллейка), Тел. +7 960 516-31-74'
        }, {
            // Опции.
            // Необходимо указать данный тип макета.
            iconLayout: 'default#image',
            // Своё изображение иконки метки.
            iconImageHref: '/image/catalog/logo.png',
            // Размеры метки.
            iconImageSize: [52, 42],
            // Смещение левого верхнего угла иконки относительно
            // её "ножки" (точки привязки).
            iconImageOffset: [-10, -48]
        });

        
    myMap.geoObjects
        .add(myPlacemark);
});