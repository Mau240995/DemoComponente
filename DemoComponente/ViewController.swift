//
//  ViewController.swift
//  DemoComponente
//
//  Created by user217123 on 8/4/22.
//

import UIKit

class ViewController: UIViewController {

@IBOutlet weak var SemaforoUno: Semaforo!
    
    @IBOutlet weak var campoDeTexto: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SemaforoUno.isHidden = true
        
       // self.SemaforoUno.rojo(text: "es debil")
       // self.SemaforoUno.alingText = .left
       // self.SemaforoDos.alingText = .center
        //self.SemaforoTres.alingText = .right
       // self.SemaforoUno.aling()
        //.SemaforoDos.aling()
        //self.SemaforoTres.aling()
       // self.SemaforoUno.setText(text: "Debil")
        //.SemaforoDos.setText(text: "Medium")// self.SemaforoTres.setText(text: "Fuerte")
    }

    @IBAction func eventoCambio(_ sender: Any) {
        if campoDeTexto.text?.count ?? 0 > 2 {
            SemaforoUno.isHidden = false
            SemaforoUno.inicial(text: "")
            var repustaEnTexto = ""
            var valor: Double = 1.0
            
            let validaciones = campoDeTexto.text?.validate([.noRepeat(true),.noConsecutivos(true),.minumCharacter(true)])
           
            if let v = validaciones {
                for aux in v {
                    switch aux {
                    case .noRepeat(let resultado):
                        valor = valor - (resultado ? 0 : 02)
                    case .noConsecutivos(let resultado):
                        valor = valor - (resultado ? 0 : 02 )
                    case .minumCharacter(let resultado):
                        valor = valor - (resultado ? 0 : 02 )
                        
                    }
                }
            }
            if valor == 1.0{
                SemaforoUno.verde(text: "Tu clave es Fuerte")
            }else{
                if valor >  0.69{
                    SemaforoUno.amarillo(text: "Su clave es mediantemente Fuerte")
                }else{
                    SemaforoUno.rojo(text: "Su clave es debil")
                }
            }
           /* if noRepeat(code: campoDeTexto.text!){
                valor = valor - 0.3
        
            }
            if noConsecutivos(code: campoDeTexto.text!){
                valor = valor - 0.3
            }
            print(valor)*/
        }
            else{
            SemaforoUno.isHidden = true
        }
    }
    /*func noRepeat(code:String
    ) -> Bool{
      let bandera = "([\\d])\\1\\1"
        return code.range(of: bandera, options: .regularExpression) == nil
    }
    func noConsecutivos(code:String)-> Bool{
        let bandera = "\\d*(012|123|234|345|456|567|678|789)\\d*"
        return code.range(of: bandera, options: .regularExpression) == nil
    }*/
    
}
extension String {
    enum validation{
        case noRepeat(Bool)
        case noConsecutivos(Bool)
        case minumCharacter(Bool)
        var resultado:String {
            switch self {
            case .noRepeat(_): return "Su contrasenia tiene numeros repetidos"
            case .noConsecutivos(_): return "Su contrasenia tiene numeros consetivos"
            case .minumCharacter(_): return  "Su contrasenia no contine la cantidad de caracteres necesarios"
            }
        }
    }
    func validate(_ validate: [validation] ) -> [validation]{
        return validate.map{
            validando($0)
        }
        
    }
    func validando(_ avalidar: validation) -> validation {
        switch avalidar {
        case .noRepeat(_):
            let bandera = "([\\d])\\1\\1"
            return .noRepeat(self.range(of: bandera, options: .regularExpression) == nil)
            
        case .noConsecutivos(_):
            let bandera = "\\d*(012|123|234|345|456|567|678|789)\\d*"
            return .noConsecutivos(self.range(of: bandera, options: .regularExpression) == nil)
        
        case .minumCharacter(_):
            return .minumCharacter(self.count > 6)
        }
    }
}

