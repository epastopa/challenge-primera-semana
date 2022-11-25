
import UIKit

class Usuario {
    let nombre: String
    let apellidoPaterno: String
    let apellidoMaterno: String
    let fechaNacimiento: String
    let numeroDNI: String
    let sexo: String
    let correo: String
    let cantidadHermanos: Int
    var usuario: String? = nil
    
    init(nombre: String, apellidoPaterno: String, apellidoMaterno: String, fechaNacimiento: String, numeroDNI: String, sexo: String, correo: String, cantidadHeramanos: Int) {
        self.nombre = nombre;
        self.apellidoPaterno = apellidoPaterno
        self.apellidoMaterno = apellidoMaterno
        self.fechaNacimiento = fechaNacimiento
        self.numeroDNI = numeroDNI
        self.sexo = sexo
        self.correo = correo
        self.cantidadHermanos = cantidadHeramanos
        self.usuario = correo.components(separatedBy: "@")[0]
    }
}

// Crear usuarios para las personas

let usuario1 = Usuario(nombre: "CARLOS JOSÉ", apellidoPaterno: "ROBLES", apellidoMaterno: "GOMES", fechaNacimiento: "06/08/1995", numeroDNI: "78451245", sexo: "M", correo: "carlos.roblesg@hotmail.com", cantidadHeramanos: 2)

let usuario2 = Usuario(nombre: "MIGUEL ANGEL", apellidoPaterno: "QUISPE", apellidoMaterno: "OTERO", fechaNacimiento: "28/12/1995", numeroDNI: "79451654", sexo: "M", correo: "miguel.anguel@gmail.com", cantidadHeramanos: 0)

let usuario3 = Usuario(nombre: "KARLA ALEXANDRA", apellidoPaterno: "FLORES", apellidoMaterno: "ROSAS", fechaNacimiento: "15/02/1997", numeroDNI: "77485812", sexo: "F", correo: "Karla.alexandra@hotmail.com", cantidadHeramanos: 1)

let usuario4 = Usuario(nombre: "NICOLAS", apellidoPaterno: "QUISPE", apellidoMaterno: "ZEBALLOS", fechaNacimiento: "08/10/1990", numeroDNI: "71748552", sexo: "M", correo: "nicolas123@gmail.com", cantidadHeramanos: 1)

let usuario5 = Usuario(nombre: "PEDRO ANDRE", apellidoPaterno: "PICASSO", apellidoMaterno: "BETANCUR", fechaNacimiento: "17/05/1994", numeroDNI: "74823157", sexo: "M", correo: "pedroandrepicasso@gmail.com", cantidadHeramanos: 2)

let usuario6 = Usuario(nombre: "FABIOLA MARIA", apellidoPaterno: "PALACIO", apellidoMaterno: "VEGA", fechaNacimiento: "02/02/1992", numeroDNI: "76758254", sexo: "F", correo: "fabi@hotmail.com", cantidadHeramanos: 0)

// Almacenar usuarios en una lista

let usuarios = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6]

// Almacenar usuarios mujeres y hombres en sus respectivas listas

var mujeres: [Usuario] = []
var hombres: [Usuario] = []

for usuario in usuarios {
    if (usuario.sexo == "F") {
        mujeres.append(usuario)
    } else if (usuario.sexo == "M") {
        hombres.append(usuario)
    }
}

print("Cantidad de mujeres: \(mujeres.count)")
print("")

print("Cantidad de hombres: \(hombres.count)")
print("")

// Helpers

func getDate(from: String) -> Date? {
    let dateString = from
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    let date = dateFormatter.date(from: dateString)
    
    return date
}

func printInfo(from: Usuario) {
    let firstName = from.nombre.components(separatedBy: " ")[0]
    let apellidoPaterno = from.apellidoPaterno
    let inicialApellidoMaterno = from.apellidoMaterno.first!
    
    //    print(from.usuario!)
    print("\(firstName) \(apellidoPaterno) \(inicialApellidoMaterno).".capitalized)
}

// Identificar el usuario con mayor edad

var oldestUserIndex = 0

for index in usuarios.indices {
    let oldestUser = usuarios[oldestUserIndex]
    let oldestUserBirthday = getDate(from: oldestUser.fechaNacimiento)!
    
    let currentUser = usuarios[index]
    let currentUserBirthday = getDate(from: currentUser.fechaNacimiento)!
    
    if (oldestUserBirthday > currentUserBirthday){
        oldestUserIndex = index
    }
}

print("Usuario con mayor edad: ", terminator: "")
printInfo(from: usuarios[oldestUserIndex])
print("")

// Identificar el usuario con menor edad

var youngestUserIndex = 0

for index in usuarios.indices {
    let youngestUser = usuarios[youngestUserIndex]
    let youngestUserBirthday = getDate(from: youngestUser.fechaNacimiento)!
    
    let currentUser = usuarios[index]
    let currentUserBirthday = getDate(from: currentUser.fechaNacimiento)!
    
    if (youngestUserBirthday < currentUserBirthday){
        youngestUserIndex = index
    }
}

print("Usuario con menor edad: ", terminator: "")
printInfo(from: usuarios[youngestUserIndex])
print("")

// Alamecenar los usuarios con más de dos hermanos

var usersWithMoreThanTwoBrothers = usuarios.filter { $0.cantidadHermanos > 2 }
print("Usuarios con más de dos hermanos: \(usersWithMoreThanTwoBrothers.count)")
print("")

// Listar todos los usuarios (con un formato especīfico)

print("Lista de usuarios:")
for usuario in usuarios {
    printInfo(from: usuario)
}
