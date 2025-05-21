## [REST API](http://localhost:8080/doc)

## Concept:

- Spring Modulith
    - [Introduction to Spring Modulith](https://www.baeldung.com/spring-modulith)
    - [Introducing Spring Modulith](https://spring.io/blog/2022/10/21/introducing-spring-modulith)
    - [Spring Modulith - Reference documentation](https://docs.spring.io/spring-modulith/docs/current-SNAPSHOT/reference/html/)

```
  url: jdbc:postgresql://localhost:5432/jira
  username: jira
  password: JiraRush
```

- There are two tables, which do not have foreign keys
    - _Reference_ - directory. Make the link using _code_ (using id is not allowed, as id is tied to the environment-specific base)
    - _UserBelong_ - link users with type (owner, lead, ...) to object (task, project, sprint, ...). FK will be checked manually

## Analogues

- https://java-source.net/open-source/issue-trackers

## Testing

- https://www.youtube.com/watch?v=aEW8ZH6wj2o

## List of completed tasks:
- Comprendí la estructura del proyecto (incorporación). 
- Eliminar redes sociales: facebook
- Coloque la información confidencial en un archivo de propiedades separado:
  - iniciar sesión 
  - contraseña de base de datos 
  - identificadores para registro/autorización de OAuth 
  - configuración de correo 
- Escriba pruebas para todos los métodos públicos del controlador ProfileRestController. Aunque solo hay 2 métodos, debería haber más métodos de prueba, porque debe verificar la ruta de éxito y fracaso. 
- Refactorice el método com.javarush.jira.bugtracking.attachment.FileUtil#upload para que utilice un enfoque moderno para trabajar con el sistema de archivos.


...