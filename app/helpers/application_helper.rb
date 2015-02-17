module ApplicationHelper
  # credit: http://firehawkcreative.com/blog/elegant-titles-and-seo-meta-tags-in-rails
  def title(tags = nil)
    if tags.present?
      content_for? :title, tags
    else
      content_for?(:title) ? yield(:title) : I18n.t('site_title')
    end
  end

  def meta_keywords(tags = nil)
    if tags.present?
      content_for :meta_keywords, tags
    else
      content_for?(:meta_keywords) ? content_for(:meta_keywords) : I18n.t('site_keywords')
    end
  end

  def meta_description(desc = nil)
    if desc.present?
      content_for :meta_description, desc
    else
      content_for?(:meta_description) ? content_for(:meta_description) : I18n.t('site_description')
    end
  end
end
