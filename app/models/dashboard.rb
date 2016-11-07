class Dashboard
  include ActiveModel::Model
  include ActiveModel::Serialization

  attr_accessor :params, :report

  def selected
    @selected ||= Address.where(id: params[:address_id]).first
  end

  def addresses
    @addresses ||= Address.find_addresses(params, report.id, without_id: params[:address_id])
  end

  def id
    "lol"
  end

  def report
    @report ||= Report.get_report(params)
  end
end
