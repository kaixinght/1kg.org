# == Schema Information
# Schema version: 20090430155946
#
# Table name: school_locals
#
#  id                  :integer(4)      not null, primary key
#  school_id           :integer(4)
#  incoming_from       :string(255)
#  incoming_average    :string(255)
#  ngo_support         :integer(1)
#  ngo_name            :string(255)
#  ngo_start_at        :datetime
#  ngo_contact         :string(255)
#  ngo_contact_via     :string(255)
#  advice              :text
#  advice_html         :text
#  last_modified_at    :datetime
#  last_modified_by_id :integer(4)
#

class SchoolLocal < ActiveRecord::Base
  include BodyFormat
  
  belongs_to :school
  
  before_save :format_content
  
  private
  def format_content
    advice.strip! if advice.respond_to?(:strip!)
    self.advice_html = advice.blank? ? '' : formatting_body_html(advice)
  end
end
