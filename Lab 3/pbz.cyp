CREATE
  (USA: Country {name: "USA"}),
  (Korea: Country {name: "Korea"}),
  (Japan: Country {name: "Japan"}),
  (China: Country {name: "China"}),

  (Apple: Company {name: "Apple", foundation_date: 1976}) -[:LOCATION]-> (USA),
  (LG: Company {name: "LG", foundation_date: 1947}) -[:LOCATION]-> (Korea),
  (Samsung: Company {name: "Samsung", foundation_date: 1940}) -[:LOCATION]-> (Korea),
  (Sony: Company {name: "Sony", foundation_date: 1946}) -[:LOCATION]-> (Japan),
  (Lenovo: Company {name: "Lenovo", foundation_date: 1984}) -[:LOCATION]-> (China),

  (aa1: Smartphone {name: "iPhone 11 Pro", price: 2300}) -[:SMARTPHONE]-> (Apple),
  (aa2: Smartphone {name: "Samsung Galaxy Z Flip", price: 3300}) -[:SMARTPHONE]-> (Samsung),
  (aa3: Smartphone {name: "iPhone 12 Pro", price: 4000}) -[:SMARTPHONE]-> (Apple),

  (bb1: Playstation {name: "Playstation 5", price: 3000}) -[:PlAYSTATION]-> (Sony), 

  (cc1: TV {name: "LG OLED77W9PLA", price: 1000}) -[:TV]-> (LG),
  (cc2: TV {name: "QLED 8K Q900R", price: 1500}) -[:TV]-> (Sony),

  (dd1: Laptop {name: "MacBook Air", price: 2500}) -[:LAPTOP]-> (Apple),
  (dd2: Laptop {name: "Lenovo Ideapad 720s", price: 1200}) -[:LAPTOP]-> (Lenovo), 

  (ee1: Watch {name: "Apple Watch Series 3", price: 900}) -[:WATCH]-> (Apple),
  (ee2: Watch {name: "Galaxy Watch", price: 700}) -[:WATCH]-> (Samsung),

  (games: Function {name: "Games"}),
  (call: Function {name: "Call"}),
  (video: Function {name: "Video"}),
  (filmScreening: Function {name: "FilmScreening"}),

  (aa1) -[:APPOINTMENT]-> (games),
  (aa1) -[:APPOINTMENT]-> (call),
  (aa1) -[:APPOINTMENT]-> (video),
  (aa1) -[:APPOINTMENT]-> (filmScreening),

  (aa2) -[:APPOINTMENT]-> (games),
  (aa2) -[:APPOINTMENT]-> (call),
  (aa2) -[:APPOINTMENT]-> (video),
  (aa2) -[:APPOINTMENT]-> (filmScreening),

  (aa3) -[:APPOINTMENT]-> (games),
  (aa3) -[:APPOINTMENT]-> (call),
  (aa3) -[:APPOINTMENT]-> (video),
  (aa3) -[:APPOINTMENT]-> (filmScreening),

  (bb1) -[:APPOINTMENT]-> (games),

  (cc1) -[:APPOINTMENT]-> (filmScreening),
  (cc2) -[:APPOINTMENT]-> (filmScreening),

  (dd1) -[:APPOINTMENT]-> (filmScreening),
  (dd2) -[:APPOINTMENT]-> (games),
  (dd2) -[:APPOINTMENT]-> (filmScreening),

  (ee1) -[:APPOINTMENT]-> (call),
  (ee2) -[:APPOINTMENT]-> (call)



// 1 найти компании, которые основаны в корее позже 1945
MATCH
  (company: Company) -[:LOCATION]-> (:Country{name: "Korea"})
 WHERE company.foundation_date > 1945
RETURN company

// 2 найти телевизоры, производитель которых является корейская компания
MATCH
  (tv: TV) -[:TV]-> (company: Company) -[:LOCATION]-> (:Country{name: "Korea"})
RETURN tv
 
// 3 найти всю продукци Apple
MATCH
(production)-[*]->(:Company{name: "Apple"})
RETURN production

// 4 найти устройства , которые предназначены для звонков
MATCH
  (device) -[:APPOINTMENT]-> (:Function{name: "Call"})
RETURN device

// 5 найти телефоны, стоимость которых больше 3000 и произведены в США
MATCH
  (telephone: Smartphone) -[:SMARTPHONE]-> (company: Company)-[:LOCATION]-> (:Country{name: "USA"})
  WHERE telephone.price > 3000
RETURN telephone

// 6 найти дату оснований компаний, расположенных в Китае
MATCH
  (company: Company) -[:LOCATION]-> (:Country{name: "China"})
RETURN company.foundation_date

// 7 найти количество продукции, произведенных в Корее
MATCH
  (production) -[*]-> (company: Company) -[:LOCATION]-> (:Country{name: "Korea"})
RETURN COUNT(production)

// 8 найти среднюю цену телефонов
MATCH
  (telephone: Smartphone) -[:SMARTPHONE]-> (company: Company)
RETURN AVG(telephone.price)

// 9 Японские компании, где средняя стоимость плэйстэйшн >= 3000
MATCH
  (pl: Playstation) -[:PlAYSTATION]-> (company: Company) -[:LOCATION]-> (:Country{name: "Japan"})
  WITH pl, company, AVG(pl.price) AS price
  WHERE price >= 3000
RETURN company

// 10 найти максимальную стоимость ноутбуков, предназначенных для просмотра фильмов
MATCH   
  (nb: Laptop) -[:APPOINTMENT]-> (:Function{name: "FilmScreening"}),  
  (nb: Laptop) -[:LAPTOP]-> (company: Company) 
RETURN MAX(nb.price)

