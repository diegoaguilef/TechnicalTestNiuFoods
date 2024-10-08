class RefreshDashboardJob
  include Sidekiq::Job

  def perform(*args)
    restaurants = Restaurant.all
    rendered_table = ApplicationController.render(
      partial: 'home/restaurants_statuses_table',
      locals: { restaurants: restaurants }
    )
    ActionCable.server.broadcast 'dashboard_channel', { restaurants_table: rendered_table }
  end
end
