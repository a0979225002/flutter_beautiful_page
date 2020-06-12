import 'activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({
    this.imageUrl,
    this.city,
    this.country,
    this.description,
    this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: 'assets/images/stmarksbasilica.jpg',
    name: '聖母可大教堂',
    type: '觀光旅遊',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 50000,
  ),
  Activity(
    imageUrl: 'assets/images/gondola.jpg',
    name: '徒步遊和纜車之旅',
    type: '觀光旅遊',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 29999,
  ),
  Activity(
    imageUrl: 'assets/images/murano.jpg',
    name: '威尼斯潟湖之旅：穆拉諾島和布拉諾島',
    type: '觀光旅遊',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 70000,
  ),
  Activity(
    imageUrl: 'assets/images/stmarksbasilica.jpg',
    name: '聖母可大教堂',
    type: '觀光旅遊',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 50000,
  ),
  Activity(
    imageUrl: 'assets/images/gondola.jpg',
    name: '徒步遊和纜車之旅',
    type: '觀光旅遊',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 29999,
  ),
  Activity(
    imageUrl: 'assets/images/murano.jpg',
    name: '威尼斯潟湖之旅：穆拉諾島和布拉諾島',
    type: '觀光旅遊',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 70000,
  ),

];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/venice.jpg',
    city: '威尼斯',
    country: 'Italy',
    description: '前往威尼斯進行一次令人難忘的難忘冒險。',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/paris.jpg',
    city: '巴黎',
    country: 'France',
    description: '前往巴黎進行一次令人難忘的難忘冒險。',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/newdelhi.jpg',
    city: '新德里',
    country: 'India',
    description: '前往新德里進行一次令人難忘的難忘冒險。',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/saopaulo.jpg',
    city: '聖保羅',
    country: 'Brazil',
    description: '前往聖保羅進行一次令人難忘的難忘冒險。',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/newyork.jpg',
    city: '紐約市',
    country: 'United States',
    description: '前往紐約市進行一次令人難忘的難忘冒險。',
    activities: activities,
  ),
];
