// (ↄ) COPYLEFT ALL WRONGS RESERVED

import UIKit
@testable import UIKit_Extensions

class UIViewReusingTableViewCell: UITableViewCell, UITableViewCellReusing {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
