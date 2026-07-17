# AGROSMART PLATFORM

AGROSMART PLATFORM es una aplicación web desarrollada para la gestión de ventas, inventario y pedidos de una distribuidora agrícola. El sistema permite realizar compras desde un catálogo web y administrar el inventario mediante distintos perfiles de usuario.

## Tecnologías utilizadas

- Python 3.14
- Flask
- MySQL 8.0
- HTML5
- CSS3
- JavaScript
- Bootstrap 5
- Git

## Requisitos

Antes de ejecutar el proyecto es necesario tener instalado:

- Python 3.14 o superior
- MySQL Server 8.0
- MySQL Workbench (opcional)
- Git

## Instalación

### 1. Clonar el repositorio

```bash
git clone https://github.com/miorellanas/AGROSMARTPLATFORM.git
```

Ingresar al proyecto.

```bash
cd AGROSMARTPLATFORM
```

---

### 2. Crear un entorno virtual

Windows

```bash
python -m venv venv
```

Activar el entorno.

```bash
venv\Scripts\activate
```

---

### 3. Instalar las dependencias

```bash
pip install flask
pip install flask-cors
pip install flask-mysqldb
pip install pymysql
pip install requests
pip install mysqlclient
```

También es posible instalar todas las dependencias utilizando:

```bash
pip install -r requirements.txt
```

---

### 4. Crear la base de datos

Abrir MySQL Workbench.

Crear una nueva base de datos llamada:

```sql
AGROSMART
```

Luego importar el archivo:

```
AGROSMART.sql
```

Este archivo contiene toda la estructura de tablas y los datos iniciales necesarios para ejecutar el proyecto.

---

### 5. Configurar la conexión

Abrir el archivo:

```
config.py
```

Modificar los datos de conexión según la configuración local.

Ejemplo:

```python
MYSQL_HOST = "localhost"
MYSQL_USER = "root"
MYSQL_PASSWORD = "tu_password"
MYSQL_DB = "AGROSMART"
```

---

### 6. Ejecutar el proyecto

Desde la carpeta principal ejecutar:

```bash
python app.py
```

Si todo está correcto aparecerá un mensaje similar a:

```
Running on http://127.0.0.1:5000
```

---

### 7. Abrir la aplicación

Ingresar desde el navegador a:

```
http://127.0.0.1:5000
```

o

```
http://127.0.0.1:5000/tienda
```

---

## Funcionalidades

El sistema permite:

- Visualizar catálogo de productos.
- Consultar stock por sucursal.
- Agregar productos al carrito.
- Registrar pedidos.
- Administrar inventario.
- Gestionar pedidos desde cobranzas.
- Registrar ventas desde el panel de vendedor.
- Integración con Transbank Webpay.
- Conversión automática de USD a CLP mediante Mindicador.

---

## Usuarios

El sistema cuenta con distintos perfiles:

- Cliente
- Vendedor
- Logística
- Cobranzas

Cada uno posee permisos diferentes dentro de la aplicación.

---

## APIs utilizadas

- Transbank Webpay (Ambiente de Integración)
- Mindicador API

---

## Observaciones

El proyecto fue desarrollado con fines académicos.

Para las pruebas de pago se utilizan las credenciales y tarjetas de integración entregadas por Transbank.

En caso de que la API de Mindicador no esté disponible, la conversión de moneda puede presentar errores al cargar el catálogo.
