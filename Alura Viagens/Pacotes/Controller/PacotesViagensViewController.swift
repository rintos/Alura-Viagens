//
//  PacotesViagensViewController.swift
//  Alura Viagens
//
//  Created by Victor on 22/10/2018.
//  Copyright © 2018 Rinver. All rights reserved.
//

import UIKit

class PacotesViagensViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UISearchBarDelegate, UICollectionViewDelegate{

    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    
    @IBOutlet weak var perquisarViagens: UISearchBar!
    
    @IBOutlet weak var labelContadorPacotes: UILabel!
    
    let listaComTodasAsViagens:Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    var listaViagens:Array<Viagem> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaViagens = listaComTodasAsViagens
        colecaoPacotesViagem.dataSource = self
        colecaoPacotesViagem.delegate = self
        perquisarViagens.delegate = self
        self.labelContadorPacotes.text = self.atualizaContador()
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
       // celulaPacote.backgroundColor = UIColor.blue
        let viagemAtual = listaViagens[indexPath.item]
        celulaPacote.labelTitulo.text = viagemAtual.titulo
        celulaPacote.labelQuantidadeDias.text = "\(viagemAtual.quantidadeDeDias) dias"
        celulaPacote.labelPreco.text = viagemAtual.preco
        celulaPacote.imagemViagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
        
       celulaPacote.layer.borderWidth = 0.5
        celulaPacote.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        celulaPacote.layer.cornerRadius = 8
        
        return celulaPacote
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let larguraCollection = collectionView.bounds.width / 2
        return CGSize(width: larguraCollection - 15, height: 175)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhes") as! DetalhesViagemViewController
        self.present(controller, animated: true, completion: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      //  print(searchBar.text!)
        listaViagens = listaComTodasAsViagens
        if searchText != "" {
            let filtroListaViagem = NSPredicate(format: "titulo contains[c] %@", searchText)
            let listaFiltrada:Array<Viagem> = (listaViagens as NSArray).filtered(using: filtroListaViagem) as! Array
            listaViagens = listaFiltrada
        }
        self.labelContadorPacotes.text = self.atualizaContador()
        colecaoPacotesViagem.reloadData()
    }
    
    func atualizaContador() -> String {
        return listaViagens.count == 1 ? "1 Pacote encontrado" : "\(listaViagens.count) pacotes encontrados kkkk"
    }
    
    
    
    
    
    

}
