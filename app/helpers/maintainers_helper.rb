module MaintainersHelper
  def maintainers_list
    %w[city commune category]
  end

  def partial_action
    case action_name
    when 'index' then 'list'
    when 'new', 'edit' then 'form'
    else
      'list'
    end
  end

  def entity_collection(attr, *args)
    options = args.extract_options!
    pp options
    collection = attr.split('_id')[0].classify.constantize.all.select(:id, :name)
    collection_select :entity, attr, collection,
                      :id, :name,
                      options, class: 'form-control'
  end
end
