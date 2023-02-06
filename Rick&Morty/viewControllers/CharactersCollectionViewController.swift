//
//  ViewController.swift
//  Rick&Morty
//
//  Created by Adrian Ulgar on 26/10/2022.
//

import UIKit

class CharactersCollectionViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    private var charactersViewModel: CharactersViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        hideKeyboardWhenTappedAround()
        searchBar.delegate = self
        charactersViewModel = CharactersViewModel.init(networkService: NetworkService())
       loadCharacters()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    func loadCharacters(){
        Task {
            charactersViewModel!.getCharacters(completion: { responseBool in
                if responseBool {
                    self.collectionView.reloadData()
                }
            })
        }
    }
}

extension CharactersCollectionViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        charactersViewModel?.currentSearchQuery = searchBar.text ?? ""
        charactersViewModel?.currentPage = 1
        charactersViewModel?.charactersSubject.removeAll()
        charactersViewModel!.getCharacters(completion: { responseBool in
            if responseBool {
                self.collectionView.reloadData()
                self.view.endEditing(true)
            }
        })
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == "" {
            charactersViewModel?.currentSearchQuery = searchBar.text ?? ""
            charactersViewModel?.currentPage = 1
            charactersViewModel?.charactersSubject.removeAll()
            charactersViewModel!.getCharacters(completion: { responseBool in
                if responseBool {
                    self.collectionView.reloadData()
                }
            })
        }
    }
}


extension CharactersCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return charactersViewModel?.charactersSubject.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CharacterCollectionViewCell.reuseIdentifier,
              for: indexPath) as! CharacterCollectionViewCell
        
        if let character = charactersViewModel?.charactersSubject[indexPath.row] {
            cell.setupCell(character: character)
        }
        
        if indexPath.row >= (charactersViewModel!.charactersSubject.count) - 1 {
            loadCharacters()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
            let width  = ( (view.frame.width)/2 ) - 20
            return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let character: Character = charactersViewModel?.charactersSubject[indexPath.row] {
            let viewc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: CharacterDetailViewController.identifier) as? CharacterDetailViewController
            viewc?.character = character
            self.navigationController?.present(viewc!, animated: true)
//            self.navigationController?.pushViewController(viewc!, animated: true)
        }
    }
}
