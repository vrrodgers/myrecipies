module RecipesHelper
  def image_generator(height:, width:)
    "http://placehold.it/#{height}x#{width}"
  end
  
  def recipes_img img
    if img.model.image?
      img
    else 
      image_generator(height: '600', width: '400')
    end
  end
end
