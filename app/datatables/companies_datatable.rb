class CompaniesDatatable < BaseDatatable
  datatable do
    order :updated_at, :desc

    col :name

    val :location do |record|
      "#{record.location} <a href='https://maps.google.com/maps/search/#{record.location}' target='_blank'><i class='fas fa-map-pin --ga-maps'></i></a>"
    end

    col :services do |record|
      html_strings = record.services.map { |service| content_tag(:span, service, class: "badge badge-info") }
      html_strings.join("&nbsp;")
    end

    col :contact do |record|
      tel_link = "<a href='tel:#{record.phone}'><i class='fa fa-phone'></i></a>"
      email_link = "<a href='mailto:#{record.phone}'><i class='fa fa-envelope'></i></a>"

      tel_link + "&nbsp;&nbsp;" + email_link
    end

    col :updated_at do |record|
      distance_of_time_in_words(record.updated_at, Time.now)
    end
    col :registered_since do |record|
      distance_of_time_in_words(record.created_at, Time.now)
    end

    actions_col show: true, edit: true, destroy: true, btn: "btn-sm btn-outline-primary"
  end

  collection do
    Company.all
  end
end
