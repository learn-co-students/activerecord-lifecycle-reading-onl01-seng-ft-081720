class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case 

  #new code!!
  #is called after validations so it never makes it to this
  # before_save :make_title_case

  # change to before_validation, this happens before validation
  before_validation :make_title_case

  #new code
  #use before_save when validations wont interfere with the methods
  before_save :email_author_about_post

  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    #Rails provides a String#titlecase method
    self.title = self.title.titlecase
  end

  def email_author_about_post

  end
end
