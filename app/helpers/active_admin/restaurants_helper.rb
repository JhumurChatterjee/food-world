module ActiveAdmin::RestaurantsHelper
  def show_preview(obj)
    obj.images.map do |img|
      link_to image_tag(img.representation(resize: "100x100")), img
    end
  end
end
