use std::io::{BufRead,BufReader,Write};
use std::net::{TcpListener, TcpStream};
use std::process::id;
use std::sync::{Arc, Mutex};
use std::collections::HashMap;
use std::thread;
use std::fs;
use std::f32;
use std::time::SystemTime;

//Sección de estructuras de lo que se va a almacenar 

//Backends, raspberrys    
struct Estacion{
    id: String,
    coordenadas: (f64, f64), // no usar f32 ni f128 de ser posible por compatibilidad
    frecuencia:f32,
    semaforo: Semaforo,
    ultima_conexión: std::time::SystemTime,
    ip: String
}
//esta estructura se almacena el estado global del backend que son primordiales
//así como su última ip por cualquier cosa

//en ID indica la estacion a la que se refiere, por ejemplo algo como "raspberry_01"
// Los datos que eventualmente se transmitan desde el raspberry deberán de coincidir con las hechas en estas estructuras para hacer eficiente el manejo de información y evitar errores!

enum Semaforo{
    Verde,
    Rojo(String)
}
struct ListaEstaciones{
    estaciones: HashMap<String, Estacion>,

}

impl ListaEstaciones {
    //fn new(estaciones: HashMap<String, Estacion>) -> Self {
    fn new(estaciones: HashMap<String, Estacion>) -> Self {
        Self { estaciones: HashMap::new(),
	}
    }
    
    fn actualizar_estacion(&mut self, //It is a form of borrowing that allows the method to modify the fields or state of the object, while ensuring that the caller retains ownership of the object and can continue to use it after the method call.
			   id: String,
			   x: f64,
			   y: f64,
			   frecuencia:f32,
			   semaforo: Semaforo,
			   // ultima_conexión: std::time::SystemTime## esta no la debe definir el servidor nunca!
			   ip: String){
	let estacion = Estacion{
	    id: id.clone(),
	    coordenadas: (x,y),
	    frecuencia: f32,
	    semaforo: estado_semaforo,
	    ultima_conexión: SystemTime::now(),
	    ip,
    	    
	};
	self.estaciones.insert(id, estacion);
	println!("Estación actualizada con éxito: {}", id);
    }
}// descomentar para agregar más funciones dentro de la lista de estaciones.
    // Falta hacer la esctructura de estaciones ahora para flask en el server


//FIN SECCIÓN DE ESTRUCTURAS y 


//COMIENZO DE EJECUCIÓN DEL SERVIDOR
fn main() {
    println!("~~~Iniciando servidor OMAR~~~ \n Comenzando a escuchar estaciones!");
    let listener = std::net::TcpListener::bind("127.0.0.1:9999").unwrap();
    for mut stream in listener.incoming().flatten(){
	let mut rdr = std::io::BufReader::new(&mut stream);
	loop{
	    let mut l = String::new();
	    rdr.read_line(&mut l).unwrap();
	    if l.trim().is_empty(){break;}
	    print!("{l}");
	}
	stream.write_all(b"HTTP/1.1 200 OK\r\n\r\nHOLA!").unwrap();
    }
}
