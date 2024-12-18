class OccurrencesController < ApplicationController
  def index
    month_start = params.fetch(:start_date, Date.current).to_time.beginning_of_month
    @occurrences = Occurrence.all.publicly_visible.between \
      month_start.beginning_of_week, month_start.end_of_month.end_of_week
  end
end
