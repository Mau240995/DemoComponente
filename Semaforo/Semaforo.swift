//
//  Semaforo.swift
//  DemoComponente
//
//  Created by user217123 on 8/4/22.
//

import UIKit
open class Semaforo: UIView{
    
    @IBOutlet weak var objTercero: UIView!
    @IBOutlet weak var objSegundo: UIView!
    @IBOutlet weak var objPrimero: UIView!
    
    @IBOutlet weak var objLabel: UILabel!
    @IBOutlet var content: UIView!
    public var alingText:NSTextAlignment = .left

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.commanInit()
        self.aling()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commanInit()
        self.aling()
    }
    public func commanInit(){
        let vista = UINib(nibName: "Semaforo", bundle: Bundle(for: Self.self))
        vista.instantiate(withOwner: self, options: nil)
        content.frame = self.bounds
        addSubview(content)
        self.aling()
    }
    public func aling(){
        self.objLabel.textAlignment = alingText
    }
    public func setText(text:String){
        self.objLabel.text = text
        
    }
    
    public func verde(text:String){
        objPrimero.backgroundColor = .green
        objSegundo.backgroundColor = .green
        objTercero.backgroundColor = .green
        objLabel.text = text
        
    }
    public func amarillo(text:String){
        objPrimero.backgroundColor = .yellow
        objSegundo.backgroundColor = .yellow
        objTercero.backgroundColor = .cyan
        objLabel.text = text
    }
    public func rojo(text:String){
        objPrimero.backgroundColor = .red
        objSegundo.backgroundColor = .cyan
        objTercero.backgroundColor = .cyan
        objLabel.text = ""
    }
    public func inicial(text:String){
        objPrimero.backgroundColor = .cyan
        objSegundo.backgroundColor = .cyan
        objTercero.backgroundColor = .cyan
        objLabel.text = text
    }
    
    
}
