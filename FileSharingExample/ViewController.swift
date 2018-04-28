//
//  Copyright © 2018 Artem Novichkov. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let fileManager = FileManager.default
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/swiper.jpg"
        let imageData = UIImageJPEGRepresentation(#imageLiteral(resourceName: "swiper"), 0.5)
        fileManager.createFile(atPath: path, contents: imageData, attributes: nil)
        label.text = """
Done 🎉 Next steps:

1. Open Files.app
2. Select Browse tab
3. Select "On My iPhone/iPad" row in Locations section
4. Find a folder with a FileSharingExample name
"""
    }
}
