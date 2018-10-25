//
//  Viagem.swift
//  Alura Viagens
//
//  Created by Victor on 16/10/2018.
//  Copyright © 2018 Rinver. All rights reserved.
//

import UIKit

class Viagem: NSObject {
    @objc let titulo: String
    let quantidadeDeDias: String
    let preco: String
    let caminhoDaImagem: String
    
    init(titulo: String, quantidadeDeDias: String, preco:String, caminhoDaImagem:String){
        self.titulo = titulo
        self.quantidadeDeDias = quantidadeDeDias
        self.preco = preco
        self.caminhoDaImagem = caminhoDaImagem
    }
}
