# Тестовое задание

## Сделать iOS приложение с учетом следующего дизайна: https://drive.google.com/file/d/0B2kqulHSdkiIWDR3TWhvUF9oT0k/view?usp=sharing

### Задача: 

На экране присутствует слайдер(Stories, Video, Favorites) с UIPageControl, скролить должно к каждой странице. На первой присутствует анимированный UIPageControl с иконкой Top(она есть всегда и не скролится). Дальше идут итемы новостей(в нашем случае видео). Остальные страницы(Video, Favorites) могут быть заполнены по желанию или показывать текст (No Results).  Так же необходимо реализовать поиск элементов. По нажатию на поиск - переходим на новый экран с UISearchBar.  Остальные элементы и анимация могут быть реализованы по желанию  будет как +. 

- В проекте необходимо использовать констрейнты. 
- Swift 4.2 или новее
- в блоке с  UIPageControl показывать Top Rated видео 
- в списке показывать Самые популярные
- приложение должно корректно работать на iphone SE и адаптировано под Iphone X и новее
- желательно использовать MVP архитектуру
- клетки создавать как отдельные xib
- поддержка  iOS11 и новее
- соблюдать стилистику кода, основные моменты описаны здесь https://github.com/raywenderlich/swift-style-guide

## Дока по API для запросов
https://developers.themoviedb.org/3/movies/get-top-rated-movies


## api_key
f910e2224b142497cc05444043cc8aa4
