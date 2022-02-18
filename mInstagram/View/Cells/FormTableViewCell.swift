//
//  FormTableViewCell.swift
//  mInstagram
//
//  Created by Huang YangChing on 2022/2/16.
//

import UIKit

protocol FormTableViewCellDelegate{
    func formTableViewCell(_ cell:FormTableViewCell,didUpdateField updateModel:EditorProfileFormModel?)
}

class FormTableViewCell: UITableViewCell,UITextFieldDelegate {

    static let identifier = "FormTableViewCell"
    
    private var model:EditorProfileFormModel?
    
    public var delegate:FormTableViewCellDelegate?
    
    private let formLabel :UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let field : UITextField = {
        let field = UITextField()
        field.returnKeyType = .done
        return field
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(formLabel)
        contentView.addSubview(field)
        selectionStyle = .none
        field.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: EditorProfileFormModel){
        self.model = model
        formLabel.text = model.label
        field.placeholder = model.placeholder
        field.text = model.value
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        formLabel.text = nil
        field.placeholder = nil
        field.text = nil
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        
        formLabel.frame = CGRect(x: 5, y: 0,
                                 width: contentView.width/3, height: contentView.height)
        
        field.frame = CGRect(x: formLabel.right + 5, y: 0,
                             width: contentView.width-10-formLabel.width, height: contentView.height)
    }
        
    //MARK -- field
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        model?.value = textField.text
        guard let model = model else {
            return true
        }
        delegate?.formTableViewCell(self, didUpdateField: model)
        textField.resignFirstResponder()
        return true
    }
}
