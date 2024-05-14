
# Phase Three Flutter Project Call Api Package

Project that solves phase 3 of the practical growth path in flutter.

## Download

Download phase_three project package

```bash
  git clone git@github.com:felipepragma/phase_three.git
```

Run example project

```bash
  cd example
  flutter pub get
  flutter run
```
    
## API Reference

call api https://fakestoreapi.com/

#### Get all products

```http
  GET /products
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `list`      | `array` | list of products |

#### Get item

```http
  GET /products/${id}
```
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `id` | `string` | iD product |
| `title` | `string` | iD product |
| `price` | `string` | iD product |
| `category` | `string` | iD product |
| `description` | `string` | iD product |
| `image` | `string` | iD product |


```http
  GET /products/categories
```
| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `list`      | `array of string` | list of categories |
