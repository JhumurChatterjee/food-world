ActiveAdmin.register Restaurant do
  config.create_another = true
  permit_params :name,
                :street_address,
                :phone_number,
                :state_id,
                :country_id,
                :delivery_type,
                :food_type,
                :delivery_emergency,
                :city_id,
                images: [],
                foods_attributes: [:id, :name, :food_type, :continental, :_destroy, images: []]

  controller do
    helper "active_admin/restaurants"
  end

  member_action :delete_uploaded_image, method: :delete do
   @pic = ActiveStorage::Attachment.find(params[:id])
   @pic.purge_later
   redirect_back(fallback_location: url_for(action: "show", id: params[:restaurant_id]))
  end

  form multipart: true do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Restaurant" do
      f.input :name
      f.input :street_address,     label: "Street"
      f.input :phone_number,       label: "Phone Number"
      f.input :city,               as: :select, collection: City.all.map{ |c| [c.name, c.id] }, input_html: { class: "select2" }
      f.input :state,              as: :select, collection: State.all.map{ |s| [s.name, s.id] }, input_html: { class: "select2" }
      f.input :country,            as: :select, collection: Country.all.map{ |c| [c.name, c.id] }, input_html: { class: "select2" }
      f.input :delivery_type,      label: "Type", as: :select, collection: Restaurant.delivery_types.map { |type| [type.first.humanize.titleize, type.first] }
      f.input :food_type,          label: "Food Type", as: :select, collection: Restaurant.food_types.map { |type| [type.first.humanize.titleize, type.first] }
      f.input :delivery_emergency, label: "Delivery Type", as: :select, collection: Restaurant.delivery_emergencies.map { |type| [type.first.humanize.titleize, type.first] }
      f.input :images,             as: :file, input_html: { multiple: true }, hint: show_preview(f.object).join("").html_safe + "Please upload file having extensions like JPEG or PNG"
    end

    f.inputs "Add Foods"do
      f.has_many :foods, allow_destroy: true do |a|
        a.input :name
        a.input :food_type,   label: "Type", as: :select, collection: Food.food_types.map { |type| [type.first.humanize.titleize, type.first] }
        a.input :continental, label: "International Types", as: :select, collection: Food.continentals.map { |type| [type.first.humanize.titleize, type.first] }
        a.input :images,      as: :file, input_html: { multiple: true }, hint: show_preview(a.object).join("").html_safe + "Please upload file having extensions like JPEG or PNG"
      end

      f.actions
    end
  end

  show do
    panel "Table of Contents" do
      attributes_table_for restaurant do
        row :name
        row :street_address
        row :phone_number

        row "City" do |restaurant|
          restaurant.city.name
        end

        row "State" do |restaurant|
          restaurant.state.name
        end

        row "Country" do |restaurant|
          restaurant.country.name
        end

        row :delivery_type
        row :food_type
        row :delivery_emergency

        row "Images" do |restaurant|
          table do
            restaurant.images.each do |image|
              tr do
                td do
                  link_to image_tag(image.representation(resize: "100x100")), image
                end
                td do
                  link_to "delete", delete_uploaded_image_admin_restaurant_path(id: image.id, restaurant_id: resource.id), method: :delete, data: { confirm: "Are you sure?" }
                end
              end
            end
          end
        end
      end
    end

    tabs do
      tab :food do
        table_for resource.foods.each do
          column :name
          column :food_type
          column :continental

          column "Images" do |food|
            ul do
              food.images.each do |image|
                li do
                  span do
                    link_to image_tag(image.representation(resize: "100x100")), image
                  end
                  span do
                    link_to "delete", delete_uploaded_image_admin_restaurant_path(id: image.id, restaurant_id: resource.id), method: :delete, data: { confirm: "Are you sure?" }
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
