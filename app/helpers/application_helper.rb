module ApplicationHelper
  def profile_img(user)
    return image_tag(user.avatar, :size => "150x150", alt: user.name) if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end
    image_tag(img_url, :size => "auto", alt: user.name)
  end

  def profile_img_users(user)
    return image_tag(user.avatar, :size => "60x60", alt: user.name) if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end
    image_tag(img_url, :size => "60x60", alt: user.name)
  end

  def profile_img_topics(user)
    return image_tag(user.avatar, :size => "40x40", alt: user.name) if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end
    image_tag(img_url, :size => "40x40", alt: user.name)
  end

  def profile_img_header(user)
    return image_tag(user.avatar, :size => "20x20", alt: user.name) if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end
    image_tag(img_url, :size => "20x20", alt: user.name)
  end

end
