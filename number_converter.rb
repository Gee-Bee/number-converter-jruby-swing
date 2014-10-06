require 'java'

import javax.swing.JFrame
import javax.swing.JComboBox
import javax.swing.JButton
import javax.swing.JPanel
import javax.swing.JLabel
import javax.swing.JTextField

import java.awt.GridLayout

class NumberConverter < javax.swing.JFrame
  def initialize
    super 'Number Format Converter'

    main = JPanel.new
    main.set_layout GridLayout.new(3,3,2,2)
    main.add JLabel.new('Convert From : ', JLabel::RIGHT)
    main.add @cmbFrom = JComboBox.new
    main.add @input = JTextField.new(15)
    main.add JLabel.new('Convert To : ', JLabel::RIGHT)
    main.add @cmbTo = JComboBox.new
    main.add result = JTextField.new(15)
    result.set_editable false
    main.add JLabel.new(' ')
    main.add btn = JButton.new('CONVERT')
    btn.add_action_listener do |evt|
      result.set_text convert
    end
    num_formats = %w(Decimal Binary HexaDecimal Octal)
    num_formats.each {|format| @cmbFrom.add_item(format); @cmbTo.add_item(format)}
    get_content_pane().add 'Center', main

    set_size 400,140
    set_visible true
    set_default_close_operation javax.swing.JFrame::EXIT_ON_CLOSE
  end

  def convert
    case @cmbFrom.selected_item
    when 'Decimal'
      case @cmbTo.selected_item
      when 'Decimal'
        @input.text
      when 'Binary'
        @input.text.to_i.to_s(2)
      when 'HexaDecimal'
        @input.text.to_i.to_s(16)
      when 'Octal'
        @input.text.to_i.to_s(8)
      end
    when 'Binary'
      case @cmbTo.selected_item
      when 'Decimal'
        @input.text.to_i(2).to_s
      when 'Binary'
        @input.text
      when 'HexaDecimal'
        @input.text.to_i(2).to_s(16)
      when 'Octal'
        @input.text.to_i(2).to_s(8)
      end
    when 'HexaDecimal'
      case @cmbTo.selected_item
      when 'Decimal'
        @input.text.to_i(16).to_s
      when 'Binary'
        @input.text.to_i(16).to_s(2)
      when 'HexaDecimal'
        @input.text
      when 'Octal'
        @input.text.to_i(16).to_s(8)
      end
    when 'Octal'
    end
  end
end

num_converter = NumberConverter.new
