//
//  ViewController.swift
//  VirtualLibrary
//
//  Created by Rishi Jain on 02/06/19.
//  Copyright © 2019 Rishi Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    
    var imageArray = [UIImage(named: "series_1") , UIImage(named: "series_2") , UIImage(named: "series_3") , UIImage(named: "series_4") , UIImage(named: "series_5") , UIImage(named: "series_6") , UIImage(named: "series_7") , UIImage(named: "series_8") ]
    var imageArray1 = [UIImage(named: "movie_1") , UIImage(named: "movie_2") , UIImage(named: "movie_3") , UIImage(named: "movie_4") , UIImage(named: "movie_5") , UIImage(named: "movie_6") , UIImage(named: "movie_7") , UIImage(named: "movie_8") ]
    var imageArray2 = [UIImage(named: "novel_1") , UIImage(named: "novel_2") , UIImage(named: "novel_3") , UIImage(named: "novel_4") , UIImage(named: "novel_5") , UIImage(named: "novel_6") , UIImage(named: "novel_7") , UIImage(named: "novel_8") ]
    
    var movies_links = ["https://www.imdb.com/title/tt2088847/reviews" , "https://www.imdb.com/title/tt1270797/reviews" , "https://www.imdb.com/title/tt8291224/reviews" , "https://www.imdb.com/title/tt8550208/reviews" , "https://www.imdb.com/title/tt1825683/reviews" , "https://www.imdb.com/title/tt6826438/reviews" , "https://www.imdb.com/title/tt1155076/reviews" , "https://www.imdb.com/title/tt4154796/reviews" , "https://www.imdb.com/title/tt7098658/reviews" , "https://www.imdb.com/title/tt6264938/reviews"]
    
    var series_url = [ "https://www.imdb.com/title/tt0108778/reviews" , "https://www.imdb.com/title/tt9095260/reviews" , "https://www.imdb.com/title/tt0944947/reviews" , "https://www.imdb.com/title/tt0460649/reviews" , "https://www.imdb.com/title/tt4156586/reviews" , "https://www.imdb.com/title/tt0898266/reviews" , "https://www.imdb.com/title/tt6077448/reviews" , "https://www.imdb.com/title/tt1520211/reviews" , "https://www.imdb.com/title/tt0455275/reviews" ]
    
    var novels_links = ["http://ahhssummerreading.weebly.com/uploads/1/0/3/7/103700016/all_the_light_we_cannot_see.pdf" ,"https://hpaba.com/pages/en/3-mistake-of-my-life.pdf","https://storiesofalifetimeweb.files.wordpress.com/2017/03/oneindiangirlstoriesofalifetime.pdf","https://storiesofalifetimeweb.files.wordpress.com/2017/04/it-started-with-a-friend-request.pdf","http://mindguruindia.com/wp-content/uploads/2014/06/MP078_Wings-of-fire-by-Abdul-Kalam.pdf","http://cbseacademic.nic.in/web_material/doc/novels/2_The%20Invisible%20Man,%20by%20H.%20G%20-%20Class%20-%20XII.pdf","https://www.apnamba.com/Ebooks-pdf/The%20Monk%20who%20sold%20his%20ferrari%20-%20Robin%20Sharma%20(PDF)%20%5BQwerty80%5D.pdf","http://www.lequydonhanoi.edu.vn/upload_images/S%C3%A1ch%20ngo%E1%BA%A1i%20ng%E1%BB%AF/Rich%20Dad%20Poor%20Dad.pdf","https://storiesofalifetimeweb.files.wordpress.com/2017/01/i-too-had-a-luv-story.pdf","https://storiesofalifetimeweb.files.wordpress.com/2017/01/can-love-happen-twice.pdf"]
    
    @IBOutlet weak var Novels: UICollectionView!
    
    @IBOutlet weak var Series: UICollectionView!
    @IBOutlet weak var Movies: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var size : Int = 0;
        if collectionView == Movies{
            size = imageArray1.count
        }else if collectionView == Novels{
            size = imageArray2.count
        }else if collectionView == Series{
        size = imageArray.count
        }
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        if collectionView == Movies{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
            
            cell.image.image = imageArray1[indexPath.row]
            
        return cell
        }else if collectionView == Novels{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
            
            cell.image.image = imageArray2[indexPath.row]
            
        return cell
        }else if collectionView == Series{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
            
            cell.image.image = imageArray[indexPath.row]
            
        return cell
        }
         return UICollectionViewCell()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        Movies.dataSource = self
        Series.dataSource = self
        Novels.dataSource = self
     //  self.navigationController?.setToolbarHidden(true, animated: false)
       
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desVC = mainStoryBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        if collectionView == Movies{
            print("no1")
            desVC.dataa = movies_links[indexPath.row]
            desVC.uorp = "url"
        }else if collectionView == Series{
            print("no2")
            desVC.dataa = series_url[indexPath.row]
            desVC.uorp = "url"
        }else if collectionView == Novels{
            desVC.dataa = novels_links[indexPath.row]
            desVC.uorp = "pdf"
            print("no3")
        }
        self.navigationController?.pushViewController(desVC, animated: true)
    }

}

