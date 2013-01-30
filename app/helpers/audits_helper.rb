module AuditsHelper
  def format_audited_object(o)
    the_type = o.auditable_type.underscore.humanize.downcase
    case o.auditable_type
      when 'Campaign'
         if o.audited_changes["name"].present?
           the_type += ": " + o.audited_changes["name"].upcase
         end
    end
    the_type
  end
end
