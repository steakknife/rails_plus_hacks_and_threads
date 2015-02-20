require 'action_view'

module DateFormatHelper
  extend ActionView::Helpers::DateHelper

  RELATIVE_TIME = true

  def ago(time)
    humanize(time - Time.now)
  end

  def humanize(secs)
    ago = (secs < 0)
    secs = -secs if ago
    result = []
    [ [:millennium, 1000.years], [:century, 100.years], [:decade, 10.years], [:year, 1.year],
      [:month, 1.month], [:week, 1.week], [:day, 1.day], [:hour, 1.hour], [:minute, 1.minute],
      [:second, 1.second]
    ].map { |name, count|
      n, secs = (count == 1 || secs == 0) ? [secs, secs] : secs.divmod(count)
      result << "#{n} #{name.to_s.pluralize(n)}" if (n > 0) || (count == 1 && result.empty?)
    }
    result << 'ago' if ago
    result.join(' ')
  end

  def roughly_ago(time)
    time_ago_in_words(time) + ' ago' if time
  end
end
