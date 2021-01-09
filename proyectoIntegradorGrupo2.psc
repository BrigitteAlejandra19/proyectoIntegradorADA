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
//OPCIONALES
//a)Controlar ingreso de usuario (si pone precio cero o stock negativo, si vende mas productos de los que tienen disponibles)
//b)agregar opciones de venta (mpstrar precio y descontar de a 1 unidad)
//c)Listar los productos sin stock
//d)listar los 3 productos mas caros
//Listar los 3 productos mas economicos

Algoritmo sistema_inventario
	
	// mostrar Bienvenida Al Sistema
	mostrarBienvenidaAlSistema();
	
	// Definimos variables
	Definir contador Como Entero;
	Definir cantMaxProducto Como Entero;
	Definir salirDelSistema Como Logico;
	
	// Inicializamos variables
	contador = 5;
	cantMaxProducto = 30;
	salirDelSistema = falso;
	
	Dimension producto[cantMaxProducto, 4];
	Dimension nombreProducto[cantMaxProducto, 2];
	
	// Cargamos algunos productos por defecto
	cargarProductos(producto, nombreProducto);
	
	// Mientras sea diferente a 0 pinto el menu, cuando sea 0 salgo del programa
	Mientras salirDelSistema = falso Hacer
		mostrarMenuPricipal(salirDelSistema, contador, cantMaxProducto, producto, nombreProducto);
	FinMientras
	
	
FinAlgoritmo

// Muestra en pantalla la cabecera principal de bienvenida al sistema
Funcion mostrarBienvenidaAlSistema()
	Escribir "                Bienvenidos al inventario Online";
	Escribir "";
	Escribir "";
	Escribir "                ###############################";
	Escribir "                #        CANDY POP 24/7       #";
	Escribir "                ###############################";
	Escribir "";
	Escribir "                          By Grupo 2";
	Escribir "";
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
	Escribir "              Elija la opción que desea realizar: ";
	Escribir "            ___________________________________________";
	Escribir "           | 1) Consultar inventario                   |";
	Escribir "           | 2) Consultar precio del producto          |";
	Escribir "           | 3) Vender productos                       |";
	Escribir "           | 4) Ingresar productos                     |";
	Escribir "           | 5) Consultar productos sin Stock          |";
	Escribir "           | 6) Listar los 3 productos màs econòmicos  |";
	Escribir "           | 7) Listar los 3 productos màs costosos    |";
	Escribir "           | 0) Salir                                  |";
	Escribir "           |___________________________________________|";
	
	Leer opcionElegida;
	Borrar Pantalla
	Segun opcionElegida
		1: consultarInventario(producto , nombreProducto, contador); 
		2: consultarPrecio(producto , nombreProducto, contador);
		3: venderProducto(producto, contador, nombreProducto);
		4: ingresarProducto(contador, cantMaxProducto, producto, nombreProducto);
		5: consultarProductosSinStock(producto , nombreProducto, contador);
		6: consultarProductosMasEconomicos(producto , nombreProducto, cantMaxProducto, 3);
		7: consultarProductosMasCostosos(producto , nombreProducto, cantMaxProducto, 3);
		0: salir(salirDelSistema);Borrar Pantalla
		De Otro Modo:
			Mientras opcionElegida < 0 o opcionElegida  > 7 Hacer
				Escribir "Por favor ingrese la opcion del 0 al 7.";
				Leer opcionElegida;
				Borrar Pantalla
			FinMientras
			
	FinSegun
FinFuncion

// CONSULTAR INVENTARIO EXISTENCIA TOTAL
Funcion consultarInventario(producto , nombreProducto, contador)
	Borrar Pantalla
	Escribir "               ---- INVENTARIO TIENDA ----";
	Si contador = 0
		Escribir "  No hay productos en el inventario ";
		Escribir "";
	SiNo
		Escribir "  Ingrese la cantidad de artículos a listar (Posee ", contador, " productos en el inventario)";
		Escribir "";
		
		Leer listarProductos;
		Borrar Pantalla;
		Escribir "                           INVENTARIO ";
		Escribir "";
		
		Mientras listarProductos < 0 o listarProductos > contador Hacer
			Escribir "Por favor ingrese una cantidad de productos valida, usted posee solo ", contador, " productos";
			Leer listarProductos;
		FinMientras
		
		imprimirProductosAscendente(listarProductos, producto, nombreProducto);
	FinSi
	presioneParaVolverAlMenuPrincipal();
FinFuncion

// CONSULTAR PRODUCTOS SIN STOCK
Funcion consultarProductosSinStock(producto , nombreProducto, contador)
	Borrar Pantalla
	Escribir "               ---- CONSULTAR PRODUCTOS SIN STOCK ----";
	Si contador = 0 Entonces
		Escribir "  No hay productos en el inventario ";
		Escribir "";
	SiNo
		Para contProd = 1 Hasta contador Con Paso 1 Hacer
			si producto[contProd, 2] = 0 Entonces
				Escribir "Codigo nº: ", producto[contProd, 1] , " - Precio $ ", producto[contProd, 3], " - Stock  ", producto[contProd, 2], " unidades"," - ",  "Nombre: ", nombreProducto[contProd,1]," - ",  "Categoria: ", nombreProducto[contProd,2];
			FinSi
		FinPara
	FinSi
	presioneParaVolverAlMenuPrincipal();
FinFuncion

// Consultar el precio de un producto determinado
Funcion consultarPrecio(producto , nombreProducto, contador)
	Borrar Pantalla
	Definir posicionProducto Como Entero;
	posicionProducto = 0; 
	Escribir "||||||||||||*******  CONSULTA DE PRECIOS  ********||||||||||||";
	Escribir "";
	Escribir "Por favor ingrese el codigo del producto que desea consultar";
	Leer codigo;
	posicionProducto = buscarProductoPorCodigo(producto, contador, codigo);
	Si posicionProducto  <> 0 Entonces
		Escribir "El precio del producto ",nombreProducto[posicionProducto, 1] , " es: ",  producto[posicionProducto, 3] ;
	FinSi
	presioneParaVolverAlMenuPrincipal();
FinFuncion


// Vender un determinado producto causando que se disminuya el stock del mismo
Funcion venderProducto(producto Por Referencia, contador, nombreProducto)
	Definir cantidadParaVender Como Entero;
	Definir stockDelProducto Como Entero;
	cantidadParaVender = 0;
	Escribir "||||||||||||******  Menu de  Venta de Productos  ******||||||||||||";
	Escribir "Por favor ingrese el codigo del producto que desea vender";
	Leer codigo;
	posicionProducto = buscarProductoPorCodigo(producto, contador, codigo);
	Si posicionProducto  <> 0 Entonces
		stockDelProducto = producto[posicionProducto, 2];
		Si producto[posicionProducto, 2] = 0 Entonces
			Escribir "Del prodcuto",nombreProducto[posicionProducto, 1] , " , no hay un stock";
		SiNo
			Escribir "Del prodcuto ",nombreProducto[posicionProducto, 1] , " hay un stock de ",  stockDelProducto ," con un precio unitario de " producto[posicionProducto, 3];
			Escribir "Ingrese la cantidad que desea vender";
			leer cantidadParaVender;
			Si cantidadParaVender <= stockDelProducto y cantidadParaVender > 0 Entonces
				nuevoStock = stockDelProducto - cantidadParaVender; 
				Escribir "Se vendera la cantidad de:  ", cantidadParaVender;
				Escribir "Usted debe pagar un total de: ", totalAPagar(producto, cantidadParaVender, posicionProducto); 
				Escribir "Quedando un Stock del producto de: ", nuevoStock;
				producto[posicionProducto, 2] = nuevoStock;
			SiNo
				Escribir "Ingrese una cantidad acorde al inventario mostrado";
			FinSi
		FinSi
	FinSi
	presioneParaVolverAlMenuPrincipal();
FinFuncion

Funcion resultado <- totalAPagar (producto Por Referencia,cantidadParaVender, posicionProducto)
resultado = cantidadParaVender * producto[posicionProducto, 3];
FinFuncion

// Ingresar un determinado producto causando que se incremente el stock del mismo
Funcion ingresarProducto(contador Por Referencia, cantMaxProducto, producto Por Referencia, nombreProducto Por Referencia)
	Borrar Pantalla
	Escribir "||||||||||||******  Menu de Ingreso de Productos  ******||||||||||||";
	//Validacion de maximos productos
	Si contador >= cantMaxProducto Entonces
		Escribir "";
		Escribir "Ha alcanzado la cantidad maxima de productos para ingresar";
		
	SiNo
		// Definimos variables
		Definir codigo como entero;
		Definir catindad como entero;
		Definir precio como entero;
		Definir nombre como texto;
		Definir categoria como texto;
		Definir datosValidos como logica;
		
		// Inicializamos variables
		codigo = 0;
		cantidad = 0;
		precio = 0;
		nombre = "";
		categoria = "";
		datosValidos = verdadero;
		
		Escribir "Ingrese el codigo del Producto";
		Leer codigo;
		Escribir "Ingrese la cantidad del Producto";
		Leer cantidad;
		Escribir "Ingrese el nombre del Producto";
		Leer nombre;
		Escribir "Ingrese el precio del Productos";
		Leer precio;
		Escribir "Ingrese la categoria/detalle del Producto";
		Leer categoria;
		Borrar Pantalla
		Escribir "Usted ha ingresado el siguiente producto:";
		Escribir "|COD|    |CANTIDAD|    |NOMBRE|          |PRECIO $ |       |CATEGORIA|";
		Escribir " ",codigo, "       ", cantidad, "           ", nombre, "               ", precio, "                   ", categoria;
		si cantidad < 1 Entonces
			Escribir "Usted ingreso una cantidad incorrecta, la cantidad debe estar entre 1 y ", cantMaxProducto;
			datosValidos = Falso;
		FinSi
		si precio < 1 Entonces
			Escribir "Usted ingreso un precio incorrecto, debe ser mayor a cero.";
			datosValidos = Falso;
		FinSi
		si datosValidos = verdadero Entonces
			guardarProducto(producto, nombreProducto, contador, codigo, cantidad, precio, nombre, categoria);
		SiNo
			Escribir "Ha ingresado datos incorrectos, por lo cual no se guardo el producto";
		FinSi
	FinSi
		presioneParaVolverAlMenuPrincipal();	
FinFuncion

// Guardando en el diccionario de datos del producto
Funcion guardarProducto(producto Por Referencia, nombreProducto Por Referencia, contador Por Referencia, codigo, cantidad, precio, nombre, categoria)
	// Definimos variables
	Definir opcionGuardar como entero;
	opcionGuardar = 1;
	Escribir "";
	Escribir "";
	Escribir "¿Esta seguro de guardar los datos ingresados? (ingrese 1 para guardar o 2 para cancelar):";
	leer opcionGuardar;
	Escribir "";
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
			Escribir "La opcion ingresada es incorrecta, no se guardo el producto";
			presioneParaVolverAlMenuPrincipal();	
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


// Busca los productos por codigos y retorna la posicion donde esta el producto
Funcion posicionProducto = buscarProductoPorCodigo(producto, contador, codigo)
	Definir recorrerInventario Como Entero;
	recorrerInventario=1;
	posicionProducto = 0;
	//evaluo dos condiciones: Hasta que: no encuentre el producto (posicionProducto = 0) y el recorrido del producto es menor o igual al maximo del prdouctos que hay guardados en el vector hacer
	Mientras posicionProducto = 0 y recorrerInventario <= contador Hacer 
		// Si el codigo ingresado es igual al producto que estoy recorriendo en ese momento entonces 
		Si codigo = producto[recorrerInventario, 1] Entonces 
			//asignamos la posicion encontrada
			posicionProducto = recorrerInventario; 
		FinSi
		recorrerInventario = recorrerInventario + 1;
	FinMientras
	Si posicionProducto = 0 Entonces
		Escribir "No se encontro el producto en el inventario";
		Escribir "";
	FinSi
FinFuncion

// Vector de productos cargados con un ejemplo de 5 productos
Funcion cargarProductos(producto Por Referencia, nombreProducto Por Referencia)
	
	producto[1, 1] = 1111; // codigo
	producto[1, 2] = 2; // cantidad
	producto[1, 3] = 5100; // precio
	nombreProducto[1, 1] = "caramelo";
	nombreProducto[1, 2] = "dulces";
	
	producto[2, 1] = 2222; // codigo
	producto[2, 2] = 2; // cantidad
	producto[2, 3] = 4200; // precio
	nombreProducto[2, 1] = "chupetin";
	nombreProducto[2, 2] = "dulces";
	
	producto[3, 1] = 3333; // codigo
	producto[3, 2] = 2; // cantidad
	producto[3, 3] = 3300; // precio
	nombreProducto[3, 1] = "gomitas";
	nombreProducto[3, 2] = "dulces";
	
	producto[4, 1] = 4444; // codigo
	producto[4, 2] = 0; // cantidad
	producto[4, 3] = 2400; // precio
	nombreProducto[4, 1] = "alfajor";
	nombreProducto[4, 2] = "dulces";
	
	producto[5, 1] = 5555; // codigo
	producto[5, 2] = 0; // cantidad
	producto[5, 3] = 1500 // precio
	nombreProducto[5, 1] = "galleta";
	nombreProducto[5, 2] = "dulces";
	
FinFuncion

Funcion consultarProductosMasEconomicos(producto, nombreProducto, cantMaxProducto, listarProductos)
	ordenarProductosPorPrecio(producto, nombreProducto, cantMaxProducto);
	imprimirProductosAscendente(listarProductos, producto, nombreProducto);
FinFuncion

Funcion consultarProductosMasCostosos(producto Por Referencia, nombreProducto Por Referencia, cantMaxProducto, listarProductos)
	ordenarProductosPorPrecio(producto, nombreProducto, cantMaxProducto);
	imprimirProductosDescendente(listarProductos, producto, nombreProducto, cantMaxProducto);
FinFuncion

//IMPRIMIR PRODUCTOS DEL 1 al 30
Funcion imprimirProductosAscendente(listarProductos, producto, nombreProducto)
	Borrar Pantalla
	Escribir "||||||||||*****  Productos   ******||||||||||";
	Escribir "";
	Para contProd = 1 Hasta listarProductos Con Paso 1 Hacer
		Escribir "Codigo nº: ", producto[contProd, 1] , " - Precio $ ", producto[contProd, 3], " - Stock  ", producto[contProd, 2], " unidades"," - ",  "Nombre: ", nombreProducto[contProd,1]," - ",  "Categoria: ", nombreProducto[contProd,2];
	FinPara
	Escribir "";
	Escribir "";
FinFuncion

//IMPRIMIR PRODUCTOS DEL 1 al 30
Funcion imprimirProductosDescendente(listarProductos, producto, nombreProducto, cantMaxProducto)
	Borrar Pantalla
	Escribir "||||||||||*****  Los 3 Productos mas costosos son  ******||||||||||";
	Escribir "";
	k = cantMaxProducto;
	Para contProd = 1 Hasta listarProductos Con Paso 1 Hacer
		Escribir "Codigo nº: ", producto[k, 1] , " - Precio $ ", producto[k, 3], " - Stock  ", producto[k, 2], " unidades"," - ",  "Nombre: ", nombreProducto[k,1]," - ",  "Categoria: ", nombreProducto[k,2];
		k = k -1;
	FinPara
	Escribir "";
FinFuncion

// ORDENA POR PRECIO
Funcion ordenarProductosPorPrecio(producto, nombreProducto, cantMaxProducto) 
	Para contador = 1 hasta (cantMaxProducto-1) Hacer
		Para nroActual = 1 hasta (cantMaxProducto-1) Hacer
			Si producto[nroActual,3] > producto[nroActual+1,3] Entonces
				variableAuxiliar1 = producto[nroActual,1];
				variableAuxiliar2 = producto[nroActual,2];
				variableAuxiliar3 = producto[nroActual,3];
				variableAuxiliarNombre1 =nombreProducto[nroActual,1];
				variableAuxiliarNombre2 =nombreProducto[nroActual,2];
				// Ordena codigo cantidad y precio
				producto[nroActual,1] = producto[nroActual+1,1];
				producto[nroActual,2] = producto[nroActual+1,2];
				producto[nroActual,3] = producto[nroActual+1,3];
				producto[nroActual+1,1] = variableAuxiliar1;
				producto[nroActual+1,2] = variableAuxiliar2;
				producto[nroActual+1,3] = variableAuxiliar3;
				// Ordena nombre y categoria 
				nombreProducto[nroActual,1] = nombreProducto[nroActual+1,1];
				nombreProducto[nroActual,2] = nombreProducto[nroActual+1,2];
				nombreProducto[nroActual+1,1] = variableAuxiliarNombre;
				nombreProducto[nroActual+1,2] = variableAuxiliarNombre2;

			FinSi
		FinPara
	FinPara
FinFuncion
	