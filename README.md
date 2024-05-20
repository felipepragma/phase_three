
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
    
## How to use

How to import the package.

```bash
  import 'package:api_call_package/api_call_package.dart' as api_call_package;
```

How use the package.

```bash
  final getAllProducts = await api_call_package.ApiCall.getAllProducts();
  getAllProducts.fold(
    (error) => print('Error api call: $error'),
    (success) => print('List Products: $success'),
  );
```


## Package Documentation

Entry point class ApiCall() all methods return a Either class of dartz package

#### Get all products method

```dart
   ApiCall.getAllProducts()
```

| Return Object | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `error`      | `ApiError` | error type call api |
| `success`      | `List<ProductModel>` | list of products |

#### Get product by id

```dart
  ApiCall.getProductById(id)
```
| Return Object | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `error`      | `ApiError` | error type call api |
| `success`      | `ProductModel` | product by id |

#### Get categories

```dart
  ApiCall.getCategories()
```
| Return Object | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `error`      | `ApiError` | error type call api |
| `success`      | `List<String>` | list of categories |


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
