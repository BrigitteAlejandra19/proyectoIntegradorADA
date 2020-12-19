//  *** --------- INICIO ALGORITMO MENU DE INVENTARIO  *** ---------------- //

// Crear un sistema que permita controlar el Stock de productos en una tienda

//  CONDICIONES:
// 1. - Maximo de productos 30
// 2. - Mostrar la cantidad total de productos
// 3. - Mostrar el Stock de un producto
// 4. - Mostrar detalles de un producto
// 5. - Ingresar productos
// 6. - Actulizar el stock de un determinado producto. Maximo de stock de un producto 30
// 7. - Menu de opciones.

Algoritmo sistema_inventario
	
	// mostrar Bienvenida Al Sistema
	mostrarBienvenidaAlSistema();
	
	// Definimos variables
	Definir contador Como Entero;
	Definir cantMaxProducto Como Entero;
	Definir salirDelSistema Como Logico;
	
	// Inicializamos variables
	contador = 0;
	cantMaxProducto = 2;
	salirDelSistema = falso;
	
	Dimension producto[cantMaxProducto, 4];
	Dimension nombreProducto[cantMaxProducto, 2];
	
	// Mientras sea diferente a 0 pinto el menu, cuando sea 0 salgo del programa
	Mientras salirDelSistema = falso Hacer
		mostrarMenuPricipal(salirDelSistema, contador, cantMaxProducto, producto, nombreProducto);
	FinMientras
	
	
FinAlgoritmo

// Muestra en pantalla la cabecera principal de bienvenida al sistema
Funcion mostrarBienvenidaAlSistema()
	Escribir "||||||||||||******* Bienvenidos a CANDY POP 24/7  ********||||||||||||";
	Escribir "Presione una tecla para continuar";
	Esperar tecla
	Borrar Pantalla
FinFuncion

// Mostrar el menu principal
// salirDelSistema: logico para salir del sistema si el valor es true
// contador: represetan la cantidad total actual de productos que tenemos en nuestro inventario
// cantMaxProducto: represetan la cantidad Maxima de procductos permitida en nuestro inventario
Funcion mostrarMenuPricipal (salirDelSistema Por Referencia, contador Por Referencia, cantMaxProducto, producto Por Referencia, nombreProducto Por Referencia)
	
	Escribir "||||||||||||*******  CANDY POP 24/7  ********||||||||||||";
	Escribir "";
	Escribir "Elija la opción que desea realizar: ";
	Escribir "";
	Escribir "1) Consultar inventario";
	Escribir "2) Consultar precio del producto";
	Escribir "3) Consultar detalles del producto";
	Escribir "4) Vender productos";
	Escribir "5) Ingresar productos";
	Escribir "0) Salir";
	
	Leer opcionElegida;
	
	Segun opcionElegida
		1: consultarInventario(producto , nombreProducto, contador);
		2: consultarPrecio();
		3: consultarDetalleProducto();
		4: venderProducto();
		5: ingresarProducto(contador, cantMaxProducto, producto, nombreProducto);
		0: salir(salirDelSistema);
		De Otro Modo:
			Mientras opcionElegida < 0 o opcionElegida  > 5 Hacer
				Escribir "Por favor ingrese la opcion del 0 al 5.";
				Leer opcionElegida;
			FinMientras
	FinSegun
FinFuncion

// CONSULTAR INVENTARIO EXISTENCIA TOTAL
Funcion consultarInventario(producto , nombreProducto, contador)
	Borrar Pantalla
	Si contador = 0
		Escribir "               ---- INVENTARIO TIENDA ----";
		Escribir "  No hay productos en el inventario ";
		Escribir "";
	SiNo
		Escribir "               ---- INVENTARIO TIENDA ----";
		Escribir "  Ingrese la cantidad de artículos a listar (Posee", contador, " productos en el inventario)";
		Escribir "";
		
		Leer listarProductos;
		Borrar Pantalla;
		Escribir "                           INVENTARIO ";
		Escribir "";
		
		Mientras listarProductos < 0 o listarProductos > contador Hacer
			Escribir "Por favor ingrese una cantidad de productos valida, usted posee solo ", contador, "productos";
			Leer listarProductos;
		FinMientras
		
		Para contProd = 1 Hasta listarProductos Con Paso 1 Hacer
			Escribir "Codigo nº: ", producto[contProd, 1] , " - Precio $ ", producto[contProd, 3], " - Stock  ", producto[contProd, 2], " unidades"," - ",  "Nombre: ", nombreProducto[contProd,1]," - ",  "Categoria: ", nombreProducto[contProd,2];
		FinPara
	FinSi
	presioneParaVolverAlMenuPrincipal();
FinFuncion

// Consultar el precio de un producto determinado
Funcion consultarPrecio()
	
FinFuncion

// Consultar todos los detalles de un producto en particular
Funcion consultarDetalleProducto()
	
FinFuncion

// Vender un determinado producto causando que se dismiya el stock del mismo
Funcion venderProducto()
	Escribir "||||||||||||******  Menu de  Venta de Productos  ******||||||||||||";
FinFuncion

// Ingresar un determinado producto causando que se incremente el stock del mismo
Funcion ingresarProducto(contador Por Referencia, cantMaxProducto, producto Por Referencia, nombreProducto Por Referencia)
	Borrar Pantalla
	Escribir "||||||||||||******  Menu de Ingreso de Productos  ******||||||||||||";
	//Validacion de maximos productos
	Si contador > cantMaxProducto
		Escribir "";
		Escribir "Ha alcanzado la cantidad maxima de productos para ingresar";
		presioneParaVolverAlMenuPrincipal();
	SiNo
		// Definimos variables
		Definir codigo como entero;
		Definir catindad como entero;
		Definir precio como entero;
		Definir nombre como texto;
		Definir categoria como texto;
		
		// Inicializamos variables
		codigo = 0;
		cantidad = 0;
		precio = 0;
		nombre = "";
		categoria = "";
		
		Escribir "||||||||||||******  Menu de Ingreso de Productos  ******||||||||||||";
		Escribir "Ingrese el codigo del Producto";
		Leer codigo;
		Escribir "Ingrese la cantidad del Producto";
		Leer cantidad;
		Escribir "Ingrese el nombre del Producto";
		Leer nombre;
		Escribir "Ingrese el precio del Productos";
		Leer precio;
		Escribir "Ingrese la categoria del Producto";
		Leer categoria;
		Borrar Pantalla
		Escribir "Usted ha ingresado el siguiente producto:";
		Escribir "|COD|    |CANTIDAD|    |NOMBRE|          |PRECIO $ |       |CATEGORIA|";
		Escribir " ",codigo, "       ", cantidad, "           ", nombre, "               ", precio, "                   ", categoria;
		
		guardarProducto(producto, nombreProducto, contador, codigo, cantidad, precio, nombre, categoria);
		
		presioneParaVolverAlMenuPrincipal();
	FinSi
	
FinFuncion

// Guardando en el diccionario de datos del producto
Funcion guardarProducto(producto Por Referencia, nombreProducto Por Referencia, contador Por Referencia, codigo, cantidad, precio, nombre, categoria)
	// Definimos variables
	Definir opcionGuardar como entero;
	opcionGuardar = 1;
	Escribir "";
	Escribir "¿Esta seguro de guardar los datos ingresados? (ingrese 1 para guardar o 2 para cancelar):";
	leer opcionGuardar;
	Segun opcionGuardar hacer
		1: // Datos enteros
			contador = contador + 1;
			producto[contador, 1] = codigo;
			producto[contador, 2] = cantidad;
			producto[contador, 3] = precio;
			// Datos de texto
			nombreProducto[contador, 1] = nombre;
			nombreProducto[contador, 2] = categoria;
			Escribir"El producto se ha guardado con exito";
		2: Escribir"El producto no se guardo";
		De Otro Modo:
			Mientras opcionGuardar < 1 o opcionElegida  > 2 Hacer
				Escribir "Por favor ingrese 1 para guardar o 2 para cancelar";
				Leer opcionElegida;
			FinMientras
	FinSegun
FinFuncion

// Salir del sistema
// salirDelSistema: logico para salir del sistema si el valor es true
Funcion salir(salirDelSistema Por Referencia)
	salirDelSistema = verdadero;
	Borrar Pantalla
	Escribir "||||||||||*****  Gracias por visitar CANDY POP 24/7  ******||||||||||";
FinFuncion

// Espera que el usuario presion una tecla para volver al menu principal
Funcion presioneParaVolverAlMenuPrincipal()
	Escribir "";
	Escribir "Presione una tecla para volver al Menu principal";
	Esperar tecla
	Borrar Pantalla
FinFuncion
