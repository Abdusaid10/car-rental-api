# Car-Rental-API
This repository contains the REST API for the <a href="https://github.com/Abdusaid10/car-rental-client">car-rental-client</a> project. With this API you can handle user sign up and sign in, add car types using Category module, add manufacturer and cars. For the manufacturer you can upload logo and image of company building. Also you can upload image of the car.

### Technologies Used
- Rails 6
- Ruby 2.6.5
- Active Model Serializers
- PostreSQL
- Bcrypt
- Rack-Cors
- Active Storage

## Live version

A live version is hosted on Heroku.
- [**CAR-RENTAL-API**](https://car-booking-api-app.herokuapp.com/)

## Run Locally
To get a local copy up and running follow these simple example steps.

```bash
git clone https://github.com/Abdusaid10/car-rental-api
cd car-rental-api
```
> Install dependencies
```bash
bundle install
```
> Create db
```bash
rails db:create
```
> Migrate db
```bash
rails db:migrate
```
> Seed db
```bash
rails db:seed
```
> Run Locally
```bash
rails s
```
It runs the app in the development mode.<br />
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

## 👤 Author

### Abdusaid Abdurasulov

- Github: [@Abdusaid10](https://github.com/Abdusaid10)
- Twitter: [@abdusaid_A](https://twitter.com/abdusaid_a)
- Linkedin: [Abdusaid Abdurasulov](linkedin.com/in/abdusaid)
- AngelList: [Abdusaid Abdurasulov](https://angel.co/u/abdusaid-abdurasulov)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Abdusaid10/car-rental-api/issues).

1. Fork it (https://github.com/Abdusaid10/car-rental-api/fork)
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Show your support

Give a ⭐️ if you enjoyed this project!

## 📝 License

This project is [MIT](https://github.com/Abdusaid10/car-rental-api/blob/master/LICENSE) licensed.