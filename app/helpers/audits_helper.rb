module AuditsHelper
  def format_audited_object(o)
    the_type = o.auditable_type.underscore.humanize.downcase
    case o.auditable_type
      when 'Campaign'
         if o.audited_changes["name"].present?
           new_name = o.audited_changes["name"]
           if new_name.kind_of?(Array)
             new_name = new_name.last
           end
           the_type += ": " + new_name.upcase
         end
    end
    the_type
  end
end
