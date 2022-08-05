//
//  TextFileStyle.swift
//  DemoComponente
//
//  Created by user217123 on 8/4/22.
//
public enum TextFileStyle: Int{
    case none = 0
    case uno = 1
    case dos = 2
    case tres = 3
    case cuatro = 4
    case cinco = 5
    case seis = 6
    var valorSalida: String{
        switch self {
        case .none:
            return "Este No es un caso Valido"
        case .uno:
            return "Este No es un caso Valido"
        case .dos:
            return "Este No es un caso Valido"
        case .tres:
            return "Este No es un caso Valido"
        case .cuatro:
            return "Este No es un caso Valido"
        case .cinco:
             return "Este No es un caso Valido"
        case .seis:
            return "Este No es un caso Valido"
        }
    }
}
