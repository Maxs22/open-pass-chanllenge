# Star Wars Characters App

Esta es una aplicación Flutter que muestra una lista de personajes de Star Wars utilizando la API SWAPI (Star Wars API). La aplicación permite a los usuarios explorar personajes, agregarlos a favoritos y buscar personajes específicos.

## Características principales

- Lista de personajes de Star Wars obtenidos de SWAPI.
- Funcionalidad para agregar y quitar personajes de la lista de favoritos.
- Persistencia de datos de favoritos utilizando SharedPreferences.
- Barra de búsqueda para filtrar personajes por nombre.
- Interfaz con dos pestañas: una para todos los personajes y otra para favoritos.

## Requisitos previos

Antes de comenzar, asegúrate de tener instalado lo siguiente:

1. [Flutter SDK](https://flutter.dev/docs/get-started/install)
2. [Git](https://git-scm.com/downloads)
3. Un IDE (se recomienda [Android Studio](https://developer.android.com/studio) o [Visual Studio Code](https://code.visualstudio.com/))

## Configuración del proyecto

Sigue estos pasos para configurar el proyecto en tu máquina local:

1. Clona el repositorio:
   ```
   git clone https://github.com/Maxs22/open-pass-challenge.git
   ```

2. Navega al directorio del proyecto:
   ```
   cd star-wars-characters-app
   ```

3. Obtén las dependencias del proyecto:
   ```
   flutter pub get
   ```

## Ejecutar la aplicación

Para ejecutar la aplicación en modo de desarrollo:

1. Asegúrate de tener un emulador en ejecución o un dispositivo físico conectado.

2. Ejecuta el siguiente comando en la raíz del proyecto:
   ```
   flutter run
   ```

## Uso de la aplicación

1. Al abrir la aplicación, verás una lista de personajes de Star Wars.
2. Utiliza la barra de búsqueda en la parte superior para buscar personajes por nombre.
3. Toca el icono de estrella junto a un personaje para agregarlo o quitarlo de tus favoritos.
4. Cambia entre las pestañas "Todos" y "Favoritos" para ver la lista completa o solo tus personajes favoritos.
5. Los favoritos se guardarán automáticamente y persistirán incluso después de cerrar la aplicación.


## Dependencias principales

- [http](https://pub.dev/packages/http): Para realizar llamadas a la API SWAPI
- [shared_preferences](https://pub.dev/packages/shared_preferences): Para persistir los datos de favoritos

## Construir la aplicación

Para generar una versión de lanzamiento de la aplicación:

1. Para Android:
   ```
   flutter build apk
   ```

2. Para iOS (requiere una Mac):
   ```
   flutter build ios
   ```

## Pruebas

Para ejecutar las pruebas del proyecto:

```
flutter test
```

## Agradecimientos

- [SWAPI](https://swapi.dev/) por proporcionar la API de Star Wars
- [Flutter](https://flutter.dev/) por el framework de desarrollo