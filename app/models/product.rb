class Product < ActiveRecord::Base
    searchkick word_middle: [:title]

  def search_data
    {
      title: title
    
    }
  end
end
